# CMSC389E Project 3 - The Register File

Due: **Sunday, April 6th, 2025 at 11:59PM** on **[Gradescope](https://www.gradescope.com/courses/936971/assignments/5956869/)**

This project involves building a fully functioning **Register File** in Minecraft using **redstone**! The goal is to implement fundamental digital logic circuits and integrate them into a working **Register File**. We will then integrate the **Register File** with the **ALU** from the previous project to perform sequential computations such as computing the *fibonacci sequence!*


## Importing Projects
To import the project, you need to download `project3 TEMPLATE.zip`, extract it, and move it into the `saves` folder of your Fabric installation folder. The easiest way of doing this is the following:

1. Download `project3 TEMPLATE.zip` from this directory
2. Locate your `./Downloads` folder and extract the contents of `project3 TEMPLATE.zip`
3. Locate the `project3` inside of the folder you extracted into
4. Use `Ctrl + X` on the `project3` folder to cut it, saving it into your clipboard
5. Go to your Minecraft Launcher and locate the **Installation Folder** for `fabric-loader-1.20.1`, similar to what you did during setup. Click on "Open installations folder"
![image](https://hackmd.io/_uploads/B1PLvzvwJl.png)
5. Navigate to the `saves` folder, and use `Ctrl + V` to paste `project3`
6. Finally, run Minecraft, go to "Singleplayer", and you should see **Project 2** has been successfully imported!


## Submitting Projects
Projects will be submitted and autograded via **Gradescope**. To submit the project, you will need to locate your `project3` world file, zip it into `project3.zip`, and submit it into the relevant Gradescope assignment. Here's a step-by-step:

1. Go to your Minecraft Launcher and locate the **Installation Folder** for `fabric-loader-1.20.1`, similar to what you did during setup. Click on "Open installations folder"
![image](https://hackmd.io/_uploads/B1PLvzvwJl.png)
2. Go to the `saves` folder, right click on `project3`, and compress it to **ZIP File**. 
3. Go to the Gradescope assignment and upload the relevant **ZIP File**.
    - Ensure that the world folder is named `project3` inside of the **ZIP File** or the autograder will fail.

## Notes

* For any of the tasks, **DO NOT** destroy or move **ANY** of the **redstone lamps**. We hardcode the input/output locations for the autograder to test your builds. 
* You may build outside of the **Gold Blocks**, but we always provide you with enough space to complete your build inside. 
* Because of **Worldedit**, it may be very easy to accidentally destroy the input/output **redstone lamps**. Please be careful to make sure you *don't do this*, and if you accidentally do, use `//undo`.
* We strongly urge you to **test your "code"** before you submit, since the **autograder** takes like 5 years to run lmao. 

## Resources

* **[MattBatWings - The Register File](https://youtu.be/LUQZR8i_t-0?si=P94aof3Ju8mIypSF)**
* **[CMSC389E Lecture 7 Slides](https://docs.google.com/presentation/d/1P6rNHwCNPa3ofhTJ76X5UkhIC0WBcRSKs7cebb2ZT3M/edit?usp=sharing)**

## Before we get to the Register File...

### Problem 1: SR Latch (0.5 pts)
- Implement a **SR (Set-Reset) Latch**.
    - Two inputs: **S (Set)**, **R (Reset)**
    - Two outputs: **Q (current memory state)**, **Q' (complement of Q)**
- The **S** input sets the current memory state **(Q)** to **ON**
- The **R** input sets the current memory state **(Q)** to **OFF**
- When both **S** and **R** are **ON**, the state is considered **undefined**
    - Typically, **S** and **R** inputs are *pulsed*, i.e. turned **ON** and then **OFF** to trigger state changes.
- The following logic gate description may help you:
![image](https://hackmd.io/_uploads/rJjV13d3ye.png)

- The truth table is also provided below:
    | S  | R  | Q | Q' |
    |----|----|----|----|
    |  0  |  0  |  `latch` |  `latch`  |
    |  0  |  1  |  0  |  1  |
    |  1  |  0  |  1  |  0  |
    |  1  |  1  |  `undef`  |  `undef`  |
    - Note: `latch` means the previous memory state is preserved
- **HINT 1:** **NOR Gate** provided.

### Problem 2: Gated SR Latch (0.5 pts)
- Implement a **Gated SR Latch**.
    - Three inputs: **S (Set)**, **R (Reset)**, **E (Enable)**
    - Two outputs: **Q (current memory state)**, **Q' (complement of Q)**
- A **Gated SR Latch** is essentially an **SR Latch** except **S** and **R** inputs conditioned on an **E (enable)** switch.
    - When **Enable** is **ON**, the **Gated SR Latch** works like an **SR Latch**
    - When **Enable** is **OFF**, inputs **S** and **R** have no effect on the **current memory state**
- The following logic gate description may help you:
![image](https://hackmd.io/_uploads/HJj0U6On1g.png)

- The truth table is also provided below:
    | E | S  | R  | Q | Q' |
    |----|----|----|----|----|
    | 0  | X | X |  `latch` |  `latch`  |
    |  1  |  0  |  0  |  `latch` |  `latch`  |
    |  1  |  0  |  1  |  0  |  1  |
    |  1  |  1  |  0  |  1  |  0  |
    |  1  |  1  |  1  |  `undef`  |  `undef`  |

- **HINT 2:** **AND Gate** provided.

### Problem 3: D Latch (0.5 pts)
- Implement a **D (Data) Latch**
    - Two inputs: **D (Data)**, **E (Enable)**
    - Two outputs: **Q (current memory state)**, **Q' (complement of Q)**
- A **D Latch** is essentially a **Gated SR Latch** but the **set-reset** inputs are toggled with a single **D (Data)** input.
- The following logic gate description may help you:
![image](https://hackmd.io/_uploads/HJkkO6d2kx.png)

- The truth table is also provided below:
    | E | D  | Q  | Q' |
    |----|----|----|----|
    |  0  |  0  |  `latch`  |  `latch`  |
    |  0  |  1  |  `latch`  |  `latch`  |
    |  1  |  0  |  0  |  1  |
    |  1  |  1  |  1  |  0  |

#### Note 3: Preferred D Latch Implementation
- This is the preferred implementation of a **D Latch** in Minecraft using the repeater **locking** mechanic. The **vertical** repeater in the image is the repeater storing the **data**, while the **horizontal** repeater is the **locking** repeater.
- The **black bar** across the **data** repeater indicates the repeater's state is being **locked**. When a repeater is **locked**, its state **(powered or unpowered)** remains unchanged until its **unlocked**.
- A repeater is **locked** by powering it with another repeater from the **side**.
![image](https://hackmd.io/_uploads/rk_-cpunyg.png)
- Play around with it and convince yourself that it is indeed an implementation of a **D Latch**! Also, notice that the **Enable** input is inverted. 
- You may use this implementation of a **D Latch** from now on!

### Problem 4: D Flip-Flop (0.5 pts)
- Implement a **D Flip-Flop** using the preferred implementation of a **D Latch** as shown in **Note 3**. 
    - Two inputs: **D (Data)**, **C (Clock)**
    - One output: **Q (current memory state)**
- A **D Flip-Flop** is essentially a **D Latch** that operates on a **clock pulse**
    - For our purposes, a **clock pulse** is a signal that goes from **OFF** to **ON** and back to **OFF**.
    - We want the **memory state** to change on the **leading edge** of the clock pulse
        - The **leading edge** is when the clock signal transitions from **OFF** to **ON**
        - The **trailing edge** is when the clock signal transitions from **ON** to **OFF**
    - We want no changes to occur to the **memory state** after the **leading edge** of the **clock pulse**
        - After the **leading edge** of the clock pulse, any changes to the **data** input will not be reflected until the next **clock cycle** or **leading edge** of the clock pulse
- Note, we've thrown away the **Q'** output since we really just care about the **Q** output - the current memory state.
- The following logic gate description may help you:
![image](https://hackmd.io/_uploads/Bk0dupd3yg.png)
- Example test case:
    1. Ensure **Data**, **Clock**, and **Q** are initially **OFF**.
    2. Turn **Data ON**. **Q** should not change.
    3. Turn **Clock ON**. **Q** should turn **ON**, since this is the leading edge of the clock pulse.
    4. Turn **Data OFF**. **Q** should remain **ON**, since this is after the leading edge of the clock pulse.
    5. Turn **Clock OFF**. **Q** should remain **ON**.
* Note, this functionality (of only writing data on the leading edge of a clock pulse) distinguishes the **D flip-flop** from the **D latch**.
* Note, when implementing the **D flip-flop**, notice that the **Enable** input is originally inverted in the **D latch**. Furthermore, a double inversion is just **no inversion**.
#### Note 4A: "D Flip-Flop"
- A D Latch is *basically* a D Flip-Flop when **Enable** is turned into a short **Clock Pulse**, provided by a **button** in Minecraft. 
- Note, this isn't *quite* a D Flip-Flop because the **memory state** can still change after the **leading edge** of the clock pulse (button duration), but for our purposes it is **good enough.**

#### Note 4B: D Flip-Flop
- Clock is turned into a **two-tick pulse generator** to allow the shortest possible pulse that will cause updates in the **memory state**. This only allows updates to the **memory state** on the **leading edge** of the clock pulse, simply because the **pulse** is so short.
- The **two-tick pulse generator** works by powering the comparator, and then *cancelling* the comparator with a repeater on a **two-tick delay** to produce a **two-tick pulse**. Our CPU will use a **two-tick pulse generator** to simulate a **clock pulse**.
- A single **D flip-flop** is essentially a **single register**, and are the fundamental components of **registers** in real life.
- We use **D flip-flops** instead of **D latches** because they operate on **clock pulse**, allowing for synchronization of components of a CPU. We will see this become apparent when we integrate the **Register File** with the **ALU**.

## Now let's start building the Register File!

The **Register File** is the second component of the **CPU** that we will build (we've already built the **ALU**). The motivation for the **Register File** is the following:
- We want to be able to store the intermediate results of the **ALU** into the **Register File** so we can perform successive computations, like calculating the **fibbonacci sequence** or adding **three or more** numbers together.

The **Register File** takes in **four inputs (data, read address 1, read address 2, write address)** has **two outputs (output 1, output 2)**, and also receives a **clock signal** that determines when writing occurs.
![image](https://hackmd.io/_uploads/ryGgh0Ohyl.png)
- **Data** is the **8-bit data** (in our case) to be written to the **Register File**
- **Read address 1 (R1)** is the address of the first register to read from
- **Read address 2 (R2)** is the address of the second register to read from
- **Write address (W)** is the address of the register to write **data** to
- **Output 1** is the current data of the first register
- **Output 2** is the current data of the second register

The reason why we have **two read addresses** and **two outputs** is because we want to feed the results of the **Register File** directly into the **ALU** as follows:
![image](https://hackmd.io/_uploads/rksOTRO31l.png)
![image](https://hackmd.io/_uploads/rJA_60uhkx.png)

In order to read two registers in the **Register File** at the same time, we will explore **Dual-Read** as you will see in the later parts. The multiplexer going into the **Data** input of the **Register File** allows us to select whether an **Immediate Value** or the **ALU Result** gets written into the **Register File**. With this, we'll be able to perform the successive computations that we've been dreaming about above! This is a high-level overview of what we want to achieve in this project.

Note, the **Register File** that we will be implementing in this project contains **SEVEN** registers addressed **r1, r2, r3, r4, r5, r6, and r7**. Note, we do not implement **r0** as we will reserve it to be the **zero register** - a **register** whose value is always **zero**. This may seem useless at first, but we will so that it's actually quite *nifty ඞ*. The implemented **Register File** will be similar to that of the diagram you saw **in class**, except we only have **seven** instead of **eight** registers, and **dual-read** is implemented via **simulated-dual read**:
![image](https://hackmd.io/_uploads/S1GIg1K2kl.png)

Let's get started by building a single register, with a **reading** function. Note, the **reading** function simulates a **multiplexer** when we add more registers!

### IMPORTANT NOTES BEFORE YOU CONTINUE
- Many of the parts from now on will build upon previous parts. It is **imperative** that you test your implementations to make sure each part works as intended before moving on.
- You will be copy-pasting your implementations from each **problem** to the next. We provide you with **copying instructions** and *emerald blocks, lapis blocks, and netherite blocks* as **worldedit guides**.
- You may remove the *emerald blocks, lapis blocks, and netherite blocks* as long as they do not affect functionality of your build.
- Ensure you read the **instructions for copying** over each part to the next.

### Problem 5: Single 1-Bit Register
- Implement a **single 1-bit register** with a **data** input and **read** and **write** toggles. For the implementation, use a **D latch** as we will eventually emulate **D flip-flops** by converting **write** into a **clock pulse** later.
    - When **Write** is **ON**, write the **Data** input to the register.
    - When **Write** is **OFF**, latch onto the **current memory state**.
    - When **Read** is **ON**, the **Output** should reflect the **current memory state**.
    - When **Read** is **OFF**, the **Output** should be **OFF**. 
- **Hint 5:** A **read/mux** module is provided, where the **input** is only let through when the **Read** toggle is **ON**.
- You only need to place redstone components on the **wool**.
- Example test case:
    - Ensure **Data**, **Write**, **Read** and **Output** are **OFF**.
    - Turn **Data ON**. Nothing else should change.
    - Turn **Write ON**. Now, the **current memory state** should reflect **Data**.
    - Turn **Write OFF**. Now, the **current memory state** should be locked.
    - Turn **Data OFF**. Nothing else should change.
    - Turn **Read ON**. Now, **Output** should be **ON**.
    - Turn **Write ON**. Now, **Output** should be **OFF**, since **Data** is reflected in the **current memory state** and it is also being read.
    - Now, turn **Read OFF** and **Write OFF** to result to the default state.

### Problem 6: Single 8-Bit Register
- Implement a **single 8-bit register** by stacking the **single 1-bit register** 7 times up.
- From now on, in order to copy your work over from previous parts, we will provide instructions.
- **Copying instructions**:
    - In **Problem 5**, select the region from the *emerald block* at `(-90, 59, 0)` to the *redstone dust* at `(-96, 60, 2)`. Then stand on the *emerald block* and use `//copy`.
    - In **Problem 6**, stand on the *emerald block* at `(-104, 59, 0)` and use `//paste`.
- **Worldedit hint**:
    - `//stack 7 up` will be very useful here.
- **Hint 6:** You will want to use a **glass tower** to propagate redstone vertically.
- The example test case is the same as for **Problem 5**, except now the **data** input is an **8-bit** integer.
- Now, you have a single register that stores an **8-bit integer**! Let's extend this functionality by adding **six** more registers that each store an **8-bit** integer.

### Problem 7: Seven 8-Bit Registers
- Implement **seven 8-bit registers** by stacking the **single 8-bit register** 6 times.
- **Copying instructions**:
    - In **Problem 6**, select the region from the *emerald block* at `(-104, 59, 0)` to the *lapis block* at `(-110, 75, 2)`. Then stand on the *emerald block* and use `//copy`.
    - In **Problem 7**, stand on the *emerald block* at `(-119, 59, 0)` and use `//paste`.
- **Worldedit hint**:
    - You may want to select the **single 8-bit register** with the *emerald block* at `(-119, 59, 0)` and *netherite block* at `(-125, 75, 3)` and use `//stack 6`
- The example test case is the same as for **Problem 6**, except now we have more registers.
- Your implementation should look something like the following image:
![image](https://hackmd.io/_uploads/SyitCUj3Je.png)
- Now, you essentially have a **Register File** that stores **seven 8-bit integers**! Let's make this **Register File** easier to read to and write from.

### Problem 8: Seven 8-Bit Registers with Decoders
- Make your **seven 8-bit registers** easier to read to and write from by adding **3:7 decoders** to the **read** and **write** inputs.
    - This way, we can address which registers we want to read to or write from using **3-bit addresses**
    - **IMPORTANT NOTE:** address your registers with your decoder from **r1 to r7**, skipping **r0**. 
- **Copying instructions**:
     - In **Problem 7**, select the region from the *lapis block* at `(-118, 59, 0)` to the *emerald block* at `(-126, 75, 26)`. Then stand on the *emerald block* and use `//copy`.
    - In **Problem 8**, stand on the *emerald block* at `(-141, 85, 28)` and use `//paste`.
- **Worldedit hint**:
    - After building one unit of the decoder, it is recommended to use `//stack` or `//copy` and `//paste` to simplify the process of building the rest.
    - For `//stack`, select one unit of your decoder with the *netherite block* at `-136, 66, 5` and use `//stack 6`.
    - For `//copy`, select one unit of your decoder, use `//copy` while taking note of your relative positioning, move to the corresponding spot, and use `//paste`.
    - You will still need to manually change the **bit addresses** for each unit of the decoder.
- **Hint 8:** **2:4** decoder provided as a reminder for how decoders work.
- Example test case:
    - Change **Data** to **0000 0001**.
    - Change the **write address** to **001** to write to **r1**.
    - Change the **write address** to **010** to write to **r2**.
    - Change **Data** to **0000 1111**.
    - Change the **read address** to **001** to read from **r1**. You should see an output of **0000 0001**.
    - Change the **read address** to **010** to read from **r1**. You should see an output of **0000 1111**.
- Your implementation should look something like the following image:
![image](https://hackmd.io/_uploads/HkgDnDoh1x.png)
- Now, we have a **Register File** containing **seven addressable registers**, that each store an **8-bit integer**! 
- Notice, we skipped addressing **r0**, and only address **r1, r2, r3, r4, r5, r6, and r7**. One of the reasons for this is because what if we don't want to write to or read from any registers? Thus, we will designate the *default state* of our decoders as **000**, or just the address for **r0**. Thus, when we don't want to read from any registers, we just leave the read address as **r0**, which will cause the **output** to be **0000 0000**. Additionally, when we try to write to **r0**, the **data** just gets thrown away since **r0** is not implemented. This also allows us to treat **r0** as a **zero register**: a register whose value is always **zero**, which are also used in real life. You'll see more reasons why the **zero register** is useful as we implement more components of our **CPU**!
- However, we notice a fatal flaw in our design: our **Register File** is constantly writing the **Data** input to the register with the corresponding **write address**. This can be seen clearly when we try to write to **r7,** addressed **111**. When you flip the levers **one-by-one** starting from **000**, going like **001** to **011** to **111**, we've actually addressed two other registers and written the data to them while trying to write **data** only to **r7**. This motivates the use of a **clock signal** to tell the **Register File** when we **actually want** to write the **Data**. Let's implement this!

### Problem 9: Add Clock Signal
- Improve your **Register File** by allowing it to write only when it receives a **clock signal**. 
    - This way, we can ensure that writing occurs **only when we want it to**. Practically, this allows the **Register File** to write only when other components in the **CPU** have finished processing, such as when the **ALU** completes a computation. We can adjust the **clock speed** in a **CPU** according to how long this process takes.
    - The way we will do this is simple. We simply just need to **AND** the **writing address input** with the **clock signal**. In other words, we need to **cancel** the **writing address** from being sent into the **Register File** until a **clock signal** is received.
    - The **clock signal** input is a lever, that when turned **ON**, generates a **2-tick clock pulse** that gets sent to the **Register File**. Turning **OFF** the lever doesn't do anything. 
    - This further motivates letting **000**, the address of **r0**, be the default state of our **decoders**. 
    - Adding the **clock signal** can be thought of as turning our **d latches** into **d flip-flops**, but not exactly. 
- **Copying instructions**:
     - In **Problem 8**, select the region from the *lapis block* at `(-132, 57, 1)` to the *emerald block* at `(-141, 85, 28)`. Then stand on the *emerald block* and use `//copy`.
    - In **Problem 9**, stand on the *emerald block* at `(-157, 85, 31)` and use `//paste`.
- **Hint 9:** We provide you with the **clock signal** implementation, it's just up to you to mirror it and add it into your **Register File** implementation. Play around with it, and make sure you know how it works!
- Example test case:
    - Change **Data** to **0000 0001**.
    - Change the **write address** to **001** to write to **r1**.
    - Turn the **Clock Signal** **ON** and **OFF** to send a **clock pulse** to trigger writing.
    - Change **Data** to **0000 0111**.
    - Change the **write address** to **111** to write to **r7**.
    - Turn the **Clock Signal** **ON** and **OFF** to send a **clock pulse** to trigger writing.
    - Change the **read address** to **001** to read from **r1**. You should see an output of **0000 0001**.
    - Change the **read address** to **111** to read from **r7**. You should see an output of **0000 0111**.
- Now, we have a **Single-Read 7-Register File** that does everything we want it to do, for what it is. Recall, the **ALU** takes in **two 8-bit integer inputs**. Currently, we can read the contents of a single register and feed it into one of the **ALU** inputs. 
- However, how could we possibly perform an operation like **ADD r3 r1 r2** *(MIPS assembly: add the contents of r1 and r2, and store them in r3)* if we can only read the contents of **one register at a time**?
- Introducing, the *gigachad* known as **Dual-Read Functionality**. You can read more about **Dual-Read** in the textbook. Here, we'll implement **Simulated-Dual Read** since its much easier to implement in **Minecraft**. Essentially, we'll be keeping **two copies** of each register, **writing** to both copies of each register at the same time, while reading from each set of register **independently**. 

### Problem 10: Add Dual Read
- Improve your **Register File** by adding **Dual Read Functionality**.
    - **Dual Read** is clearly beneficial as it allows us to feed the contents of **two registers** into the **ALU** to perform an operation. It allows us to perform operations like **ADD r3 r1 r2**, **NOR r7 r5 r2**, **SUB r0 r3 r2**, etc.
    - We will do this by literally mirroring the entire **Register File** across the **writing decoder**, so we have two copies of each register to **read from**. 

- **Copying instructions**:
     - In **Problem 9**, select the region from the *lapis block* at `(-148, 57, 1)` to the *emerald block* at `(-157, 85, 31)`. Then stand on the *emerald block* and use `//copy`.
    - In **Problem 10**, stand on the *emerald block* at `(-183, 85, 31)` and use `//paste`.
- **Hint 10:** We provide you with some practice with the worldedit `//flip` command. Use `//flip` to mirror the decoder so it looks like the following image:

    ![image](https://hackmd.io/_uploads/HyOnfk621g.png)
    
    - There are many ways to use `//flip` correctly, depending on where you are facing. Experiment with `//flip back`, `//flip right`, etc. to get a sense for how flip works.
    - You may want to read the **Worldedit hint** below before attempting!
- **Worldedit hint**:
    - If you use *Worldedit* correctly, you won't have to place a single block for this part.
    - **USE `//flip` PLEASE**. Otherwise, I might cry :D. `//flip` simply flips what have you copied on your **clipboard** relative to the direction that you are facing. Before attempting to flip the **Register File**, try practicing on **Hint 10**. 
    - What you essentially want to do is select your single read register file with the *lapis block* at `(174, 57, 1)` and *emerald block* at `(-183, 85, 31)`, stand on the *emerald block* at `(-174, 88, 1)` while facing the front of the register file, use `//flip left` to flip what's copied in your clipboard to the left (wow how intuitive), and then use `//paste`.
    - When using `//copy` with `//flip`, the same rules of *relative positioning* apply as when you use `//copy`. We stand on the *emerald block* because it is centered on the **register file**, so when we use `//paste` it turns out exactly how we want it to.
    - Note, when you finish mirroring your **Register File**, it will also mirror the **clock signal** over to the left. However, we only need a single **clock signal input**, so break the excess that got copied over to the left. Otherwise, **writing** will not work.
- Example test case:
    - Change **Data** to **0000 0001**.
    - Change the **write address** to **001** to write to **r1**.
    - Turn the **Clock Signal** **ON** and **OFF** to send a **clock pulse** to trigger writing.
    - Change **Data** to **0000 0111**.
    - Change the **write address** to **111** to write to **r7**.
    - Turn the **Clock Signal** **ON** and **OFF** to send a **clock pulse** to trigger writing.
    - Change **read address 1 (left)** to **001** to read from **r1**. You should see an **output 1** is **0000 0001**.
    - Change **read address 2 (right)** to **111** to read from **r7**. You should see an **output2** is **0000 0111**.
- Your implementation should look something like the following image:
![image](https://hackmd.io/_uploads/SyNNCyT2kl.png)
- Now, we have a completed **Dual-Read 7-Register File** that fully complies with the specifications above, and is ready for **integration with the ALU!** Our **Register File** precisely takes in **four inputs (data, read address 1, read address 2, write address)** has **two outputs (output 1, output 2)**, and also receives a **clock signal** that determines when writing occurs. Now onto the "fun" part, integrating the **Register File** with the **ALU** from the previous project!

### Problem 11: Integrate with ALU
- Finally, **integrate** your **Register File** with an **ALU**.
    - Recall, the **ALU** takes in **two inputs** and outputs the result of performing an operation on them. Therefore, the most direct and intuitive way to integrate the **Register File** with the **ALU** is first by connecting the *outputs* of the **Register File**, which will be the contents of two registers, into the *inputs* of the **ALU**. 
    - Then, since we want the **Register File** to store the intermediate results of **ALU** computations, we feed the *output* of the **ALU** into the **Data** input of the **Register File**. This complies with the following diagram: 
    ![image](https://hackmd.io/_uploads/r1EJMe6h1g.png)
    
    - This is great! This is amazing! However, you may have realized, if the **ALU** only receives inputs from the **Register File**, and **Register File** only receives inputs from the **ALU**, how do we initially load values into the **Register File** to perform operations on? We need a way to load **immediate** values into the **Register File**. In other words, we need to implement **load immediate (LDI)** instructions (for example, `LDI r1 3` means load an immediate value of `3` into **r1**). The solution: **ADD A MULTIPLEXER!!** (get used to it lol).
    - We add a **mux** allowing either the **ALU result** or an **immediate value** to be fed into the **data input** of the **Register File**. The **mux** will be controlled via **control signals** coming from the **Control ROM**. With this, we have the following diagram, essentially integrating **three** components of our **CPU** so far *(ALU, Control ROM, Register File)*:
![image](https://hackmd.io/_uploads/HkHulep2kg.png)
    - Thus, what we have to do is clear: 
        1) Connect the outputs of the **Register File** to the inputs of the **ALU**
        2) Add a **multiplexer** to the **data input** called the **Data MUX**
        3) Feed the output of the **ALU** and an **immediate input** into the **Data MUX**.
    - We provide you with an **ALU** that has the same operations as that of your previous project:
    ![image](https://hackmd.io/_uploads/Hk6zEg6hye.png)
    - The *light gray* line represents **input A**, while the *dark gray* line represents **input B**. The *white* line represents the **ALU output/result**, to be fed back into the **Register File**. The **control signals** are below the **ALU** in *black* signal lines. We will only test your implementation with your **ALU** in **ADD mode**. 
    - We've added a new input in front of your **Register File** called the **Immediate Input**, allowing you to manually load immediate values into your **Register File**. 
    - We've also added two new **control signals** near the front of your **Register File** called **REG ALU** and **REG IMMEDIATE**. These control signals will control the **Data MUX**: when **REG ALU** is **ON**, it allows the **ALU output** through the **Data MUX**, when **REG IMMEDIATE** is **ON**, it allows the **Immediate Input** through the **Data MUX**. Ensure that when you **copy and paste** your work from **Problem 10**, that you do not accidentally delete the **control signal inputs**. We provide instructions below on how to do this safely.

- **Copying instructions**:
     - In **Problem 10**, select the region from the *lapis block* at `(-164, 57, 1)` to the *emerald block* at `(-183, 85, 31)`. Then stand on the *emerald block* and use `//copy`.
    - **THIS STEP IS DIFFERENT FROM BEFORE!!!!!! - In Problem 11**, stand on the *emerald block* at `(-210, 85, 33)` and use `//paste -a`. **The `-a` flag here is VERY IMPORTANT to tell Worldedit to ignore air blocks when pasting your Register File. This ensures the control signal inputs don't get deleted by air blocks.**
- **Hint 11:** We provide you with a single layer of the **2:1 MUX** you will use. Play around with it, make sure you understand how it works. Then, apply it to create the **Data MUX**. You will need to use a **glass tower** to propagate redstone signal vertically.
- Example test case:
    - Try computing the fibonacci sequence: **1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233** with our **CPU** so far! We compute up to **233** since our limit with 8-bit numbers is **255**.
    - To do this, run the following instructions:
    ```
    LDI r1 1 
    ADD r2 r1 r0     // 1
    ADD r3 r2 r1     // 2
    ADD r4 r3 r2     // 3
    ADD r5 r4 r3     // 5
    ADD r6 r5 r4     // 8
    ADD r7 r6 r5     // 13
    ADD r1 r7 r6     // 21
    ADD r2 r1 r7     // 34
    ADD r3 r2 r1     // 55
    ADD r4 r3 r2     // 89
    ADD r5 r4 r3     // 144
    ADD r6 r5 r4     // 233
    ```
    In the end, **r6** should contain a value of **233**, the **13th** fibonacci number!
    - To run an instruction like `ADD r4 r3 r2`, ensure the inputs **read address 1** is **r3**, **read address 2** is **r2**, **write address** is **r4**, the **ALU setting** is **ADD**, and the **Data MUX** is set to **REG ALU**.  Then, send a **clock signal**.
    - To run an instruction like `LDI r1 1`, ensure **write address** is **r1**, the immediate input is **1**, and the **Data MUX** is set to **REG IMMEDIATE**. Then, send a **clock signal**. 
- You implementation should look something like this:
![image](https://hackmd.io/_uploads/r1v5fzp3Jl.png)
- And **CONGRATULATIONS!** You've essentially implemented the *bare minimum* components for a **CPU**. You can do some really *crazy* stuff with just an **ALU** and **Register File**, like computing infinitely large sequences of integers (although, we don't have turing completeness just yet...)
- But... how can we improve this? As you can see, to run but a simple test case of computing the **fibonacci sequence** and executing a simple instruction such as `ADD r4 r3 r2`, we have a **TON** of things to keep track of: the input addresses (read and write) for the **Register File**, and control signals for the **Data MUX** and the **ALU Setting**. As we add more components, this only gets **worse**. We have the **Control ROM** for managing/sending **control signals** to different components in the **CPU**, but how can we automate the input addresses for the **Register File?** This is where **Instruction Memory** and the **Program Counter** come in. The **Instruction Memory** stores the sequence of **instructions** comprising a program, while the **Program Counter** holds a single number keeping track of which instruction we are currently executing. Together, they will allow us to automate the process of sending **read and write addresses** as well as **immediate values** to the **Register File**. An example instruction might look something like: `ADD r3 r0 r2` or `0010001100000010`, where the first four bits describe the **opcode** and the last twelve bits describe the **operands**. The **opcode** for `ADD`, which is `0010`, will get sent to the **Control ROM** which will set the **ALU** to **ADD mode** and set the **Register File** **Data MUX** to **REG ALU**. Meanwhile, **0011** will be sent to the **write address input**, and **0000** and **0010** will be send to the **read address inputs** of the **Register File**. Finally, we await **clock signal** to actually execute the instruction, which will write data  to the register and update the program counter to send the next instruction. This is what we will explore next!! :)
