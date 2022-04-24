# Baby Dash
This is a clone of my game "Baby Dash" made in Greenfoot ([link](https://www.greenfoot.org/scenarios/29299)), rewritten in Lua using Love2D

## How to play
**Disclaimer!** this game is not finished so not all of these features exist yet.

🔴 - features that are not implemented,
🟢 - features that are implemented

Baby Dash is a scrolling, obstacle-avoiding game where you have to reach Brian's Safe House without dying (aka losing the game).

To win, you need a combination of luck and skill. You will start with 100 HP, when you get to 0 HP you lose.

*Since this is a family friendly game, whenever you get killed you turn into a Washing Machine*

You will encounter many entities in this game, here is a quick breakdown of the entities:

#### OBSTACLES
- 🔴 **Crates** - These will slow you down for 2s, will take away 5 HP
- 🔴 **Snowmen** - These somehow doesn't melt, but will slow you down for 3s, will take away 5 HP
- 🟢 **Trees** - These will slow you down for 5s, will take away 5 HP
- 🟢 **Spikes** - These will take away 50 HP
- 🔴 **Babies** - These will take away 30 HP
- 🔴 **Birds** - These will take away 20 HP

**Note:** the amount of time you are slowed down stacks up, so if you run into a tree and a snowman, you will be slowed down for a maximum of 8 seconds.

**Note 2:** When you are slowed down, your ability to jump over obstacles is inhibited so you have to look ahead

#### COLLECTABLES
- 🟢 **Coins** - you need to collect a certain amount of coins to win
- 🔴 **Keys** - Whenever you collect a key, you must complete a puzzle which will appear on the screen to obtain the key. You cannot exit the puzzle without solving it.
- 🔴 **Lightbulbs** - These can give you powerups (either aglity [wont trip on obstacles] or invincibility [wont die]) for a few seconds

#### OTHER
- 🟢 **Jump Pad** - These will launch you higher into the air than a normal jump and can help you get over obstacles, but be careful, they can launch you into a bird and that's not good.

### Game mechanics:

- 🔴 **Evil Bald Man Distance Counter** -
In the top left corner, you will see a counter which counts how far away the Evil Bald Man is from you, your aim is to win the game before this reaches 0.
If the counter reaches 0, you will see the evil bald man chasing you. He will travel at the same speed as you, but he can avoid all obstacles, and whenever you slip on an obstacle or do a puzzle, he will catch up to you. If he catches you, you will die.
You may still be able to win even if the evil bald man is chasing you, provided that you're careful enough.

- 🔴 **Puzzles** -
Whenever you collect a key, you will stop moving and a puzzle will appear on the screen, you must complete the puzzle correctly to resume. Note: the evil bald man will still be chasing you while you're doing a puzzle, so you're under time pressure. In fact, he will move 3 times as fast whenever you're doing a puzzle.

### How to win:

You must get a certain amount of coins and must complete a certain amount of puzzles. Once you do this, every second you will have a 1 in 4 chance of a red flag appearing, you must run into this flag to win.

#### Conditions that must be met:

If you fulfil one (or more) of these conditions the flag will have a chance of spawning:
- You get 80 coins and complete 4 puzzles
- You get 150 coins and complete 0 puzzles
- You get 30 coins and complete 8 puzzles 