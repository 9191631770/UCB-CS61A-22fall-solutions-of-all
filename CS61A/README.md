Using no command-line options will run the code in the file you provide and return you to the command line. For example, if we want to run lab00.py this way, we would write in the terminal:

python3 lab00.py


-i: The -i option runs your Python script, then opens an interactive session. In an interactive session, you run Python code line by line and get immediate feedback instead of running an entire file all at once. To exit, type exit() into the interpreter prompt. You can also use the keyboard shortcut Ctrl-D on Linux/Mac machines or Ctrl-Z Enter on Windows.
If you edit the Python file while running it interactively, you will need to exit and restart the interpreter in order for those changes to take effect.
Here's how we can run lab00.py interactively:

python3 -i lab00.py


-m doctest: Runs doctests in a particular file. Doctests are surrounded by triple quotes (""") within functions.

Each test in the file consists of >>> followed by some Python code and the expected output (though the >>> are not seen in the output of the doctest command).
To run doctests for lab00.py, we can run:


python3 -m doctest lab00.py