function x = plot_rob(x0, x, th, l, sq)
% draws environment, calculates robot angles and draws robot

  % DRAW STATICS ----------------------------------------------   
  %hold off;
  %plot(x0(1), x0(2), 'rx');
  %axis([0 10 0 10], "image");
  %hold on;
  for i = 1:length(sq(:,1,1))
  %  plot(squeeze(sq(i,1,:)), squeeze(sq(i,2,:)), 'b-');
  endfor
  
  % DRAW ROBOT ------------------------------------------------
  _th = 0;
  for i = 1:length(th)
    _th = _th + th(i);
    if (_th >= 2*pi)
      _th = _th - 2*pi;
    end
    if (i == 1) %first element
      x(i,1) = x0(1) + l(i) * cos(_th);
      x(i,2) = x0(2) + l(i) * sin(_th);
    else
      x(i,1) = x(i-1,1) + l(i) * cos(_th);
      x(i,2) = x(i-1,2) + l(i) * sin(_th);
    end
  endfor
  %plot([x(:,1)], [x(:,2)], 'g-o');
  %plot([x0(1) x(1,1)], [x0(2) x(1,2)], 'g-o'); 
  %axis([0 10 0 10]);
end
