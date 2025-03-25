#!/bin/bash

start_time=$(date +%s)
endings=()
inventory=()
clogged=0
error_counter=0
mixer=0

clear

echo "You wake up in a house."
sleep 1s
echo "There is an orange on the perfect center of a perfectly circular table in the perfect middle of a perfect, orange room."
sleep 6s
echo "There is also a todo list next to the orange. Read it ?"
sleep 2s

todolist=$(gum choose "Yes" "No")
if [ "$todolist" == "Yes" ]; then
    echo
    # Use gum format to create a formatted markdown list with "TODAY" as an H1
    gum format -- "# TODAY"
    gum format -- "- Do something"
    gum format -- "- Finish game"

    read -r
elif [ "$todolist" == "No" ]; then
    echo 'Program: {{Italic "Damn users. I do hard work and all they can say is no."}}' | gum format -t template
    sleep 5
fi

main () {
    while true; do
        current_time=$(date +%s)
        elapsed_time=$((current_time - start_time))

        if [ $elapsed_time -ge 86400 ]; then
            echo "You've been playing with the orange for 24 consecutive hours!"
            echo "Your obsession with the orange has driven you mad."
            echo "You start hallucinating and seeing oranges everywhere."
            echo "You eventually lose touch with reality and are committed to an asylum."
            echo "Game Over. Ending 3: The Orange Madness."
            exit
        fi

        what_to_do=$(gum choose --cursor.foreground "#ff8c00" "roll" "actions" "toilet" "eat" "squish" "mix" "store" "walk" "tv" "wither" "patience" "explore" "pickup" "sue" "throw" "type" "leave")

        case "$what_to_do" in
            "actions")
                clear
                echo "Available actions:"
                echo "  toilet - Do 2nd buisness"
                echo "  eat - Eat it"
                echo "  squish - Squish the orange"
                echo "  mix - Mix it in the... mixer?"
                echo "  store - Store it in inventory"
                echo "  date - Have a romantic date with the orange"
                echo "  type - Type in secret command"
                echo "  leave - Terminate Orange simulation"
                echo "  walk - Go to the park walk your orange"
                echo "  tv - Open the TV"
                echo "  wither - Let it wither away"
                echo "  patience - Patience test"
                echo "  explore - Look around the house"
                echo "  pickup - Pickup the phone"
                echo "  sue - Sue the orange"
                echo "  throw - Throw the orange away"
                ;;
            "toilet")
                clear
                if [[ "$clogged" -ge  1 ]]; then
                    echo "Don't you remember ? You CLOGGED the toilet."
                else
                    echo "Mmm. Mmm."
                    gum spin --title="Clogging toilet" --spinner="pulse" -- sleep 5
                    echo "Now, the toilet is clogged."
                    clogged=1
                fi
                ;;
            "eat")
                echo "You eat it."
                sleep 1
                echo "Wait, you didn't peel it?"
                sleep 1
                echo "Now, you want to go to the toilet."
                ;;
            "squish")
                echo "You squish it. It's not so bad."
                sleep 1
                echo 'Program: {{ Italic "Yeah it feels like a bre-" }}' | gum format -t template
                sleep 3
                echo
                echo 'Program: {{ Bold "Nevermind." }}' | gum format -t template  
                sleep 2
                ;;
            "mix")
                echo "You mix it in the mixer. You enjoy its beautiful juice."
                echo "You decide to store the juice in your inventory."
                inventory+=('Orange Juice')
                error_counter=$((error_counter + 1))

                ;;
            "store")
                echo "You store it in inventory."
                inventory+=('Orange')
                sleep 1 && echo "."
                sleep 2 && echo ".."
                sleep 2.5s && echo "..."
                main
                ;;
            "roll")
                echo "You roll the orange. It's fun."
                gum spin --title="Playing Tangerine's RNG" --spinner="meter" -- sleep 9
                echo "Creator: Do something of your life, stop playing."
                sleep 1.5s
                echo "You: Nah I'd roll."
                ;;
            "type")
                type=$(gum input --cursor.foreground="#ff8c00" --placeholder="Type your command...")

                if [ "$type" == "pastebin" ]; then
                    echo 'Oh, you must be the co-creator then. I have a message for you. pastebin.com/2ewyY8Sc'
                elif [[ "$type" == "pinkfloyd" ]]; then
                    echo 'Whats your favorite album ? Mine is {{ Italic "The Wall" }} !1!1!1!'
                    gum choose "The Darkside of the Moon" "The Wall" "The final Cut" "The Divison bell" "The Endless River"
                    echo 'Good taste !'
                elif [[ "$type" == "detective" ]]; then
                    echo "Dooley!"
                elif [[ "$type" == "maram" ]]; then
                    echo 'The Creator is with you. He has you in his :heart:.'
                elif [[ "$type" == "credits" ]]; then
                    echo "A game made by Adam ELLOUZE alias Holy65 (Developer) and Maram AROUAY alias Willowwy (Ideas). Game concept by Zakaria GHARBI alias UnusalTurtle"
                else
                    echo "You did something wrong. Like everything you ever done in your life."
                fi
                ;;
            "leave")
                echo "You leave the house."
                echo '{{ Italic "A perfectly timed orange falling from the roof hits you on your neck. You die"}}' | gum format -t template
                sleep 2
                echo
                echo "Program, ironically : Poor him! Gonna press F on my smallest keyboard."
                sleep 1
                exit
                ;;
            "walk")
                echo "You decide to walk your Orange at the nearest park."
                gum spin --title="Walking orange" --spinner="globe" -- sleep 8
                ;;
            "tv")
                echo "You decide to watch the latest news."
                sleep 2
                echo '{{ Italic "Journalist: Welcome and soon goodbye everyone. First news today (and probably last) is The Day Oranges took over Rob- the World. Goodbye everyone, good survival." }}' | gum format -t template
                echo "You hear a knock knock."
                door=$(gum confirm "Open the door ?")

                if [[ "$door" == 1 ]]; then
                    echo "You keep the door sealed shut."
                    sleep 1
                    echo "Like if it didn't matter, an enormous orange opens the door, sending you flying."
                    sleep 2
                    echo '{{ Red "WASTED" }}' | gum format -t template
                    exit
                elif [[ "$door" == 0 && "$mixer" > 0.9 ]]; then
                    echo "You open."
                    echo "An enourmous orange greets you."
                    echo "She mixes you in th mixer, the same you used."
                    exit
                elif [[ "$door" == 0 && "$mixer" < 1 ]]; then
                    echo "You open."
                    echo "The orange tells you to exit the house."
                    echo "You follow the orders. Like a dog."
                    exit
                fi    
                ;;
            "patience")
                echo '{{ Italic "Narrator: What am I supposed to say ? I didnt think some one would use this option !"}}' | gum format -t template
                sleep 5
                echo '{{ Italic "Program: Ask Creator. He surely knows." }}' | gum format -t template
                echo '{{ Italic "Creator: Just say that.. euh...  Say nothing and put a 2 days 2 hours 2 minutes sleep instruction."" }}' | gum format -t template
                gum spin --title="Patience is virtue." --spinner="moon" -- sleep 2d 2h 2m
                endings+=('Patience is a virtue')
                ;;
            "explore")
                echo "After exploring a bit the orange house, you remark a cat doing little noises."
                sleep 3
                echo "It's a man playing weirdly with human-cat! And, to your big surpise, they're orange."
                sleep 3
                echo "Co-creator: Miaw Miow!"
                sleep 1
                echo "Creator: Her ? It's my cat. Yes, my Co-creator cat. She's Maram."
                sleep 2
                echo "Creator: She says Hi. Now return rolling and lemme play weirdly."
                ;;
            "pickup")
                echo "After a whole hour of ringing, you fiannlly pick up the phone."
                sleep 3
                echo "You, whispering: what a weird chinese ringbell..."
                sleep 2
                echo "Voice in the phone: You finally picked up."
                sleep 1
                echo "Euh, I forgot my dialog. Dang."
                ;;
            "sue")
                echo "*Ace Attorney music"
                sleep 0.5
                echo "Creator disguised as judge: You are accused of treason, and anti-orange behaivour. The court finds you guilty, and sentences you to be mixed."
                sleep 4
                echo "U died"
                exit
                ;;
            "throw")
                echo "You throw the orange."
                sleep 0.5
                echo "A semi-demon comes."
                echo "You die of fear."
                exit
                ;;
            "wither")
                echo "You let the orange wither."
                echo "You die because your essence itself was in that orange."
                exit
                ;;
                
            *)
                echo "You did something wrong. Like everything you ever done in your life. Like what your parents did 9 months before you were born."
        esac

    done
}

while true; do
    main
done