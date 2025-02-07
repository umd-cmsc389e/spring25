# CMSC389E Project 1 - Logic Gates and Adders

Due: **Friday, February 28th, 2025 at 11:59PM** on **[Gradescope](https://www.gradescope.com/courses/936971/assignments/5554796)**

## Importing Projects
To import the project, you need to download `project1.zip`, extract it, and move it into the `saves` folder of your Fabric installation folder. The easiest way of doing this is the following:

1. Download `project1.zip` from this directory
2. Locate your `./Downloads` folder and extract the contents of `project1.zip` into `project1`
3. Use `Ctrl + X` on the `project1` folder to cut it, saving it into your clipboard
4. Go to your Minecraft Launcher and locate the **Installation Folder** for `fabric-loader-1.20.1`, similar to what you did during setup. Click on "Open installations folder"
![image](https://hackmd.io/_uploads/B1PLvzvwJl.png)
5. Navigate to the `saves` folder, and use `Ctrl + V` to paste `project1`
6. Finally, run Minecraft, go to "Singleplayer", and you should see **Project 1** has been successfully imported!


## Submitting Projects
Projects will be submitted and autograded via **Gradescope**. If you are not already in the **Gradescope**, the join code can be found in the syllabus. To submit the project, you will need to locate your `project1` world file, zip it into `project1.zip`, and submit it into the relevant Gradescope assignment. Here's a step-by-step:

1. Go to your Minecraft Launcher and locate the **Installation Folder** for `fabric-loader-1.20.1`, similar to what you did during setup. Click on "Open installations folder"
![image](https://hackmd.io/_uploads/B1PLvzvwJl.png)
2. Go to the `saves` folder, right click on `project1`, and compress it to **ZIP File**. 
3. Go to the Gradescope assignment and upload the relevant **ZIP File**.

## Notes

* For any of the tasks, **DO NOT** destroy or move the input/output lamps. We hardcode the input/output locations for the autograder to test your builds. 
* You may build outside of the **Gold Blocks**, but we always provide you with enough space to complete your build inside. 
* To receive directions for each of the tasks, **Middle Click** on the **Book and Quill** inside of the **Item Frame**. If you accidentally destroy them, don't worry - we put the instructions here as well.
* In some parts of the world, we have provided **compact designs** for logic gates/adders. Compact builds make structures easy to incorporate into larger builds. Use these designs for future successive builds; do **NOT** simply copy them for a previous problem.

## Section 1 - Logic Gates

### **Task 1**: Combine the **blue input** and the **orange output** with a **NOT gate**.

| Input (Blue) | Output |
|--------------|-----------------|
| 0            | 1               |
| 1            | 0               |

### **Task 2**: Combine the **blue input** and the **orange output** with a **OR gate**.

| Input 1 (Blue) | Input 2 (Green) | Output |
|----------------|-----------------|-----------------|
| 0              | 0               | 0               |
| 0              | 1               | 1               |
| 1              | 0               | 1               |
| 1              | 1               | 1               |

### **Task 3**: Construct a **AND gate** using only **NOT** and **OR gates**.

| Input 1 (Blue) | Input 2 (Green) | Output |
|----------------|-----------------|-----------------|
| 0              | 0               | 0               |
| 0              | 1               | 0               |
| 1              | 0               | 0               |
| 1              | 1               | 1               |

### **Task 4**: Construct a **XOR gate** using only **NOT**, **OR**, and **AND gates**.

| Input 1 (Blue) | Input 2 (Green) | Output |
|----------------|-----------------|-----------------|
| 0              | 0               | 0               |
| 0              | 1               | 1               |
| 1              | 0               | 1               |
| 1              | 1               | 0               |

**Hint:** Utilize the third dimension!

### **Task 5**: Construct a **NOR gate** using only **NOT** and **OR gates**.

| Input 1 (Blue) | Input 2 (Green) | Output |
|----------------|-----------------|-----------------|
| 0              | 0               | 1               |
| 0              | 1               | 0               |
| 1              | 0               | 0               |
| 1              | 1               | 0               |

### **Task 6**: Construct a **NAND gate** using only **NOT** and **AND gates**.

| Input 1 (Blue) | Input 2 (Green) | Output |
|----------------|-----------------|-----------------|
| 0              | 0               | 1               |
| 0              | 1               | 1               |
| 1              | 0               | 1               |
| 1              | 1               | 0               |

## Section 2 - Adders

### **Task 7**: Construct a **XNOR gate** using only **NOT** and **XOR gates**.

| Input 1 (Blue) | Input 2 (Green) | Output |
|----------------|-----------------|-----------------|
| 0              | 0               | 1               |
| 0              | 1               | 0               |
| 1              | 0               | 0               |
| 1              | 1               | 1               |

### **Task 8**: Construct a **Half Adder** that adds two input bits into a two-digit binary number.

| Input 1 (Blue) | Input 2 (Green) | Carry (Red) | Sum |
|----------------|-----------------|-------------|--------------|
| 0              | 0               | 0           | 0            |
| 0              | 1               | 0           | 1            |
| 1              | 0               | 0           | 1            |
| 1              | 1               | 1           | 0            |

**Note:**  
- **Red** = Carry  
- **Orange** = Sum Bit  

**Hint:** Use a **AND gate** and a **XOR gate**.

### **Task 9**: Construct a **Full Adder** that adds three input bits into a two-digit binary number.

**Hint:** Use two **Half Adders** in sequence.

### **Task 10**: Construct a **4-bit Adder** that adds two 4-digit binary numbers into a 5-digit binary number  
(*Performs **A** + **B***).

Use WorldEdit and the compact **Full Adder** given in the previous module.  
**Note:** We will not touch the Carry In signal. You are responsible for setting it!

### **BONUS Task (1 pt)**: Modify your **4-bit Adder** to build a **4-bit Subtracter** that subtracts two 4-digit (signed) binary numbers into a 5-digit binary number  
(*Performs **A** - **B***).

**Hint:** Use **Two's Complement!**  
**Note:** We will not touch the Carry In signal. You are responsible for setting it!
