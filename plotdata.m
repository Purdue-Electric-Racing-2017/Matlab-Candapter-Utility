throttle1_cal = (pb_apps1(1,:) - throttle1_min) / (throttle1_max - throttle1_min)
throttle2_cal = (pb_apps2(1,:) - throttle2_min) / (throttle2_max - throttle2_min)

plot(pb_apps1(2,:),throttle1_cal)
hold on
plot(pb_apps2(2,:),throttle2_cal)
hold on
plot(main_imp(2,:),main_imp(1,:))
hold on
plot(main_eor(2,:),main_eor(1,:))
legend('throttle1', 'throttle2', 'main_imp', 'main_eor')