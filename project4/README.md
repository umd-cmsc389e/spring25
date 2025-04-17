# CMSC389E Project 4 - The Program Counter

Due: **Sunday, April 26th, 2025 at 11:59PM** on **[Gradescope](https://www.gradescope.com/courses/936971/assignments/5956869/)**

This project involves building a fully functioning **program counter** in Minecraft using **redstone**! The goal is to integrate the program counter with an **ALU, Register File, and Instruction Memory** to perform sequential computations such as computing the *fibonacci sequence!*


## Importing Projects
To import the project, you need to download `project4 TEMPLATE.zip`, extract it, and move it into the `saves` folder of your Fabric installation folder. The easiest way of doing this is the following:

1. Download `project4 TEMPLATE.zip` from this directory
2. Locate your `./Downloads` folder and extract the contents of `project4 TEMPLATE.zip`
3. Locate the `project4` inside of the folder you extracted into
4. Use `Ctrl + X` on the `project4` folder to cut it, saving it into your clipboard
5. Go to your Minecraft Launcher and locate the **Installation Folder** for `fabric-loader-1.20.1`, similar to what you did during setup. Click on "Open installations folder"
![image](https://hackmd.io/_uploads/B1PLvzvwJl.png)
5. Navigate to the `saves` folder, and use `Ctrl + V` to paste `project4`
6. Finally, run Minecraft, go to "Singleplayer", and you should see **Project 4** has been successfully imported!


## Submitting Projects
Projects will be submitted and autograded via **Gradescope**. To submit the project, you will need to locate your `project4` world file, zip it into `project4.zip`, and submit it into the relevant Gradescope assignment. Here's a step-by-step:

1. Go to your Minecraft Launcher and locate the **Installation Folder** for `fabric-loader-1.20.1`, similar to what you did during setup. Click on "Open installations folder"
![image](https://hackmd.io/_uploads/B1PLvzvwJl.png)
2. Go to the `saves` folder, right click on `project4`, and compress it to **ZIP File**. 
3. Go to the Gradescope assignment and upload the relevant **ZIP File**.
    - Ensure that the world folder is named `project4` inside of the **ZIP File** or the autograder will fail.

## Notes

* For any of the tasks, **DO NOT** destroy or move **ANY** of the **redstone lamps**. We hardcode the input/output locations for the autograder to test your builds. 
* You may build outside of the **Gold Blocks**, but we always provide you with enough space to complete your build inside. 
* Because of **Worldedit**, it may be very easy to accidentally destroy the input/output **redstone lamps**. Please be careful to make sure you *don't do this*, and if you accidentally do, use `//undo`.

## Resources

* **[MattBatWings - Pulses, Clocks](https://www.youtube.com/watch?v=N-edYGFQIjY&t=229s)**
* **[MattBatWings - PC](https://www.youtube.com/watch?v=4C0-qWW9LuU&t=453s)**
* **[CMSC389E Lecture 9 Slides](https://docs.google.com/presentation/d/15CQsFcER5WCbOyajbgDgRYUK71xu04HyjKehVT1YzWQ/edit?usp=sharing)**

## Program Counter

A **program counter** allows us to step through instructions in memory, one at a time, just like how your computer reads lines of code.

A **period** is the total time it takes for a clock signal to go from `ON` to `OFF` and back to `ON` again — this is one full cycle. The **frequency** is how many of these cycles happen per second, essentially controlling the speed of the system.

In Minecraft, we use **ticks** to **measure time**. Unfortunately, Minecraft operates on a different tick rate than real-life. In MC, one real tick (0.1s) is two game ticks. When we say something like a "20-tick period," we mean it takes 40 game ticks (2 seconds) for a full `ON→OFF→ON` cycle. That means the repeaters in one cycle (`ON-to-OFF` and `OFF-to-ON`) add up to 20 ticks. This timing controls how fast your Redstone clock pulses — and ultimately, how fast your program "runs." Try it out by using `/tick freeze` and `/tick step`.

💡 For now, just worry about **real** ticks and make sure the repeater and comparator delays add to a specified amount.

### Step 1: 2-Tick Output Pulse

---

Create a redstone circuit that produces a **2-tick output pulse** (approx. 0.1 seconds).

- This pulse should cause a redstone lamp to *quickly* blink on and off when the button is pressed.
- You will need a comparator and repeater. Think about how you can cancel a comparator signal after 2 ticks.
- A pulse is useful for triggering single updates like register writes or adder calculations. You can set a tick delay or output pulse by **clicking on a repeater**

> **Hint**: A repeater is 1 real tick by default, and then one more for every "delay" on it

---

### Step 2: Create a clock!

Add a clock that repeatedly produces the **2-tick pulse** from Step 1.

- Your goal: Create a **13-tick period clock** (*26 game ticks*) with a **2-tick output pulse**.
- *IRL, the clock will run continuously until a **halt** signal is activated. Later on, a halt signal will stop the execution of our programs.*

> **Hint**: A comparator takes one real tick to propagate signal
  
> 💡 **Note 1**: We've provided a **33-tick period clock** (*66 game ticks*) with a 3-tick output pulse and a **halt signal**. You’re welcome to model off of it's clock portion—it’s reliable and integrates well with later components.

---
### Step 3: Reuse Your 4-Bit Adder from P1 

Let's bring back your **4-bit full adder** from Project 1!

- **Emulate a counter** that always **adds one** to the current value.
- This will be the foundation of your program counter. 

---

### Step 4: Build Counter w/ Pulse

Recreate your 4-bit adder and turn it into a counter that only updates **on each pulse**. Note, your input/output redstone lamps **must** stay in the same location.

- **Registers**: You need four, **1-bit registers** (use d-latches)
- **Register Logic**:
  - These registers store the **previous counter state**.
  - Their outputs feed into the **inputs** of your adder.
  - Since you're always adding 1, only one of the inputs (ex. B) will be 1 at some bit i. Hence, we have removed the A input bits.
- On each clock **pulse**, the counter increments and stores the new result into the registers, which are then propagated to the output B bits facing you

> **IMPORTANT:** You **MUST** ensure the counter starts at 0 (reset your register bits), otherwise the autograder will fail.

> 💡 **Note 2**: We’ve also provided an **8-bit counter** using a carry-cancel adder, which follows the same idea. You can reference it for inspiration or troubleshooting. This build hardwires one of the inputs at each layer (A<sub>i</sub> or B<sub>i</sub>) to a constant `1`.

---

### Step 5: Add Clock to Your Counter

Now attach your clock from **Step 2** to the counter you built in Step 4.
- Ensure your clock is generating a **2-tick pulse** for every **13 tick** period.
- This should make the counter automatically increment with each **clock pulse**.
- Double-check that:
  - Your input/output lamps haven’t changed position.
  - Now, the four, 1-bit registers only update on pulses (that are sent continouously)

> **IMPORTANT:** You **MUST** ensure the counter starts at 0 (reset your register bits) and your clock is initially **OFF**, otherwise the autograder will fail

> 💡 **Note 2**: We’ve also provided an **8-bit counter** using a carry-cancel adder, which follows the same idea. You can reference it for inspiration or troubleshooting. This build hardwires one of the inputs at each layer (A<sub>i</sub> or B<sub>i</sub>) to a constant `1`.



---

Great, we now have a program counter that *may* look similar to: 

![image](https://hackmd.io/_uploads/S1L891Jkxe.png)


## Putting it together!

### Step 6: Integrate PC + Run a program :)

1. Copy the 8-bit cca counter by selecting the lapis-lazuli blocks with your wand at `(-175, 59, -4)` and `(-158, 79, 14)`. Then, stand at the emerald block at `(-167, 62, -5)` and run `//copy`. After you have copied the counter, stand at `(-250, 73, 25)` and run `//paste -a`. Great! You've now attached the program counter to this small CPU. 

    **DON'T FORGET TO USE THE -a FLAG OR YOU WILL CLOBBER PART OF THE INSTRUCTION MEMORY**.

2. Ensure that the program counter signal connects to the register file write signal. This **synchronizes** the clock from project 3 to the one you have just pasted!
    
    ![image](https://hackmd.io/_uploads/rymoOKCCJl.png)
    
    **We have already inserted instruction memory for the fibonacci sequence shown in the next step; however, if you do not want to make your own program, SKIP TO STEP 7**

3. [**OPTIONAL**] Create a new file named `fibonacci.as` and paste the following contents into it:

        LDI R1 1
        ADD R2 R1 R0
        ADD R3 R2 R1
        ADD R4 R3 R2
        ADD R5 R4 R3
        ADD R6 R5 R4
        
    >If you would like to write your own program for fun, please note that you can only abide by the **operations, memory, and signals** utilized in the current CPU build.

4. [**OPTIONAL**] We have provided three scripts: `main.py`,`assembler.py`, and `schematic.py`. Make sure `fibonacci.as` and all the scripts are in the same folder. Then, run the following command in your terminal: `./main.py fibonacci.as`
    
5. [**OPTIONAL**] For the following, you will need to have the **litematica** and **malilib** mods installed (refer to [setup/downloads](https://github.com/umd-cmsc389e/spring25/tree/main/setup)). Navigate to your schematics folder, located in `.Minecraft > schematics`. Paste the produced schematic file (ex. `fibonacciprogram.schem`) into that directory.
    
6. [**OPTIONAL**] Now, in your minecraft world, stand at **-187, 91, 35** and press `m` on your keyboard. A litematica UI should pop up. First, in the lower left hand side, ensure the tool mode reads "Schematic Placement". Next, you should see a button labeled `load schematics`. Click on it and select the `fibonacciprogram.schem` file, then select `load schematic` at the bottom left. Press escape and then click on `Schematic Placements`. Click on the `configure` button for the `fibonacciprogram` schematic. Now, click the `Rotation` button on the right hand side of the screen until it reads `CW_180`. Now escape out of all the menus. You should see all the blocks and repeaters in place:

![image](https://hackmd.io/_uploads/Sy-PGzUCJg.png)

After this, hit `m` and navigate to `configuration menu`, then hit the `hotkeys` menu. Select a hotkey for the **executeOperation** field. Now exit all the litematica menus and use that hotkey. All your instruction memory should now be pasted in properly!

---
> **Alternatively**, you can try and load the schematic using worldedit. You would have to ensure the schematic file is in the `Minecraft > config > Worldedit > schematics` folder. If you have troubles pasting, type //undo and go to another location in your world and paste the instruction memory. You may have to re-orient the direction of the schematic. Note, the -a flag ignore space when pasting
        
     //schem load fibonacciprogram.schem
     //paste -a
        
    
7. To run your program, flip the lever for the clock signal **ON** for roughly 30 seconds before flipping the lever **OFF**. Check the state of your registers to ensure that:

        r0 = 0, r1 = 1, r2 = 1, r3 = 2, r4 = 3, r5 = 5, r6 = 8
