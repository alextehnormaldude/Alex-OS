#!/bin/bash
# Goji OS v1.0 (Mac Native Edition)
# Default Shell: Bash / Zsh Compatibility Layer

# Set Terminal style (Black background, Green text)
printf '\e[30;42m'
clear


custom_user="User"


bootscreen() {
    clear
    read -sp "Password: " password
    echo "" # New line after hidden password entry
    
    if [ "$password" = "G0j1ra" ]; then
        desktop
    else
        bootscreentwo
    fi
}

desktop() {
    while true; do
        clear
        echo "Goji OS v1.0"
        echo "Date: $(date '+%Y-%m-%d') Time: $(date '+%H:%M:%S')"
        echo "-----------------------------------------"
        echo "Stuff:"
        echo "1) Notes"
        echo "2) Goji Files"
        echo "3) Calculator"
        echo "4) Gojiranet"
        echo "5) System Settings"
        echo "6) Shutdown Terminal Console"
        echo "-----------------------------------------"
        read -p "Choose: " menuselect

        case $menuselect in
            1) write_app ;;
            2) browse_app ;;
            3) calculator_app ;;
            4) internet_app ;;
            5) syssett_app ;;
            6) 
                clear
                echo "Shutting down Goji OS..."
                printf '\e[0m' # Reset terminal colours
                clear
                exit 0 
                ;;
            *) echo "Invalid option"; sleep 1 ;;
        esac
    done
}

write_app() {
    clear
    echo "Welcome to Notes..."
    read -p "What will be the name of your text?: " writeone
    read -p "Content: " textone
    
    # Save directly to a standard text file on your disk
    echo "$textone" > "${writeone}.txt"
    echo "File has been created!"
    read -p "Press Enter to return to Desktop..." temp
}

browse_app() {
    clear
    echo "--- GOJI STORAGE FILES ---"
    # List any .txt files available in the running folder
    ls *.txt 2>/dev/null || echo "[No custom notes created yet]"
    echo "--------------------------"
    read -p "Type file name to view (or press Enter to exit): " view_file
    if [ -f "$view_file" ]; then
        clear
        cat "$view_file"
        read -p "Press Enter to return..." temp
    fi
}

calculator_app() {
    clear
    read -p "Equation (e.g. 2+2): " equ
    # Using 'bc' for precise mathematical computing on macOS
    result=$(echo "scale=2; $equ" | bc 2>/dev/null)
    echo "Result: $result"
    read -p "Press Enter to return..." temp
}

internet_app() {
    while true; do
        clear
        echo "Welcome to the Gojiranet"
        echo "1) Roarer"
        echo "2) Animtube"
        echo "3) Exit Website Portal"
        read -p "Choose website: " netselect

        case $netselect in
            1) roarer_app ;;
            2) animtube_app ;;
            3) break ;;
        esac
    done
}

roarer_app() {
    clear
    echo "===================================================="
    echo "                   Roarer - @$custom_user"
    echo "===================================================="
    echo ""
    
   
    if [ -f "global_updates.txt" ]; then
        cat global_updates.txt >> roarer_feed.txt
        rm global_updates.txt 
    fi

    if [ -f "roarer_feed.txt" ]; then
        cat roarer_feed.txt
    else
        echo "[$(date '+%Y-%m-%d')] NETWORK: Feed is entirely empty."
        echo "Use Option 1 to start broadcasting across Gojiranet!"
    fi
    echo ""
    echo "===================================================="
    echo "1) Post a Roar  2) Refresh Feed  3) Exit Gojiranet"
    echo "===================================================="
    read -p "Select: " roar_choice

    if [ "$roar_choice" = "1" ]; then
        clear
        echo "===================================================="
        echo "               BROADCAST TO GOJIRANET FEED           "
        echo "===================================================="
        echo ""
        
        # Capture the input variables dynamically via read
        read -p "Enter Custom Username: @" temporary_user
        
        # Enforce blank checks
        if [ -z "$temporary_user" ]; then
            echo "[ERROR] Username cannot be blank."
            sleep 1
            roarer_app
            return
        fi
        
        read -p "What is happening?: " custom_post
        if [ -z "$custom_post" ]; then
            echo "[ERROR] Message cannot be blank."
            sleep 1
            roarer_app
            return
        fi

        # Update global header username variable and save to text file
        custom_user=$temporary_user
        echo "[$(date '+%H:%M')] @$temporary_user: $custom_post" >> roarer_feed.txt
        
        echo ""
        echo "Transmitting packets to server cluster..."
        sleep 1
        roarer_app
    elif [ "$roar_choice" = "2" ]; then
        echo "Polling shared database..."
        sleep 1
        roarer_app
    fi
}

