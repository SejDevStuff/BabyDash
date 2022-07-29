# Baby Dash
This is a clone of my game "Baby Dash" made in Greenfoot ([link](https://www.greenfoot.org/scenarios/29299)), rewritten in Lua using Love2D

## Changes from the Greenfoot version
This version of the game is an endless platformer, where the Greenfoot version has a definite end. I did this because I feel like an endless platformer will be more fun. I may implement a shop feature or maybe a leaderboard later.

## Latest Update: 29/07/2022
```
- Improved hitboxes / collision detection
Hitboxes are now much better and we now have improved collision detection. Press H in game to toggle showing hitboxes.

- Increased player jump height
Player jump height has been increased slightly to make the game a little bit easier

- Increased bird flying height
Birds now fly much heigher, so you can no longer jump into birds normally. You can still jump into them using a jumppad.
(DISCLAIMER!) This change is under review and might be reversed

- Improved collision detection between obstacles and collectables
Obstacles/Collectables should no longer spawn on top of each other, or disappear randomly (or if this happens, it will be a rare occurrence)

- Fixed drawing issue where the healthbar and the player hitbox will lag slightly behind the player
```

## How to play
**Disclaimer!** this game is not finished so not all of these features exist yet.

🔴 - features that are not implemented,
🟢 - features that are implemented

Baby Dash is an endless platformer. You will start with 100 HP, when you get to 0 HP you lose.

You will encounter many entities in this game, here is a quick breakdown of the entities:

#### OBSTACLES
##### Slowing Obstacles
Slowing Obstacles primarily slow you down, but they all take away 5 HP
- 🟢 **Crates** - These will slow you down for 2s
- 🟢 **Snowmen** - These somehow doesn't melt, but will slow you down for 3s
- 🟢 **Trees** - These will slow you down for 5s
##### Hurting Obstacles
Hurting Obstacles primarily take away health
- 🟢 **Spikes** - These will take away 50 HP
- 🟢 **Babies** - These will take away 30 HP
- 🟢 **Birds** - These will take away 20 HP

**Note:** the amount of time you are slowed down stacks up, so if you run into a tree and a snowman, you will be slowed down for a total of 8 seconds.

**Note 2:** When you are slowed down, your ability to jump over obstacles is inhibited so you have to look ahead

#### COLLECTABLES
- 🟢 **Coins** - shiny things you can collect
- 🔴 **Keys** - Whenever you collect a key, you must complete a puzzle which will appear on the screen to obtain the key. You cannot exit the puzzle without solving it.
- 🟢 **Lightbulbs** - These can give you powerups

#### POWERUPS
All of these powerups can be obtained from getting a Lightbulb, they range from 2 - 8 seconds. You cannot get another powerup if one is already active (i.e: they can't stack)
- 🟢 **Agility** - This powerup enables you to not get hurt or slowed down by Slowing Obstacles. You will still get hurt by Hurting Obstacles.
- 🟢 **Invincibility** - This powerup enables you to not get hurt by Hurting Obstacles. You will still get hurt and slowed down by Slowing Obstacles.
- 🟢 **Regeneration** - This powerup makes you regenerate your health every half a second rather than every second.

#### OTHER
- 🟢 **Jump Pad** - These will launch you higher into the air than a normal jump and can help you get over obstacles, but be careful, they can launch you into a bird and that's not good.

### Game mechanics:

- 🔴 **Puzzles** -
Whenever you collect a key, you will stop moving and a puzzle will appear on the screen, you must complete the puzzle correctly to resume.

### How to win:

The game is endless.
