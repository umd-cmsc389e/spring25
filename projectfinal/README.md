# CMSC389E Final Project

Due: **Sunday, May 18th, 2025 at 11:59PM** on **[Gradescope](https://www.gradescope.com/courses/936971/assignments/6206143/)**

The **final project** will emcompass utilizing a finished CPU implementation in **Minecraft** to run a program of your choice. You will then submit a **1-2** paragraph report summarizing what you did. It should be relatively chill! :D

## Importing Projects
To import the project, you need to download `projectfinal TEMPLATE.zip`, extract it, and move it into the `saves` folder of your Fabric installation folder. The easiest way of doing this is the following:

1. Download `projectfinal TEMPLATE.zip` from this directory
2. Locate your `./Downloads` folder and extract the contents of `projectfinal TEMPLATE.zip`
3. Locate the `projectfinal` inside of the folder you extracted into
4. Use `Ctrl + X` on the `projectfinal` folder to cut it, saving it into your clipboard
5. Go to your Minecraft Launcher and locate the **Installation Folder** for `fabric-loader-1.20.1`, similar to what you did during setup. Click on "Open installations folder"
![image](https://hackmd.io/_uploads/B1PLvzvwJl.png)
5. Navigate to the `saves` folder, and use `Ctrl + V` to paste `projectfinal`
6. Finally, run Minecraft, go to "Singleplayer", and you should see **Project 2** has been successfully imported!


## Submitting Projects
The final project will be submitted via **Gradescope**. For this project, you will submit a **pdf report** that is described below. That is all you need to submit for this project.

## Resources

* **Final Project Video** (to be added)
* [**BATPU-2 Instructions Set**](https://docs.google.com/spreadsheets/d/12urAGQ1eXuVUJTJ9l9LwMtBRvsr5gCwXs8DY92yWrZw/edit?usp=sharing)
* [**Minecraft CPU Simulator**](https://github.com/AdoHTQ/Batpu2-VM/releases) - will be useful for crafting your program!

## Project Outline

We provide you the completed implementation of the **Minecraft CPU** in `projectfinal TEMPLATE.zip`. You should import the world per the instructions above.

We also provide you with the following scripts:
| Script | Purpose |
|-|-|
| `assembler.py` | Converts assembly language into machine code |
| `schematic.py` | Converts machine code into a minecraft pasteable schematic |
| `main.py` | Calls `assembler.py` and `schematic.py` to converge an assembly file into a schematic. Usage: `python main.py [filename]`|

* You will use `main.py` to convert your **assembly program** to a **minecraft schematic** that you will paste into your world.
* Note, a **minecraft schmatic** is simply a blueprint/template file that can be use to transfer builds between worlds. We will demonstrate using a schematic below, so don't worry!

Your task will be to do the following:
### 1. Write an assembly program of your choice!
- Your program can do anything. Here are some ideas:
    - Compute the fibonacci sequence up to 255
    - Compute the primes up to 255
    - Implement your favorite sorting algorithm (bubble/selection/insertion/quick, etc.)
    - Perform multiplication of two numbers
    - Draw a smiley face
- Use the following instruction set and example programs:

### 2. Use `main.py` to compile your assembly program into a schematic
- To use `main.py`, simply run `python main.py [filename]` where `filename` is your assembly program.
- Note: The assembly file you want to compile should be in a `programs` folder on the same level as `main.py`.

### 3. Move the schematic into your `./schematics` folder
- You will need the **litematica** and **malilib** mods, which you should have installed during the **setup** project. If you don't have them, then refer to [setup/downloads](https://github.com/umd-cmsc389e/spring25/tree/main/setup). 
- Navigate to your schematics folder, located in `.minecraft > schematics`. It should be on the same level where `saves` is. If you don't see a `schematics` folder, simply create it. 
- Then, paste the produced schematic file (ex. `fibonacciprogram.schem`) into that directory, similar to how you imported the project world file into `saves`.

### 4. Paste the schematic into the completed CPU implementation

1. Now, in your minecraft world, stand at the diamond block at **109, 90, 43** and press `m` on your keyboard. A litematica UI should pop up. In the lower left hand side, ensure the tool mode reads **"Schematic Placement"**. 


![image](https://hackmd.io/_uploads/rylnkxigee.png)

2. Next, you should see a button labeled `load schematics`. Click on it and select your schematic file (ex. `fibonacciprogram.schem`), then select `load schematic` at the bottom left. 

![image](https://hackmd.io/_uploads/SyYQzxieee.png)

3. Now escape out of all the menus. You should see all the blocks and repeaters in place. Note, the script also places the necessary repeaters to clear the data memory, data stack, and other necessary components - along with pasting the compiled program into the instruction memory.


![image](https://hackmd.io/_uploads/H1w17xjlxg.png)


4. After this, hit `m` and navigate to `configuration menu`, then hit the `hotkeys` menu. Select a hotkey for the **executeOperation** field. Now exit all the litematica menus and use that hotkey. All your instruction memory should now be pasted in properly!
        

### 5. Run the Minecraft CPU
Run the program!
![image](https://hackmd.io/_uploads/B1J2Vgjexx.png)

### 6. Gather results, and verify the program.
- Take screenshots, take note of things you've observed.

### 7. Compile a report
- 1 to 2 paragraphs, should not be long. Just tell us:
    - What did your program aim to accomplish?
    - Did you run into any problems? If so, how did you solve them?
    - How did you verify your program? Include screenshots if you want :D
