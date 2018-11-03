on run {input, parameters}
    tell application "Finder"
        set dir_path to quoted form of (POSIX path of (folder of the front window as alias))
    end tell
    CD_to(dir_path)
end run

on CD_to(theDir)
    tell application "iTerm"
        activate
        set go_dir to "cd " & theDir
        try
            set currentWindow to the last window
        on error
            set currentWindow to (create window with default profile)
        end try
        tell current window
            -- These commands return a tab
            set newTab to (create tab with default profile)
            tell newTab
                select
                tell current session of currentWindow
                    write text go_dir
                end tell
            end tell
        end tell
    end tell
end CD_to
