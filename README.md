# RubidungLua
The definitive Rubidung

---

## New Features Regarding Java And C++

RubidungLua will bring a lot of new features alogn its development. Even thought it's on a very initial stage, here is our roadmap for making RubidungLua the definitive one:
* Multiplayer and singleplayer mode
* Visuals using Löve2D
* Good music and SFX
* More features:
  * You know where the player is even when not showing the map
  * Cards with powerup
  * Shop and main menu
* More tiles
* More levels

This is the current progress in the game development:
* When you enter for the first time, the serveris runned locally at `localhost:8080` (cahngeable in main.lua)
* As many as you want can connect just by running the game
* The first time, it will say "disconnected". Close the game and rerun it
* Map and tile drawing/detection system made for easily add new levels
* Spiky wall detection
* Player appear at the @
* Player position is correcly syncronized
* Currently, only multiplayer available

## The Server

For the multiplayer games, I'm using my own backend: [NetworkLib](https://github.com/Pacsfury/NetworkLib-Backend), which I developed specially for self-hosted games, like this one. It's completely coded in Go. You can find more info in the link provided.

NetworkLib provides basic tools for creating self-hosted multiplayer games, so making and maintaining the multiplayer thing is actually easy thanks to NetworkLib's philosophy.

## Rubidung's history

I was learning Java when I coded my first Rubidung. I named it after the original Minecraft name (Rubydung). The first Java version didn't go as expected: I wanted the player to move through the terminal, but I realized it would be easier to simpley remove the map, using the excuse "it's a memory game".

Most of the Rubidung development has been done in that hours that I'm bored, and I don't know what to do, I open the IDE and keep thinking "what should I do"? Rubidung come to erase these moments from my life. Later on, this job would go to GoStack and NetworkLib, just as other Python or Godot projects.

So, after making the game in Java, I felt like I wanted to do something on C++, and I decided to rewrite the whole game to that language. I didn't add any new functionality, though.

With these two versions of Rubidung I learnt a lot about documentation, optimitzation and coding overall, including Git and Github usage. Even though there was still something I still wanted to learn: graphics and network. Java has JavaFX, but it's mroe oriented to applications than games, I installed SFML, but I decided to use it for other things than Rubidung. But then, I found a video about Löve2D, and I instantly installed both Lua and Love, which provide a basic and intuitiva way to draw tot he screen. But the networking thing was missing, this is why I decided to make NetworkLib, and why the first officially supported lanugage is Lua. As an answer to the difficulty of Networking on Java, C++, and most programming languages.

Then I started making the definitive Rubidung, the Lua version.

## How To Play The Multiplayer Version

When you are on the project folder, open the terminal and run:
```bash
love .
```
You will probably see something as "Disconnected (try rerunning game)" in red. Close the window (don't close the terminal: there is where the server is executed), and rerun the command.

You can add as many players as you want, as the server will be only opened once. I don't care if it crashes, it's yours :), but any problem with the server, please communicate at the NetworkLib repository. 

Once everyone is playing (or before, if you don't like waiting), you can start moving the player around. You will see that if it touches a # you restart. Every tile represents something, as told in the next section.

## Understanding The Map

Every tile has it's own meaning as found here:

| **Symbol** | **Meaning**                |
|------------|----------------------------|
|**#**       |A wall, recovered of spikes!|
|**.**       |Free space to walk          |
|**$**       |The treasure you want!      |
|**@**       |You!                        |
|**O**       |A wall, without spikes!     |


## Change Log

### 2026-07-15: 

* First version, set up multiplayer

### 2026-07-16:

* Add map drawing
* Add tile detection
* Add player start position
