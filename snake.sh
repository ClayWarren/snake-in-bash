#!/usr/bin/env bash

# Snake in Bash
# Clay — get ready for some terminal wizardry

# Game settings
rows=20
cols=30
delay=0.1

# Snake initial position & direction
snake_x=15
snake_y=10
dir="RIGHT"
snake_body=("$snake_x,$snake_y")
snake_len=3

# Food position
food_x=$((RANDOM % cols))
food_y=$((RANDOM % rows))

# Hide cursor & cleanup on exit
tput civis
trap "tput cnorm; clear; exit" INT

draw_board() {
    clear
    for ((y=0; y<rows; y++)); do
        for ((x=0; x<cols; x++)); do
            if [[ "$x,$y" == "$food_x,$food_y" ]]; then
                echo -ne "\033[31m●\033[0m" # red food
            else
                is_snake=false
                for seg in "${snake_body[@]}"; do
                    if [[ "$x,$y" == "$seg" ]]; then
                        echo -ne "\033[32m■\033[0m" # green snake
                        is_snake=true
                        break
                    fi
                done
                if ! $is_snake; then
                    echo -n " "
                fi
            fi
        done
        echo
    done
    echo "Score: $((snake_len - 3))"
}

read_input() {
    read -rsn1 -t "$delay" key
    case "$key" in
        w) [[ $dir != "DOWN" ]] && dir="UP" ;;
        s) [[ $dir != "UP" ]] && dir="DOWN" ;;
        a) [[ $dir != "RIGHT" ]] && dir="LEFT" ;;
        d) [[ $dir != "LEFT" ]] && dir="RIGHT" ;;
    esac
}

update_snake() {
    case $dir in
        UP) ((snake_y--)) ;;
        DOWN) ((snake_y++)) ;;
        LEFT) ((snake_x--)) ;;
        RIGHT) ((snake_x++)) ;;
    esac

    # Wrap around edges
    ((snake_x<0)) && snake_x=$((cols-1))
    ((snake_x>=cols)) && snake_x=0
    ((snake_y<0)) && snake_y=$((rows-1))
    ((snake_y>=rows)) && snake_y=0

    # Check collision with self
    for seg in "${snake_body[@]}"; do
        if [[ "$snake_x,$snake_y" == "$seg" ]]; then
            tput cnorm; clear
            echo "Game Over! Final Score: $((snake_len - 3))"
            exit
        fi
    done

    # Add new head
    snake_body=("$snake_x,$snake_y" "${snake_body[@]}")

    # Check food
    if [[ "$snake_x,$snake_y" == "$food_x,$food_y" ]]; then
        ((snake_len++))
        food_x=$((RANDOM % cols))
        food_y=$((RANDOM % rows))
    else
        # Remove tail
        snake_body=("${snake_body[@]:0:snake_len}")
    fi
}

# Game loop
while true; do
    draw_board
    read_input
    update_snake
done
