MATLAB script; 
data=readtable('Siddharth2.xlsx'); 
time=data{:,1}; 
 
figure 
drive_cycle=data{:,3}; 
plot(time,drive_cycle) 
hold on 
velocity=data{:,2}; 
plot(time,velocity) 
 
xlabel('Time (s)') 
ylabel('Speed (mph)') 
grid on 
 
speed_max=data{:,4}; 
plot(time,speed_max) 
 
speed_min=data{:,5}; 
plot(time,speed_min) 
 
legend('Drive Cycle (mph)','Own Velocity (mph)','Upper Limit (mph)','Lower Limit 
(mph)') 
hold off 
 
%Root mean square for the test 
RMSE = sqrt(mean((drive_cycle - velocity).^2)); 
disp(sprintf('Root mean square of the test speed is: %d ',RMSE)) 
 
 
Page | 9  
 
VEHICLE TESTING LABORATORY ASSIGNMENT-2 
%Minimum Root mean squared error for a 60sec window 
first=1.0000; 
second=60.0000; 
i=find(time==first); 
j=find(time==second); 
RMSE_array=[]; 
index=1; 
while(second<length(time)) 
    
    drive_cycle_array=drive_cycle(i:j); 
    velocity_array=velocity(i:j); 
    RMSE_array(index) = sqrt(mean((drive_cycle_array - velocity_array).^2)); 
    index=index+1; 
    
    first=first+1; 
    second=second+1; 
    i=find(time==first); 
    j=find(time==second); 
end 
 
Minimum_RMSE_array=min(RMSE_array); 
disp(sprintf('Minimum Root mean squared error for a 60sec window is: %d 
',Minimum_RMSE_array)) 
