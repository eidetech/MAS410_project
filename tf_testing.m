clc; clear all; close all;

s = tf('s');

wn = 439

G = wn^2/(s^2 + wn*s + wn^2)

step(G)
