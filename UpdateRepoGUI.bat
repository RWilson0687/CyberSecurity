@echo off
setlocal

REM Display a message about the actions it will preform
echo This script facilitates selecting a directory for a Git repository, allows the user to provide a commit message, and then stages, commits, and pushes changes to the remote repository. 
echo It includes user-friendly prompts and error handling for canceled selections or invalid paths.

REM Use PowerShell to open a dialog for selecting a folder
for /f "delims=" %%i in ('powershell -command "Add-Type -AssemblyName System.Windows.Forms; $folder = New-Object System.Windows.Forms.FolderBrowserDialog; if ($folder.ShowDialog() -eq 'OK') { $folder.SelectedPath }"') do set "repoDir=%%i"

REM Check if the user canceled the dialog
if "%repoDir%"=="" (
    echo No directory selected. Exiting.
    exit /b
)

REM Navigate to the specified directory
cd /d "%repoDir%" || (
    echo Invalid directory. Exiting.
    exit /b
)

REM Prompt for the commit message
set /p commitMessage="Enter your commit message: "

REM Stage all changes
git add .

REM Commit changes with the user-provided message
git commit -m "%commitMessage%"

REM Push changes to the main branch
git push origin main

pause
:: Breakdown
::
::This batch file performs a series of tasks related to Git version control. Here’s a breakdown of its functionality:
::
::    Setup Environment:
::        @echo off prevents commands from being displayed in the console.
::        setlocal starts a local scope for environment variables.
::
::    Display Initial Message:
::        It outputs the word "Actions" to indicate the operations that will follow.
::
::    Open Folder Selection Dialog:
::        It uses PowerShell to launch a folder selection dialog. The user can choose a directory, and the selected path is stored in the variable repoDir.
::
::    Check for User Cancellation:
::        If the user cancels the dialog (i.e., no directory is selected), it displays a message saying "No directory selected. Exiting." and exits the script.
::
::    Change Directory:
::        It attempts to change to the specified directory (repoDir). If the directory is invalid, it shows an error message and exits.
::
::    Prompt for Commit Message:
::        The script prompts the user to enter a commit message, which will be stored in the variable commitMessage.
::
::    Stage Changes:
::        It stages all changes in the Git repository using git add ..
::
::    Commit Changes:
::        The script commits the staged changes with the user-provided commit message.
::
::    Push to Remote Repository:
::        It pushes the committed changes to the main branch of the remote repository.
::
::    Pause:
::
::    Finally, it pauses the script to allow the user to read any output before closing the console.