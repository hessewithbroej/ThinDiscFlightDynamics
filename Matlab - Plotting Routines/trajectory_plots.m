%generate a 3d visualization of seed trajectories given the set of xyz
%coordinates over time. Also have access to phi and alpha over time, if one
%wanted to color trajectories as a function of phi to demonstrate how the
%range-maximizing orientation extracts lift.
filepath = "C:\Users\hesse\Desktop\Academic Documents\Seeds\Data\SeedTrajectories.xlsx";

%read in the data
trajs = {};
opt=detectImportOptions(filepath);
shts=sheetnames(filepath);
for i=2:numel(shts)
  traj = readmatrix(filepath,'Sheet',shts(i),'Range','A2:F1002');
  trajs{i-1} = traj;
end

%color triplets for rainbow colormap
rainbow = [1,        0,             0;
           1.0000    0.3333         0;
           1.0000    0.6667         0;
           1         1              0;
           0.6667    1.0000         0;
           0.3333    1.0000         0;
           0         1.0000         0;
           0         1.0000         0.3333;
           0         1.0000         0.6667;
           0         1.0000         1;
           0         0.6667         1;
           0         0.3333         1;
           0         0              1;
           0.3333    0              1;
           0.6667    0              1;
           1         0              1;
           1         0              0.6667;
           1         0              0.3333;
           0         0              0];


figure
hold on
%plot the trajectory from launch until the first instance where the seed's
%y coordinate goes negative (aka seed has reached the ground)
for i =1:numel(trajs)
    gndrow = find(trajs{i}(:,3) <= 0, 1); %find when seed hits ground
    plot3(trajs{i}(1:gndrow,2), trajs{i}(1:gndrow,4), trajs{i}(1:gndrow,3), 'Color',rainbow(i,:), 'LineWidth', 1.5)
    
end
grid on
xlabel("X (m)", 'Interpreter','latex','FontSize',16)
ylabel("Z (m)",'Interpreter','latex','FontSize',16)
zlabel("Y (m)",'Interpreter','latex','FontSize',16)
zlim([0,5])
xlim([0,12])
ylim([-8,8])