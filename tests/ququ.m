    clc; clear all; close all;
    %============Initial verticies & Faces of the shape===========
%     [s1_vtx,s1_fcs] = Pyramid();
    [s1_vtx,s1_fcs] = Cube();
    %==============Transform Shape 1 ======================
    Tx = 0; Ty = 0; Tz = 0; %Translation vectors for x,y,z axes
    Sx = 2; Sy = 2; Sz = 2;%Scaling factors in x,y,z dimensions
    Rx = pi/2; Ry = pi/4; Rz = pi/4; %Rotating factors in x,y,z dimensions
    transform = scale(Sx,Sy,Sz)*rotate(Rx,0,0)*translate(Tx,Ty,Tz); %Merge transforms together
    s1_vtx = transform*vertcat(s1_vtx,(ones(1,length(s1_vtx)))); %Add row of ones to end for multiplication
    s1_vtx = s1_vtx(1:3,:); %And remove afterwards