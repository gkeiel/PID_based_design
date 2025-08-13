# PID-based robust design

A code to compute robust proportional-integral-derivative (PID) and current feedback controllers to ensure uninterruptible power supply (UPS) stability and performance, whose gains are tuned by means of regional pole placement with LMIs. Although inverter switching effects are not considered, the output plotted without a graphical environment facilitates learning and analysis of the resulting controller.

Consider a closed-loop in the form

<img width="898" height="276" alt="pmr_closed_loop" src="https://github.com/user-attachments/assets/1cb626d1-af1d-46f6-9cc8-a0227947a565"/>

being PID a controller with transfer function

$$C(s) = \frac{u_v(s)}{e(s)} = k_{p} +\frac{k_i}{s} +\frac{k_d s}{s +p}$$

with selectable structure where $k_p$, $k_i$, and $k_{d}$ are gains to be determined.

For a complete PID structure, the control law shown can be rewritten as

$$u(t) = Kx_{a}(t) +k_{2}r(t)$$

where $x_{a}(t) = [x'(t)\ x_{c}'(t)]' \in \mathbb{R}^{2+2}$ is the augmented state and

$$K = [k_1\quad k_2\quad k_3\quad k_4]$$

resulting in

$$k_c = k_1$$
$$k_i = k_4/p$$
$$k_d = -(k_3 -k_i)/p$$
$$k_p = -k_2 -k_d$$

##

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
