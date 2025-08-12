```python
# Import necessary libraries
import ipywidgets as widgets
from IPython.display import display
import subprocess
from datetime import datetime
from zoneinfo import ZoneInfo
```

# Introduction to Programming with Python

Welcome to Computer Science! 🚀 In this first chapter, we'll dive into the basics of programming using **Python**, a powerful and popular language known for its simple, readable syntax. We'll also use a special graphics library called **`pytamaro`** to create interesting visuals right from the start.

### Why These Tools?

* **Python:** It's a fantastic language for beginners because its syntax is close to English, letting you focus on programming concepts rather than complex rules. It's also used by professionals at places like Google, NASA, and Spotify.
* **`pytamaro`:** Learning to code is more fun when you can see your results. This library makes it easy to draw shapes, create images, and learn core programming ideas in a visual way.
* **Jupyter Notebooks:** This interactive environment, which you're looking at right now, lets us mix live code, explanatory text, and images all in one place. It’s the perfect digital workbook for learning and experimenting.

### How Will We Work and Learn?

Writing programs takes time and perseverance. I will be giving you time to work independently on various coding exercises. Please use your time during the lessons efficiently. The first exam will cover basic Python programming skills and some theory and definitions. It will be a pen and paper exam. Make sure you practice writing code down and thinking about the output while practicing.

---

## Your First Steps in the Notebook

This document is a **Jupyter Notebook**, and it's made up of individual blocks called **cells**. A cell can contain either text (like this one) or code.

**Working with Code Cells**
To run a code cell, you can either click the "play" button (▶️) that appears to its left or select the cell and press `Ctrl+Enter`. This executes the Python code inside and shows the output directly below. You can click on any code cell to edit its contents.

**Working with Text Cells**
The text you're reading is in a **Markdown cell**. Markdown is a simple way to format text using plain characters. To see the "raw" text, just double-click on a text cell. To render it again, press `Ctrl+Enter`.

Here are a few basic Markdown commands:
* `# Title` creates a main heading, `## Subtitle` creates a smaller one.
* `*text*` makes text *italic*.
* `**text**` makes text **bold**.
* `` `code` `` formats text as `inline code`.

---

### Goals for this Chapter

By the end of this chapter, you will be able to:
* Understand the roles of Python, `pytamaro`, and Jupyter Notebooks.
* Confidently navigate and interact with notebook cells.
* Write and execute basic Python commands to create simple graphics.

Let's get started!

# What is a computer program?

At its heart, a **computer program** is a set of precise instructions given to a computer to perform a specific task. Think of it like a recipe for a chef 🧑‍🍳. The recipe lists the ingredients (the data) and provides a step-by-step guide on what to do with them (the instructions). The computer, like a chef, follows these instructions exactly to produce a final result, whether it's calculating a budget, displaying a webpage, or running a game.

These instructions are written by a programmer in a special language that the computer can understand, known as a **programming language**.

A computer executes these instructions with incredible speed and accuracy, but it has no creativity or common sense. It will do exactly what it's told, even if the instructions are illogical. A core part of programming is learning how to break down a complex problem into tiny, logical steps that a computer can follow without error.

---

## A simple example
The following is an algorithm for making a cup of tea
1. Put the teabag in a cup.
1. Fill the kettle with water.
1. Boil the water in the kettle.
1. Pour some of the boiled water into the cup.
1. Add milk to the cup.
1. Add sugar to the cup.
1. Stir the tea.
1. Drink the tea.

### <span style="color: blue"> Exercise </span>
In groups of two discuss: Imagine giving a robot that can understand human language the previous set of instructions. Where are there possibilities for the robot to make mistakes? Where might the robot not know what is meant? Try to find the weirdest ways of interpreting these instructions.

Write all your ideas into the markdown cell below. Click on `Commit and Push` to save your answers.

#### [Double Click Here to Enter Your Answers]

