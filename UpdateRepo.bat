@echo off

REM Display a message about the actions it will preform
echo 1. This batch script performs the following actions:
echo 2. Requests a Directory Path: It prompts the user to enter the path to their Git repository.
echo 3. Changes to the Specified Directory if valid.
echo 4. Stages All Changes: It stages any modifications made in the repository for committing.
echo 5. Commits the Changes: It commits the staged changes with the message "Update."
echo 6. Pushes to the Remote Repository: It sends the committed changes to the main branch of the remote repository.
echo 7. Holds the Console Open: Finally, it pauses to allow the user to read any output before closing the command prompt.

REM Prompt for the directory location
set /p repoDir="Enter the path to your Git repository: "

REM Navigate to the specified directory
cd /d "%repoDir%" || (
    echo Invalid directory. Exiting.
    exit /b
)

REM Stage all changes
git add .

REM Commit changes with a message
git commit -m "Update"

REM Push changes to the main branch
git push origin main

pause
::
::Breakdown:
::
::    @echo off:
::        This command prevents the commands in the script from being displayed in the command prompt as they execute. Only output from echo statements will be shown.
::
::    REM Display a message about the actions it will preform:
::        This line is a comment (using REM), explaining that the next command will display "Hello World."
::
::    echo Hello World:
::        This command prints "Hello World" to the command prompt.
::
::    REM Prompt for the directory location:
::        Another comment indicating that the script will ask for a directory input next.
::
::    set /p repoDir="Enter the path to your Git repository: ":
::        This line prompts the user to enter the path to their Git repository and stores the input in the variable repoDir.
::
::    REM Navigate to the specified directory:
::        A comment indicating that the script will attempt to change to the specified directory.
::
::    cd /d "%repoDir%" || (:
::        This command changes the current directory to the one specified by repoDir. The /d switch allows changing the drive if necessary. If the directory change fails, the commands in the parentheses will ::execute.
::
::   echo Invalid directory. Exiting.:
::        This command runs if the directory change fails, notifying the user that the specified directory is invalid.
::
::    exit /b:
::        This command exits the script if the directory change fails.
::
::    REM Stage all changes:
::        A comment indicating that the next command will stage changes in Git.
::
::    git add .:
::        This command stages all changes in the current directory for the next commit.
::
::    REM Commit changes with a message:
::        A comment indicating that the next command will commit the staged changes.
::
::    git commit -m "Update":
::        This command commits the staged changes with the message "Update".
::
::    REM Push changes to the main branch:
::        A comment indicating that the next command will push changes to the remote repository.
::
::    git push origin main:
::        This command pushes the committed changes to the main branch of the remote repository named origin.
::
::    pause:
::        This command pauses the script and waits for the user to press any key before closing the command prompt window, allowing them to see any output.
::
::Summary:
::
::This batch script performs the following tasks:
::
::    Displays a message about the actions it will preform.
::    Prompts the user for the directory of their Git repository.
::    Navigates to that directory (exiting if the directory is invalid).
::    Stages all changes in the repository.
::    Commits those changes with a default message ("Update").
::    Pushes the committed changes to the main branch of the remote repository.
::    Finally, it pauses to allow the user to see the results before closing.