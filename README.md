# Vampire Survivor Style Game

A simple 2D Vampire Survivors-style game made in Godot 4.

## Tutorial

I followed this tutorial to learn how to make the basic game:

**Your First 2D GAME From Zero in Godot 4 - Vampire Survivor Style**
https://www.youtube.com/watch?v=GwCiGixlqiU

Credit to the tutorial creator for the original game setup and tutorial.

## Core Loop

The main gameplay loop is moving around, shooting enemies, defeating them, collecting XP, leveling up, and surviving stronger enemies.

## Secondary Loops

### 1. XP and Leveling

Defeating enemies causes them to drop XP. Collecting enough XP causes the player to level up.

Leveling up increases the player's maximum health and unlocks additional bullets for the shotgun.

### 2. Enemy Waves

Enemies spawn in waves. Each wave increases the number of enemies and gradually increases their health and speed.

The spawn timer also becomes faster as the waves progress.

### 3. Boss Waves

Every fifth wave contains a boss. Bosses have much more health than normal enemies.

Later boss waves contain more bosses:

* Wave 5: 1 boss
* Wave 10: 2 bosses
* Wave 15: 3 bosses
* Wave 20: 4 bosses

Bosses also drop more XP when defeated.

## Faucet and Sink

### Faucet

Enemies drop XP when they are defeated. Enemies also have a chance to drop health pickups.

### Sink

XP is used when the player levels up.

Health is also lost when the player takes damage from enemies or the Danger Zone.

## Progression Unlocks

The player's level unlocks additional bullets.

As the player levels up, the shotgun fires more bullets with a wider spread.

## Gates

### Hard Gate

Boss waves are a hard gate. The game cannot move to the next wave while a boss is alive. Normal enemies also stop spawning while the boss is alive.

The player has to defeat all of the bosses before the next wave starts.

### Soft Gate

The Danger Zone is a soft gate. It damages the player while they are inside it, but the player can still enter and leave the area.

## Other Changes

* Added double-barrel shotgun firing when Space is pressed.
* Added a kill counter.
* Added health pickups.
* Added stronger enemies as waves progress.
* Added boss enemies and boss waves.

## Assets

Assets used in this project were provided by the tutorial and project resources.

## Tutorial Time

The tutorial took me about **3.5 hours** to complete.

## Loop Time

Adding the primary and secondary loops took me about **5 hours** to do.

## Built With

* Godot 4
* GDScript

## Contributions

This project was completed individually.

My contributions include:

* Shooting and shotgun mechanics
* XP and leveling system
* Level-based bullet progression
* Enemy waves
* Increasing enemy difficulty
* Boss enemies and boss waves
* Boss progression hard gate
* Health pickups
* Danger Zone soft gate
* Kill counter
