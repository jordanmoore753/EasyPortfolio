# EasyPortfolio

## Classes, Files, Objects

We have an `Input` class. This class handles all of the user input that goes into creating the portfolio. 

We have an `Output` class. This class handles all of the output displayed to the user throughout the course of the program. The ability to issue these `Output` objects is up to the `EasyPortfolio` class which runs the execution, so they are nouns, not verbs. 

We have a `Create` module. It is a module because create is a verb and is something that the `easy_portfolio` has the ability to do. They are behaviors, not nouns.

We have a `Command` module. This module houses the methods that issue commands to the CLI. These are primarily verbs so they make semantic sense as a module.

We have a `Version` module. This module contains behaviors that are used to increment the version number housed in another file.

## How I Got The Project Creation Working

The problem was that the files in `lib` were not available because `dir` are automatically removed from the `files` instance variable in `Gemspec`. So, I just needed to actually put files into those directories and then require those specific files in the `files` instance variable.

To avoid manually putting every file in there, I need to come up with a single method that returns EVERY absolute path of the files inside of lib.