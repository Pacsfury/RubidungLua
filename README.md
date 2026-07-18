# RubidungLua
The definitive Rubidung

---

![Version](https://img.shields.io/badge/version-0.0.1-yellow)
![Language](https://img.shields.io/badge/language-Lua-blue)
![Status](https://img.shields.io/badge/status-early_development-orange)
![Tech](https://img.shields.io/badge/server-NetworkLib_(Go)-green)

## New Features Regarding Java And C++

RubidungLua will bring a lot of new features along its 
development. Even though it's at a very initial stage, here is 
our roadmap for making RubidungLua the definitive one:
* Multiplayer and singleplayer mode
* Visuals using Löve2D
* Good music and SFX
* More features:
  * You know where the player is even when not showing the map
  * Cards with power-ups
  * Shop and main menu
* More tiles
* More levels

This is the current progress in the game development:
* When you enter for the first time, the server is run locally at `localhost:8080`, changeable in main.lua:
```lua
local success, msg = nl:init("127.0.0.1", 8080)
```

* As many as want can connect just by running the game
* The first time, it will say "disconnected". Close the game and rerun it
* Map and tile drawing/detection system made to easily add new levels
* Spiky wall detection
* Player appears at the @
* Player position is correctly synchronized
* Currently, only multiplayer available

## Requirements
* **Lua**
* **Löve2D**
* **Windows**: If you don't use Windows, please start yourself the server

## The Server

For the multiplayer games, I'm using my own backend: [NetworkLib](https://github.com/Pacsfury/NetworkLib-Backend), which I 
developed specially for 
self-hosted games, like this one. It's completely coded in Go. 
You can find more info in the link provided.

NetworkLib provides basic tools for creating self-hosted 
multiplayer games, so making and maintaining the multiplayer 
thing is actually easy thanks to NetworkLib's philosophy.

## Rubidung's history

I was learning Java when I coded my first Rubidung. I named it 
after the original Minecraft name (Rubydung). The first Java 
version didn't go as expected: I wanted the player to move 
through the terminal, but I realized it would be easier to 
simply remove the map, using the excuse "it's a memory game".

Most of the Rubidung development has been done in those hours 
that I'm bored, and I don't know what to do, I open the IDE and 
keep thinking "what should I do"? Rubidung came to erase these 
moments from my life. Later on, this job would go to GoStack and 
NetworkLib, just as other Python or Godot projects.

So, after making the game in Java, I felt like I wanted to do 
something in C++, and I decided to rewrite the whole game to 
that language. I didn't add any new functionality, though.

With these two versions of Rubidung I learned a lot about 
documentation, optimization and coding overall, including Git 
and GitHub usage. Even though there was still something I still 
wanted to learn: graphics and network. Java has JavaFX, but it's 
more oriented to applications than games. I installed SFML, but 
I decided to use it for other things than Rubidung. But then, I 
found a video about Löve2D, and I instantly installed both Lua 
and Love, which provide a basic and intuitive way to draw to the 
screen. But the networking thing was missing, this is why I 
decided to make NetworkLib, and why the first officially 
supported language is Lua. As an answer to the difficulty of 
Networking on Java, C++, and most programming languages.

Then I started making the definitive Rubidung, the Lua version.

## How To Play The Multiplayer Version

When you are on the project folder, open the terminal and run:
```bash
love .
```
You will probably see something like "Disconnected (try 
rerunning game)" in red (temporary). Close the window (don't close the 
terminal: that is where the server is executed), and rerun the 
command.

You can add as many players as you want, as the server will be 
only opened once. I don't care if it crashes, it's yours, you can use it as a sandbox to DoS, 
or whatever, but any problem with the server, please communicate at the 
NetworkLib repository. 

Once everyone is playing (or before, if you don't like waiting), 
you can start moving the player around. You will see that if it 
touches a # you restart. Every tile represents something, as 
told in the next section.

## Understanding The Map

Every tile has its own meaning as found here:

| **Symbol** | **Meaning**                |
|------------|----------------------------|
|**#**       |A wall, covered of spikes!  |
|**.**       |Free space to walk          |
|**\$**      |The treasure you want!      |
|**@**       |You!                        |
|**O**       |A wall, without spikes!     |

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you want to contribute:
1. **Fork** the project
2. Create your **Feature Branch** (`git checkout -b feature/AmazingFeature`)
3. **Commit** your changes (`git commit -m 'Add some AmazingFeature'`)
4. **Push** to the branch (`git push origin feature/AmazingFeature`)
5. Open a **Pull Request**

If you find any bugs or issues regarding the multiplayer system, remember to open them directly in the [NetworkLib](https://github.com/Pacsfury/NetworkLib-Backend) repository, as it handles all the backend logic!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Changelog

### 2026-07-15: 

* First version, set up multiplayer

### 2026-07-16:

* Add map drawing
* Add tile detection
* Add player start position
* Add README
* Add LICENSE

### 2026-07-18:

* Add win detection
* Organize better files so adding menus and so is easier