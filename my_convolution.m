function result = my_convolution(image, filter)

    [rows, columns] = size(image);                 
    
    result = zeros(rows, columns);

    % performing convolution
    for i = 1:rows
        for j = 1:columns
            
            A = zeros(3,3);
            
            if (i == 1) && (j == 1)
                for k=1 : 3
                    A(i, k) = image(i, k);
                    A(k, j) = image(k, j);
                end
                A(2:3, 2:3) = image(2:3, 2:3);
                temp = A .* filter;
                
            elseif (i == 1) && (j > 1) && (j < columns)
                A(i, 1) = image(i, j-1);
                A(i, 2) = image(i, j);
                A(i, 3) = image(i, j+1);
                A(2:3, 1:3) = image(i:i+1, j-1:j+1);
                temp = A .* filter;
                
            elseif (i < rows) && (i > 1) && (j == columns) 
                A(1, 3) = image(i-1, columns);
                A(2, 3) = image(i, columns);
                A(3, 3) = image(i+1, columns);
                A(1:3, 1:2) = image(i-1:i+1, columns-1:columns);
                temp = A .* filter;
                
            elseif (i > 1) && (i < rows) && (j == 1) 
                A(1, j) = image(i-1, j);
                A(2, j) = image(i, j);
                A(3, j) = image(i+1, j);
                A(1:3, 2:3) = image(i-1:i+1, j:j+1);
                temp = A .* filter;
                
            elseif (i == rows) && (j < columns) && (j > 1)
                A(3, 1) = image(rows, j-1);
                A(3, 2) = image(rows, j);
                A(3, 3) = image(rows, j+1);
                A(1:2, 1:3) = image(rows-1:rows, j-1:j+1);
                temp = A .* filter;
                
            elseif (i == 1) && (j == columns)
                for k=1 : 3
                    A(k, 3) = image(k, columns);
                end
                A(i,1) = image(i, columns-2);
                A(i,2) = image(i, columns-1);
                A(i,3) = image(i, columns);
                A(2:3, 1:2) = image(1:2, columns-1:columns);
                temp = A .* filter;
                
            elseif (i == rows) && (j == 1)
                for k=1 : 3
                    A(3, k) = image(rows, k);
                end
                A(1,j) = image(rows-2, j);
                A(2,j) = image(rows-1, j);
                A(3,j) = image(rows, j);
                A(1:2, 2:3) = image(rows-1:rows, 1:2);
                temp = A .* filter;
                
            elseif (i == rows) && (j == columns)
                A(1,3) = image(rows-2, columns);
                A(2,3) = image(rows-1, columns);
                A(3,1) = image(rows, columns-2);
                A(3,2) = image(rows, columns-1);
                A(3,3) = image(rows, columns);
                A(1:2, 1:2) = image(rows-1:rows, columns-1:columns);
                temp = A .* filter;
               
            else 
                temp = image(i-1:i+1,j-1:j+1) .* filter;
            end
            
            result(i,j) = sum(temp(:));
        end
    end
end