function armkin()
  clear all;
  clc;
  
  % ROBOT -----------------------------------------------------
  %base point
  x0 = [5, 5];
  %start angles
  th = [pi/2, pi/4];
  %lengths elements
  l = [2, 2];
  
  % ENVIRONMENT -----------------------------------------------
  %squares
  sq = zeros(4,2,5);
  sq(1,:,:) = [2.5, 2.5, 3.5, 3.5, 2.5; % 1
               7,   9,   9,   7,   7 ];
  sq(2,:,:) = [7.5, 7.5, 8.5, 8.5, 7.5; % 2
               7.5, 9,   9,   7.5, 7.5];
  sq(3,:,:) = [1.5, 1.5, 3.0, 3.0, 1.5; % 3
               2.5, 4,   4,   2.5, 2.5];
  sq(4,:,:) = [5,   5,   7,   7,   5;   % 4
               1,   4,   4,   1,   1 ];
  
  % CALCULATE JOINT SPACE -------------------------------------
  %animation duration
  t = 1;
  %test resolution   
  res = 100; 
  %coordinates of joints
  x = zeros(length(th), 2);
  
  figure;
  hold on;
  axis([0 2*pi 0 2*pi], 'square');
  
  for i_th = 0:pi*2/res:2*pi
  
    for j_th = 0:pi*2/res:2*pi
  
      th(1) = i_th;
      th(2) = j_th;
   
      x = plot_rob(x0, x, th, l, sq);
      
      o = check_sq(x(end, :), sq);
      if ( 0 < o )
        plot(th(1), th(2), '.r')
      end
      
      o = check_sq(x(1, :), sq);
      if ( 0 < o )
        plot(th(1), th(2), '.g')
      end
   
      %pause (t/res)    
  
    end
  
  end

end  


  
  
