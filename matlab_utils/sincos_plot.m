grad = [0:pi/2000:pi/2];
plot(grad,sin(grad).*cos(grad))
axis([0 pi/2 0 .5])
xlabel ('alpha')
ylabel ('sin(alpha)cos(alpha)')
CH_save_plot

