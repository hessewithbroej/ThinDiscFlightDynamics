%generate a 3d visualization of seed trajectories given the set of xyz
%coordinates over time. Also have access to phi and alpha over time, if one
%wanted to color trajectories as a function of phi to demonstrate how the
%range-maximizing orientation extracts lift.
filepath = "C:\Users\hesse\Desktop\Code\ThinDiscFlightDynamics\Data\SimulationData\SeedTrajectories.xlsx";

%read in the data
trajs = {};
opt=detectImportOptions(filepath);
shts=sheetnames(filepath);
for i=2:numel(shts)
  traj = readmatrix(filepath,'Sheet',shts(i),'Range','A2:F1002');
  trajs{i-1} = traj;
end
%% 
% %color triplets for rainbow colormap
% rainbow = [1,        0,             0;
%            1.0000    0.3333         0;
%            1.0000    0.6667         0;
%            1         1              0;
%            0.6667    1.0000         0;
%            0.3333    1.0000         0;
%            0         1.0000         0;
%            0         1.0000         0.3333;
%            0         1.0000         0.6667;
%            0         1.0000         1;
%            0         0.6667         1;
%            0         0.3333         1;
%            0         0              1;
%            0.3333    0              1;
%            0.6667    0              1;
%            1         0              1;
%            1         0              0.6667;
%            1         0              0.3333;
%            0         0              0];


rainbow = [];
for i =0:35

    if i<6
        r = i*(1/6);
        g = 0;
        b = 0;
    elseif i < 12
        r = 1;
        g = mod(i,6)*(1/6);
        b = 0;

    elseif i < 18
        r = 1-mod(i,6)*(1/6);
        g = 1;
        b = 0;

    elseif i < 24
        r = 0;
        g = 1;
        b = mod(i,6)*(1/6);

    elseif i < 30
        r = 0;
        g = 1-mod(i,6)*(1/6);
        b = 1;
    else
        r = 0;
        g = 0;
        b = 1-mod(i,6)*(1/6);
    end

    rainbow(end+1,:) = [r g b];
end

figure
hold on
%plot the trajectory from launch until the first instance where the seed's
%y coordinate goes negative (aka seed has reached the ground)
for i =1:numel(trajs)
    gndrow = find(trajs{i}(:,3) <= 0, 1); %find when seed hits ground
    plot3(trajs{i}(1:gndrow,2), trajs{i}(1:gndrow,4), trajs{i}(1:gndrow,3), 'Color',rainbow(i,:), 'LineWidth', 1.5)
    
end
axis equal
xlabel("X (m)", 'Interpreter','latex','FontSize',16)
ylabel("Z (m)",'Interpreter','latex','FontSize',16)
zlabel("Y (m)",'Interpreter','latex','FontSize',16)
zlim([0,5])
xlim([0,12])
ylim([-6,6])