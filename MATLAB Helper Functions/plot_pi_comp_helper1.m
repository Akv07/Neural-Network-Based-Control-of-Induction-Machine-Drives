type = 1;

if type == 1
    ref_d1 = d1.signals(1).values;
    ref_q1 = q1.signals(1).values;
    ref_f1 = f1.signals(1).values;
    ref_S1 = S1.signals(1).values;

    meas_d1 = d1.signals(2).values;
    meas_q1 = q1.signals(2).values;
    meas_f1 = f1.signals(2).values;
    meas_S1 = S1.signals(2).values;

else
    ref_d2 = d1.signals(1).values;
    ref_q2 = q1.signals(1).values;
    ref_f2 = f1.signals(1).values;
    ref_S2 = S1.signals(1).values;

    meas_d2 = d1.signals(2).values;
    meas_q2 = q1.signals(2).values;
    meas_f2 = f1.signals(2).values;
    meas_S2 = S1.signals(2).values;
end