syssett_app() {
    clear
    echo "--- SYSTEM SETTINGS ---"
    echo "1) Theme: Matrix Green"
    echo "2) Theme: Cyber Red"
    read -p "Choose: " setchoice
    if [ "$setchoice" = "1" ]; then
        printf '\e[30;42m'
    elif [ "$setchoice" = "2" ]; then
        printf '\e[37;41m' # White text, red background
    fi
}

bootscreentwo() {
    clear
    echo "Goji OS"
    echo "1) Admin Login"
    echo "2) Guest Login"
    read -p "Option: " logintype
    if [ "$logintype" = "1" ]; then
        bootscreen
    elif [ "$logintype" = "2" ]; then
        ltddesktop
    else
        bootscreentwo
    fi
}

ltddesktop() {
    clear
    echo "Logged in as guest. No file read/write permissions allowed."
    echo "1) Calculator  2) Clock  3) Log Out"
    read -p "Choose: " ltdmenu
    if [ "$ltdmenu" = "1" ]; then
        calculator_app
        ltddesktop
    elif [ "$ltdmenu" = "2" ]; then
        clear
        date
        read -p "Press Enter..." temp
        ltddesktop
    else
        bootscreentwo
    fi
}

animtube_app() {
    while true; do
        clear
        echo "===================================================="
        echo "             ANIMTUBE - GOJIRANET MEDIA             "
        echo "===================================================="
        echo " [STREAMING PLATFORM ACTIVE] "
        echo "===================================================="
        echo " 1) Godzilla and ghidorah"
        echo " 2) Mothra's flapping"
        echo " 3) Back to Gojiranet Directory"
        echo "===================================================="
        printf "animtube-player> "
        read -r vidselect

        case $vidselect in
            1)
             Mn
                for frame in {1..4}; do
                    clear
                    echo "Playing: Godzilla and ghidorah..."
                    echo " [ ▩▩▩▩▩▩▩▩▩▩ ] 100% Buffered"
                    echo "----------------------------------------------------"
                    if [ "$frame" -eq 1 ] || [ "$frame" -eq 3 ]; then
                        echo "   (o_o)   ⚡⚡                      /\\_/\\"
                        echo "   /(_)\\                             ( -_- )"
                        echo "   ^ ^ ^                              )   ("
                    else
                        echo "   (>_<)             ⚡⚡             /\\_/\\"
                        echo "   /(_)\\                             ( =_= ) 🔥🔥🔥"
                        echo "   ^ ^ ^                              )   ("
                    fi
                    echo "----------------------------------------------------"
                    echo " >> Playing video loops... Hold Control+C to force stop"
                    sleep 0.5
                done
                printf "\nPlayback finished. Press Enter..."
                read -r temp
                ;;
            2)
               
                for frame in {1..6}; do
                    clear
                    echo "Playing: Mothra's flapping..."
                    echo " [ ▩▩▩▩▩▩▩▩▩▩ ] 100% Buffered"
                    echo "----------------------------------------------------"
                    if [ $((frame % 2)) -eq 0 ]; then
                        echo "       \\     /   "
                        echo "    _--_ \\ / _--_ "
                        echo "   (    ( O )    )"
                        echo "    \\__// ^ \\__// "
                    else
                        echo "    ----_   _---- "
                        echo "   (     \\ /     )"
                        echo "    \\____(O)____/ "
                        echo "         / \\      "
                    fi
                    echo "----------------------------------------------------"
                    sleep 0.4
                done
                printf "\nPlayback finished. Press Enter..."
                read -r temp
                ;;
            3)
                break
                ;;
            *)
                echo "[ERROR] Stream address invalid."
                sleep 1
                ;;
        esac
    done
}

# Boot up the OS script layout immediately on runtime execution
bootscreen
