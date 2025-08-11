# PID-based robust design

A code to compute robust proportional-integral-derivative (PID) and current feedback controller to ensure uninterruptible power supply (UPS) stability and performance. PID and current gain tuned by means of regional pole placement with LMI. Although inverter switching effects are not considered, output plotted without graphical environment facilitates learning and brief analysis of the resulting controller.



Details: Robustness to load variation (inside bounds) guaranteed. Tracking error minimized but NOT ELIMINATED, thus consider using a reference-frame transformation or a PMR controller for better response. Main file named as 'pid\_main.m'.

