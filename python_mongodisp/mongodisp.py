import pymongo as m
import datetime
# import matplotlib as mp
import matplotlib.pyplot as plt
import numpy as np

# returns a somewhat descriptive string for a certain trip document
def toString(document):
	length = "%05.2f" % document["Length [m]"]
	setup = cleanSetup(str(document["Planner Setup"]))
	return ("t:" + str(document["start_time"]) 
	  + " || l:" + length 
	  + " || s:" + setup)

def cleanSetup(setup):
	setup = setup.replace("\n", "")
	setup = setup.replace("MB_USE_GRID_PATH: ", "")
	setup = setup.replace("base_global_planner: ", "")
	setup = setup.replace("base_local_planner: ", "")
	return setup

def plotRoute(route):
	routearr = np.array(route)
	rax = route_fig.add_subplot(111, aspect='equal')
	rax.plot(routearr[:,0], routearr[:,1])

def plotStats(datdict):
	params = ["Current [As]", "Length [m]", "Duration [ms]"]
	sax = []

	for i in range(len(params)):
		data = []
		names = []
		for k in datdict.keys()	:
			l = datdict[k]
			rd = [] # route data
			for r in l:
				rd.append(r[params[i]])
			data.append(rd)
			names.append(k)

		sax.append(stat_fig.add_subplot(131 + i))
		plt.xticks([1, 2], names)
		plt.title(params[i])
		sax[i].boxplot(data)

# -------------

client = m.MongoClient('mongodb://localhost:27017/')
db = client.nav_analysis
collection = db['trips']
d = datetime.datetime(2015, 02, 06) 				# from date

first = 1
dwa_routes = []
edwa_routes = []

# plot
route_fig = plt.figure()
stat_fig = plt.figure()

for trip in collection.find(
	{"$and": [
		{"start_time": {"$gt": d}},
		{"Length [m]": {"$gt": 5}}
	]}).sort("start_time"):
	print toString(trip)
	# show first route
	# if first:
	# 	first = 0
	plotRoute(trip["covered_route"])
	# decide which local planner was used
	setup = cleanSetup(str(trip["Planner Setup"]))
	if "dwa_local_planner/DWAPlannerROS" in setup:
		dwa_routes.append(trip)
	if "edwa_local_planner/EDWAPlannerROS" in setup:
		edwa_routes.append(trip)
plotStats({"DWA": dwa_routes, "EDWA": edwa_routes})

# route_fig.show()
stat_fig.show()

input("Press Enter to continue...")

