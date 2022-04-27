# Baby Dash
This is a clone of my game "Baby Dash" made in Greenfoot ([link](https://www.greenfoot.org/scenarios/29299)), rewritten in Lua using Love2D

## Changes from the Greenfoot version
This version of the game is an endless platformer, where the Greenfoot version has a definite end. I did this because I feel like an endless platformer will be more fun. I may implement a shop feature or maybe a leaderboard later.

## How to play
**Disclaimer!** this game is not finished so not all of these features exist yet.

🔴 - features that are not implemented,
🟢 - features that are implemented

Baby Dash is an endless platformer. You will start with 100 HP, when you get to 0 HP you lose.

You will encounter many entities in this game, here is a quick breakdown of the entities:

#### OBSTACLES
- 🔴 **Crates** - These will slow you down for 2s, will take away 5 HP
- 🟢 **Snowmen** - These somehow doesn't melt, but will slow you down for 3s, will take away 5 HP
- 🟢 **Trees** - These will slow you down for 5s, will take away 5 HP
- 🟢 **Spikes** - These will take away 50 HP
- 🔴 **Babies** - These will take away 30 HP
- 🔴 **Birds** - These will take away 20 HP

**Note:** the amount of time you are slowed down stacks up, so if you run into a tree and a snowman, you will be slowed down for a total of 8 seconds.

**Note 2:** When you are slowed down, your ability to jump over obstacles is inhibited so you have to look ahead

#### COLLECTABLES
- 🟢 **Coins** - shiny things you can collect
- 🔴 **Keys** - Whenever you collect a key, you must complete a puzzle which will appear on the screen to obtain the key. You cannot exit the puzzle without solving it.
- 🔴 **Lightbulbs** - These can give you powerups (either aglity [wont trip on obstacles] or invincibility [wont die]) for a few seconds

#### OTHER
- 🟢 **Jump Pad** - These will launch you higher into the air than a normal jump and can help you get over obstacles, but be careful, they can launch you into a bird and that's not good.

### Game mechanics:

- 🔴 **Puzzles** -
Whenever you collect a key, you will stop moving and a puzzle will appear on the screen, you must complete the puzzle correctly to resume.

### How to win:

The game is endless.