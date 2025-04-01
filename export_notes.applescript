tell application "Finder"
    -- Open a folder picker dialog to choose the save location
    set selectedFolder to choose folder with prompt "Select the folder to save exported notes:"
end tell

tell application "Notes"
    -- Get the path of the selected folder
    set notesFolder to POSIX path of selectedFolder
    
    -- Create folder if it doesn't exist
    do shell script "mkdir -p " & quoted form of notesFolder
    
    set noteCount to count of notes in default account
    repeat with i from 1 to noteCount
        set theNote to note i in default account
        set noteTitle to name of theNote
        set noteContent to body of theNote
        
        -- Sanitize filename (remove invalid characters)
        set noteTitle to my sanitizeFileName(noteTitle)
        
        -- File path for markdown file
        set filePath to notesFolder & noteTitle & ".md"
        
        -- Prepare Markdown content
        set markdownContent to "# " & noteTitle & linefeed & linefeed & noteContent
        
        -- Use shell command to create and write to the file
        do shell script "echo " & quoted form of markdownContent & " > " & quoted form of filePath with administrator privileges
    end repeat
end tell

-- Function to sanitize filenames
on sanitizeFileName(fName)
    set AppleScript's text item delimiters to {"/", ":", "*", "?", "<", ">", "|", "\""}
    set fName to text items of fName
    set AppleScript's text item delimiters to "_"
    set fName to fName as text
    set AppleScript's text item delimiters to ""
    return fName
end sanitizeFileName
