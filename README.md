# PID-based robust design

A code to compute robust proportional-integral-derivative (PID) and current feedback controller to ensure uninterruptible power supply (UPS) stability and performance. PID and current gain tuned by means of regional pole placement with LMI. Although inverter switching effects are not considered, output plotted without graphical environment facilitates learning and brief analysis of the resulting controller.

Main file named as 'pid\_main.m'. Only the following specification are required:
- The desired real part of the smallest pole of the closed-loop system (sig)
- The selection of the controller structure [P]/[PI]/[PD]/[PID]

Consider an example of a PID with sig = 50 where the following output voltage response is obtained:

k_p = 3.923, k_i = 360.761, k_d = 0.0002, k_a = -5.086
<img width="1920" height="926" alt="PID_based_design_sig50" src="https://github.com/user-attachments/assets/5e0f8cae-44d6-4d79-ab87-2650be514871" />

Considering a PID with sig = 500 the following output voltage response is obtained:

k_p = 4.962, k_i = 3513.727, k_d = 0.00018, k_a = -5.590
<img width="1920" height="926" alt="PID_based_design_sig500" src="https://github.com/user-attachments/assets/67a81cd1-77ab-4a5b-9afc-0fc2d3f4eb3e" />

Note how the tracking error is reduced with the increase of sig, at the cost of a higher control signal. Moreover, robustness to load variation (inside bounds) is guaranteed. The tracking error is minimized but NOT ELIMINATED, thus consider using a reference-frame transformation or a PMR controller for better response.
