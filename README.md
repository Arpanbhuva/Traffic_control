# Traffic Light Controller

A Finite State Machine (FSM) based Traffic Light Controller implemented in Verilog HDL. The system controls Red, Yellow, and Green signals at an intersection with predefined timing, demonstrating sequential logic, state transitions, and digital control system design. Simulated and verified using Intel Quartus.

---

## How It Works

The controller cycles through traffic light states using an FSM with fixed time delays for each signal:

1. **Green** — Traffic flows, held for a predefined number of clock cycles
2. **Yellow** — Warning signal before stopping, brief transition period
3. **Red** — Traffic stopped, held for a predefined number of clock cycles
4. Cycle repeats continuously

---

## FSM Design

| State | Output (R, Y, G) | Description |
|---|---|---|
| GREEN | 0, 0, 1 | Traffic moving |
| YELLOW | 0, 1, 0 | Transition warning |
| RED | 1, 0, 0 | Traffic stopped |

---

## Project Files

| File | Description |
|---|---|
| `Traffic_light_control.v` | Main FSM-based Verilog design |
| `Traffic_light_Control_Testbench.v` | Testbench for functional verification |
| `State Diagram.png` | FSM state transition diagram |
| `Simulation Waveform_Functional.png` | Functional simulation waveform |
| `Simulation Waveform_Timing.png` | Timing simulation waveform |
| `Testbench Waveform.png` | Testbench output waveform |

---

## State Diagram

![State Diagram](State%20Diagram.png)

---

## Simulation Waveforms

**Functional Simulation**

![Functional Waveform](Simulation%20Waveform_Functional.png)

**Timing Simulation**

![Timing Waveform](Simulation%20Waveform_Timing.png)

---

## Testbench Waveform

![Testbench Waveform](Testbench%20Waveform.png)

---

## Simulation Setup

**Tool:** Intel Quartus

**Steps to simulate:**

1. Clone the repository
   ```
   git clone https://github.com/Arpanbhuva/Traffic_control.git
   ```

2. Open Quartus and create a new project

3. Add `Traffic_light_control.v` as the design file

4. Add `Traffic_light_Control_Testbench.v` as the simulation testbench

5. Run Functional Simulation and Timing Simulation from the Processing menu

---

## Key Learnings

- FSM design for real-world control systems in Verilog HDL
- State transition logic with timing-based signal control
- Difference between functional and timing simulation results
- Testbench design and waveform verification in Quartus

---

## Author

**Arpan Bhuva**  
ECE | Digital Design & RTL  
[GitHub Profile](https://github.com/Arpanbhuva)
