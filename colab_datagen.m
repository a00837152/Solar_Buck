clear
clc

open_system('colab_sim')

Vin = 200;
VD = 0.1;
ESR = 2;
R_L = 0.75;
RDS = 0.04;
R = 23;
L = single(460e-6);
C = single(10e-6);

overL = 1/L;
overC = 1/C;
f_m = 800e3;
dt = 1/f_m;

folderpath = 'E:\Matlab\DCConverters\Real-Time-Buck\ColabData\X1';

for j = 1:3000
    R = randi([18 50]);

    overR = 1/R;

    G1 = dt*overL;
    G2 = dt*overC;
    G3 = R/(R+ESR);

    X = sim('colab_sim');
    expectedVarName = 'out.colab';
    % Verificar si la variable se ha creado
    if not( evalin('base', sprintf('exist(''%s'', ''var'')', expectedVarName)) )
    else
        disp(['Ha ocurrido un ERROR ' expectedVarName '.']);
    end
    
    vect = array2table(X.colab,"VariableNames",{'Time', 'Duty', 'Current', 'RMS_Current', 'Voltage', 'Output_Power', 'Load'});
    data = sprintf('archivo_%d.txt', j);
    fileID = fopen(data,'w');
    writetable(vect, data,'Delimiter',';');
    fclose(fileID);
end

