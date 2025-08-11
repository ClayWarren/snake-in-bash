# Snake in Bash

A fully functional **Snake** game written entirely in **pure Bash** — no Python, no C, no external libraries — just terminal magic.  

This version uses `/opt/homebrew/bin/bash` (Bash 5.x) to support sub-second movement timing on macOS.  
Tested on macOS Sequoia and Linux.

---

## 🎮 Features
- Classic Snake gameplay in the terminal.
- **WASD** controls (arrow keys optional with extra code).
- Snake grows each time it eats food.
- Score tracking.
- Wrap-around screen edges.
- Runs in any ANSI-compatible terminal.

---

## 📦 Requirements
- **Bash 5.x or higher** (needed for fractional `read` timeout).
- ANSI-compatible terminal (default macOS Terminal, iTerm2, or Linux terminal all work).

---

## 🛠 Installation

1. **Clone or Download**
   ```bash
   git clone https://github.com/yourusername/bash-snake.git
   cd bash-snake
Ensure you have Bash 5+

Install via Homebrew (macOS):

bash
Copy
Edit
brew install bash
Verify:

bash
Copy
Edit
/opt/homebrew/bin/bash --version
Make script executable

bash
Copy
Edit
chmod +x snake.sh
🚀 Running the Game
Run using the Homebrew-installed Bash:

bash
Copy
Edit
/opt/homebrew/bin/bash snake.sh
🎯 Controls
Key	Action
W	Move Up
A	Move Left
S	Move Down
D	Move Right
Ctrl + C	Quit game

📝 Notes
The game uses tput and ANSI escape codes for cursor movement and colors.

Edges wrap around — going off the right side brings you back to the left.

Speed is set with the delay variable in the script (0.1 seconds by default).

📜 License
MIT License. Do whatever you want with it, but a credit link would be cool.
