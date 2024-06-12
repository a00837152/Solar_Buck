clear 
clc

i = 5;
filepath = string(compose('E:\\archivo_%d',i));

table = readtable(filepath);

Time = table2array(table(:,1));
Duty = table2array(table(:,2));
Current = table2array(table(:,3));
RMS_Current = table2array(table(:,4));
Voltage = table2array(table(:,5));
Output_Power = table2array(table(:,6));
Load = table2array(table(:,7));

hold on
plot(Time, Duty);
plot(Time,Voltage);


