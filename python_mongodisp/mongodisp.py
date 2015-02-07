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

# --------------------------------------------------------------------------------------------------------

client = m.MongoClient('mongodb://localhost:27017/')
db = client.nav_analysis
collection = db['trips']

datagroups = {
	"DWA": 
		{"$and": [
			{"start_time": {"$gt": datetime.datetime(2015, 2, 6)}},
			{"Length [m]": {"$gt": 5}},
			{"Planner Setup": {"$regex" : "dwa_local_planner/DWAPlannerROS"}}
		]}, 
	"EDWA v0.6": # hint: 0.6 wg 6th feb
		{"$and": [
			{"start_time": {"$gt": datetime.datetime(2015, 2, 6)}},
			{"start_time": {"$lt": datetime.datetime(2015, 2, 7)}},
			{"Length [m]": {"$gt": 5}},
			{"Planner Setup": {"$regex" : "edwa_local_planner/EDWAPlannerROS"}}
		]}
}

# plot
route_fig = plt.figure()
stat_fig = plt.figure()

groups = {}

keyz = datagroups.keys()
keyz.sort()
for gr in keyz:
	routes = []
	print gr + "========================================"
	for trip in collection.find(datagroups[gr]).sort("start_time"):
		print toString(trip)
		routes.append(trip)
	groups[gr] = routes
	print " count: " + str(collection.find(datagroups[gr]).count())

print "==============================================="


plotStats(groups)

# route_fig.show()
stat_fig.show()

input("Press Enter to continue...")

