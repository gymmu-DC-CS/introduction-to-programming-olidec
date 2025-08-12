# Assignment Instructions

Assignments are given as Jupyter Notebooks, where you can enter code into cells and run it directly. In order for everyone to have the same environment, follow the instructions below. You should then have a development environment with all necessary pieces installed.

## Setup (One-Time)

1. Install Docker:

   - Download the appropriate version from [Docker Desktop](https://www.docker.com/products/docker-desktop)
   - Open Docker App and start Docker. You can then ignore this app in future.
   - The previous step may need to be repeated after a reboot.

2. Install Visual Studio Code:

   - Download the appropriate version from [Visual Studio Code](https://code.visualstudio.com/)
   - Open the application
   - Install the following VSCode extensions:
     - **Dev Containers**
     - **Python**
     - **Jupyter**

3. Accept your Assignment
   - Click on the link on OneNote
   - Select your name from list
   - Click on the link to your newly generated repository
   - Select an appropriate location
   - Highlight the URL and copy the address to your repository

3. Clone your GitHub Classroom repository:
   - On the starting page of Visual Studio Code select `Open Github Repository...`
   - Paste the link to your classroom repository.
   - When opening VSCode will ask whether to `Reopen in Container`. Click the blue button to open the coding environment.

4. Open the Assigment Notebook
   - Click on the jupyter notebook (a file ending in `.ipynb`)
   - The first time you open a new notebook, you will have to manually select the correct kernel:
      - Click on the button labelled `Select Kernel` 
      - In the drop-down menu select `Python Environments...`
      - Select the environment with the path `/usr/local/bin/python` (This one should also have a star and have the additional label `Recommended`) 

## Opening the Development Environment
   - If you are editing the folder directly, you can reload the window using the command: `Ctrl-Alt-P` and then selecting `Developer: Reload Window` (you can filter commands by typing the first few letters).
   - Then click the blue button `Reopen in Container`.
   - You should now be able to edit and save the jupyter notebook.

## Submit Your Work

Click on the button labelled `Commit & Push` to commit your changes and push to your github repository. Make sure you have saved (`Ctrl-S`) before you click.
