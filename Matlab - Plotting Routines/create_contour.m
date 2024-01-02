function fig_handle = create_contour(x_data,y_data,z_data,x_label, y_label, plottitle, levels, x_ticks, y_ticks)
% fig_handle = create_contour(x_data,y_data,z_data,x_label, y_label, plottitle, levels, x_ticks, y_ticks)
% create_contour  Create contour plot from 1d vectorized data, allow for
% user to add contour labels by clicking on contour lines, and to specify
% plot details like title, axis labels, axis ticks...
% INPUTS:
%   x_data: 1d vector of data to be plotted on xAxis
%   y_data: 1d vector of data to be plotted on yAxis
%   z_data: 1d vector of data to be plotted on the color axis
%   x_label: string to label xAxis
%   y_label: string to label yAxis
%   plottitle: string for plot title
%   levels: 1d vector of contour levels to use
%   x_ticks: 1d vector for xAxis tick values
%   y_ticks: 1d vector for yAxis tick values
%
% OUTPUTS:
%   fig_handle = figure handle of generated plot

%Matlab's inbuilt contourf function requires contour data as a grid/2d
%matrix for each X and Y coordinate and the Z values (as might be generated
%by a call to the meshgrid function). Reshape the data into a form useable
%by contourf
x_step = (max(x_data)-min(x_data))/(numel(unique(x_data))-1);
y_step = (max(y_data)-min(y_data))/(numel(unique(y_data))-1);

xx = reshape(x_data,[numel(unique(x_data)),numel(unique(y_data))]);
yy = reshape(y_data,[numel(unique(x_data)),numel(unique(y_data))]);
zz = reshape(z_data,[numel(unique(x_data)),numel(unique(y_data))]);



f = figure;
%f.Position = [100, 100, 300, 360]
[C,h]=contourf(xx,yy,zz,levels);
%sfc = pcolor(xx,yy,zz)

gcf
xlabel(x_label, 'Interpreter','latex','FontSize',18)
ylabel(y_label, 'Interpreter','latex','FontSize',18)
title(plottitle,'Interpreter','latex','FontSize',19)

xticks(x_ticks)
yticks(y_ticks)
clabel(C,h,'manual', 'FontSize', 12)

fig_handle = gcf;

end