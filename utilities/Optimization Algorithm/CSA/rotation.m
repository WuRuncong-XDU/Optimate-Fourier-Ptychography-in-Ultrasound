function [chameleonPositions] = rotation(chameleonPosition, searchAgents, dim)
for i = 1 : searchAgents      
          if (dim > 2) 
              xmax = 1; xmin = -1;
              th = round(xmin + rand(1, 1) * (xmax - xmin));
              vec = get_orthonormal(dim,2);
              vecA = vec(:, 1);
              vecB = vec(:, 2);
              theta = (th * rand() * 180) * (pi/180) ;
              Rot = RotMatrix(theta,vecA, vecB) ;
             if (theta ~= 0)
                V = chameleonPosition(i, :); 
                V_centre = mean(V, 1);                      % Centre, of line
                Vc = V - ones(size(V, 1), 1) * V_centre;	% Centering coordinates

                Vrc = [Rot * Vc']';	% Rotating centred coordinates
                % Vruc=[Rot * V']';	% Rotating un-centred coordinates
                Vr = Vrc + ones(size(V, 1), 1) * V_centre;	% Shifting back to original location
                chameleonPosition(i, :)=((Vr) / 1); 
 
             end
         else
              xmax = 1; xmin = -1;
              th = round(xmin + rand(1, 1) * (xmax - xmin));
              theta = th * rand() * 180 * (pi/180);
              Rot = RotMatrix(theta);
              
               if (theta~=0)
                V = [chameleonPosition(i,:) ];  
                V_centre = mean(V, 1);                      % Centre, of line
                Vc = V - ones(size(V, 1), 1) * V_centre;	% Centering coordinates

                Vrc = [Rot * Vc']';                         % Rotating centred coordinates
                Vr = Vrc + ones(size(V,1), 1) * V_centre;	% Shifting back to original location
                chameleonPosition(i, :) = ((Vr) / 1);
               end
          end
end  
   chameleonPositions = chameleonPosition;
end