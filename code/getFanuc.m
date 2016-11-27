%% Creates a robot like the Fanuc, establishes the initial position and
% shows information about the ROBOT
function [robot, q_initial] = getFanuc()
    
    %the intial matriz t
    link1 = Link('theta',0, 'a', 0.4, 'alpha', -pi/2);
    link2 = Link('d', 1.328, 'a', 0, 'alpha', pi/2);
    link3 = Link('d', 0, 'a', 1.2, 'alpha', 0);
    link4 = Link('d', 0.378, 'a', 0, 'alpha', pi/2);
    link5 = Link('d', 1.2, 'a', 0, 'alpha', -pi/3);
    link6 = Link('d', 0.207, 'a', 0, 'alpha', pi/3);
    link7 = Link('d', 0.1325, 'a', 0, 'alpha', 0);
    % limits
    link1.qlim = [0, 9.096];
    link2.qlim = [-pi/2, 2*pi/3];
    link3.qlim = [-1.8326, pi/4];
    link4.qlim = [-7*pi/18, pi/2];
    link5.qlim = [0, 2*pi];
    link6.qlim = [0, 2*pi];
    link7.qlim = [-2*pi , 2*pi];
    clc
    % information
    disp('====|| Fanuc Info ||====');
    disp('====Radin for rotational and meters for prismatic====');
    disp('Link one limit 0, 9.096 (Prismatic)');
    disp('Link two limit -pi/2, 2*pi/3');
    disp('Link three limit -pi/2, 2*pi/3');
    disp('Link four limit -7*pi/18, pi/2');
    disp('Link five limit 0, 2*pi');
    disp('Link six limit 0, 2*pi');
    disp('Link seven limit -2*pi , 2*pi)');
    input('Press enter to continue...')
    
    robot = SerialLink([link1 link2 link3 link4 link5 link6 link7]);
    robot.plotopt = {'workspace',[-3 3 -3 3 -3 3]};
    q_initial = [0 0 pi/2 0 pi/2 0 0];
end