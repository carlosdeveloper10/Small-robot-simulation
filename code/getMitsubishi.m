%% Creates a robot like the Mitsubishi, establishes the initial position and
% shows information about the ROBOT
function [robot, q_initial] = getMitsubishi()
    
    %the intial matriz t
    link1 = Link([0 0.285 0 -pi/2 0], 'standard');
    link2 = Link([-pi/3 0 0.250 0 0], 'standard');
    link3 = Link([pi/2 0 0.160 0 0], 'standard');
    link4 = Link([(-2*pi)/3 0 0 -pi/2 0 ], 'standard');
    link5 = Link([0 0.072 0 0 0], 'standard');
    
    %Restrition move for each link
    link1.qlim = [(-5*pi / 6), (5*pi / 6)];
    link2.qlim = [(-pi / 3), (2*pi / 3)];
    link3.qlim = [(-11*pi / 18), (2*pi / 3)];
    link4.qlim = [(-2*pi), (2*pi)];
    link5.qlim = [(-10*pi/9), (10*pi/9)];
    
    clc
    disp('====|| Mitsubishi Info ||====');
    disp('====Radin for rotational and meters for prismatic====');
    disp('Link one limit (-5*pi / 6), (5*pi / 6)');
    disp('Link two limit (-2*pi / 3), (2*pi / 3)');
    disp('Link three limit (-11*pi / 18), (2*pi / 3)');
    disp('Link four limit (-2*pi), (2*pi)');
    disp('Link five limit (-pi/2), (pi/2)');
    input('Press enter to continue...')
    
    robot = SerialLink([link1 link2 link3 link4 link5]);
    q_initial = [0 -pi/3 pi/2 (-2*pi/3) 0];
end