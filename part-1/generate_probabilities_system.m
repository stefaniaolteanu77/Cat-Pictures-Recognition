function [A, b] = generate_probabilities_system(rows)
  A = zeros (rows * (rows + 1) / 2); #initialising matrix A with 0 
  ## crossing through the matrix
  for i = 1 : rows * (rows + 1) / 2
    for j = 1 : rows * (rows + 1) / 2
      ## for the element at the top of the trinagle
      if (i == 1) 
        if (j == i)
          A(i,j) = 4;
        endif
        if (j == i + 1 || j == i + 2)
          A(i,j) = -1;
        endif
      endif
      ## for the element in the left corner of the trinagle
      if (i == rows * (rows - 1) / 2 + 1)
        if (j == i)
          A(i,j) = 4;
        endif
        if (j == i + 1 || j == i - rows + 1)
          A(i,j) = -1;
        endif
      endif
      ## for the element in the right corner of the triangle
      if (i == rows * (rows + 1) / 2)
        if (j == i)
          A(i,j) = 4;
        endif
        if (j == i - 1 || j == i - rows)
          A(i,j) = -1;
        endif
      endif
      ## if situated on the last row of the triangle between the two corners
      if (i > rows * (rows - 1) / 2 + 1 && i < rows * (rows + 1) / 2)
        if (j == i)
          A(i,j) = 5;
        endif
        if (j == i - 1 || j == i + 1 || j == i - rows || j == i - rows + 1)
          A(i,j) = -1;
        endif
      endif
      c = rows - 1;
      ## iterating though every other row of the triangle
      while c > 1
        ## the left corner of the row I am situated on
        if (i == (c - 1) * c / 2 + 1)
          if (j == i)
            A(i,j) = 5;
          endif
          if (j == i + 1 || j == i - c + 1 || j == i + c || j == i + c + 1)
            A(i,j) = -1;
          endif
          break;
        endif
        ## the right corner of the row I am situated on 
        if (i == c * (c + 1) / 2)
          if (j == i)
            A(i,j) = 5;
          endif
          if (j == i - 1 || j == i - c || j== i + c || j == i + c + 1)
            A(i,j) = -1;
          endif
          break;
        endif
        ## I am situated in the middle of the trinagle between lef and right corners
        if (i > (c - 1) * c / 2 + 1 && i < c * (c + 1) / 2)
          if j == i
            A(i,j) = 6;
          endif
          if (j == i - 1 || j == i + 1 || j == i - c ||
              j == i - c + 1 || j == i + c || j == i + c + 1)
            A(i,j) = -1;
          endif
          break;
        endif
        c = c - 1;       
      endwhile
    endfor
  endfor
  
  
  b = zeros (rows * (rows + 1) / 2, 1); #initialising b array with 0
  ## putting 1 on the positions coresponding the last row of the trinagle
  for i = rows * (rows - 1) / 2 + 1 : rows * (rows + 1) / 2
    b(i) = 1;
  endfor
endfunction