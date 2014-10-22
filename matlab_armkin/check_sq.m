function ret = check_sq(x, sq)
  % checks wether coordinate x lies within one of the squares
  ret = 0;
  for i = 1:length(sq(:,1,1))
    if ( x(1) >= sq(i,1,1) & x(1) <= sq(i,1,3) &
         x(2) >= sq(i,2,1) & x(2) <= sq(i,2,3) )
      ret = 1;
    end 
  endfor

end