---
### <span style="color: blue"> Exercise (Malicious Compliance) </span>
Play a game in groups of two: One person is a genie that grants the other person one wish. The task of the genie is to try to comply with the wish as maliciously as possible i.e. find the worst possible way of interpreting said wish.

Write your favorite wish and compliance in the markdown cell below.

#### [Double Click Here to Enter Your Answers]

---

## On Algorithms

An **algorithm** is a step-by-step procedure for solving a problem or achieving a specific goal. If a computer program is like a recipe, the algorithm are the individual steps written in the recipe itself.

Think about giving someone directions to your home. You provide a sequence of clear steps: "Go straight for two blocks, turn left at the bakery, and it's the third house on the right." That sequence is an algorithm.

---

### What Makes a Good Algorithm?

Not just any set of instructions makes a good algorithm. A well-designed algorithm must be:

* **Finite:** It must eventually end. An algorithm that runs forever without producing a result isn't very useful.
* **Well-Defined:** Each step must be precise and unambiguous. Instructions like "add a little bit of salt" are not well-defined for a computer. It needs an exact quantity, like "add 5 grams of salt."
* **Effective:** It must solve the problem it was designed to solve. An algorithm for sorting numbers that occasionally leaves some unsorted is a failed algorithm.

---

### Algorithms vs. Programs

It's important to understand the difference between an algorithm and a program. An algorithm is a conceptual plan, like a blueprint. A **program** is the concrete implementation of that plan, written in a specific programming language like Python. The same algorithm could be written as a program in many different languages.

---

### <span style="color: blue"> Assignment </span>
Work through this introduction to the Python language and syntax:
[silent teacher](https://silentteacher.toxicode.fr/hour_of_code.html?theme=basic_python)

---

### <span style="color: blue"> Assignment </span>
Work through this puzzle game:
[little dot](https://little-dot.toxicode.fr/)

---

## An Introduction to PyTamaro
In this section we will use the PyTamaro library to draw graphics.

### <span style="color: blue"> Assignment </span>
Work through the introduction to PyTamaro:
[pytamaro intro](https://pytamaro.si.usi.ch/curricula/luce/welcome)


```python
from pytamaro import rectangle, blue, show_graphic

height = 300

# create a white rectangle with the given height and a width 3/2 times larger
background = rectangle(3/2*height, height, blue)

show_graphic(background)  # this shows your background
```


    
![png](intro_files/intro_10_0.png)
    



```python
# Click this button to commit and push all your changes
def git_push_button_clicked(b):
    try:
        timezone = ZoneInfo('Europe/Zurich')
    except Exception as e:
        print(f"Error setting timezone: {e}. Defaulting to system time.")
        now = datetime.now()
    else:
        now = datetime.now(timezone)
    timestamp = now.strftime("%Y-%m-%d %H:%M:%S")
    commit_message=f"Submission at {timestamp}"
    try: 
        subprocess.run(['python','-m','nbconvert','--to','markdown','intro.ipynb'],check=True, capture_output=True, text=True)
        print('saved markdown')
    except subprocess.CalledProcessError as e:
        print('An error occurred while saving as markdown')
        print(e.stderr)
    try:
        # Add all changes
        subprocess.run(['git', 'add', '.'], check=True, capture_output=True, text=True)
        print("Staged all changes.")

        # Commit changes
        subprocess.run(['git', 'commit', '-m', commit_message], check=True, capture_output=True, text=True)
        print("Committed changes.")

        # Push to the remote repository (assuming 'origin' and 'main' or 'master' branch)
        subprocess.run(['git', 'push', 'origin', 'main'], check=True, capture_output=True, text=True)
        print("Pushed to remote repository.")

        print("Git commit and push successful!")
    except subprocess.CalledProcessError as e:
        print("An error occurred during git commands:")
        print(e.stderr)

push_button = widgets.Button(description="Commit & Push")
push_button.on_click(git_push_button_clicked)
display(push_button)
```


    Button(description='Commit & Push', style=ButtonStyle())

