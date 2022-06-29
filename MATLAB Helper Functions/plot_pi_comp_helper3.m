figure;
tim = linspace(0,4,size(ref_S1,1));
plot(tim, ref_S1, 'color', 'red','LineWidth', 2)
hold on;
plot(tim, meas_S1, '--', 'color', 'blue', 'LineWidth', 2);
hold on;
plot(tim, meas_S2, ':', 'color', [0 0.5 0], 'LineWidth', 2);
xlabel('Time (in seconds)');
ylabel('Measured Speed and Reference (in rad/s)');
legend('Reference', 'Rr = 1.395', 'Rr = 2*1.395');
title('Rotor Speed Waveform');
grid on;
hold off;

figure;
tim = linspace(0,4,size(ref_f1,1));
plot(tim, ref_f1, 'color', 'red','LineWidth', 2)
hold on;
plot(tim, meas_f1, '--', 'color', 'blue', 'LineWidth', 2);
hold on;
tim = linspace(0,4,size(ref_f2,1));
plot(tim, meas_f2, ':', 'color', [0 0.5 0], 'LineWidth', 2);
xlabel('Time (in seconds)');
ylabel('Measured imr and Reference (in Amp)');
legend('Reference', 'Rr = 1.395', 'Rr = 2*1.395');
title('Magnetizing Stator Current Waveform');
grid on;
hold off;

figure;
tim = linspace(0,4,size(ref_d1,1));
plot(tim, ref_d1, 'color', 'red','LineWidth', 2)
hold on;
plot(tim, meas_d1, '--', 'color', 'blue', 'LineWidth', 2);
hold on;
tim = linspace(0,4,size(ref_d2,1));
plot(tim, meas_d2, ':', 'color', [0 0.5 0], 'LineWidth', 2);
xlabel('Time (in seconds)');
ylabel('Measured d Axis Current and Reference (in A)');
legend('Reference', 'Rr = 1.395', 'Rr = 2*1.395');
title('d Axis Stator Current Waveform');
grid on;
hold off;

figure;
tim = linspace(0,4,size(ref_q1,1));
plot(tim, ref_q1, 'color', 'red','LineWidth', 2)
hold on;
plot(tim, meas_q1, '--', 'color', 'blue', 'LineWidth', 2);
hold on;
plot(tim, meas_q2, ':', 'color', [0 0.5 0], 'LineWidth', 2);
xlabel('Time (in seconds)');
ylabel('Measured q Axis Current and Reference (in A)');
legend('Reference', 'Rr = 1.395', 'Rr = 2*1.395');
title('q Axis Stator Current Waveform');
grid on;
hold off;

