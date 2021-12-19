# Multorio
An multiplayer artillery duel clone for the Commodore 64/C64 in compiled BASIC.

It requires a WiC64 to connect to the internet. If no WiC64 is present, the game won't run. More information about the WiC64 can be found here: https://www.wic64.de/

The game is written entirely in BASIC. It won't run in the interpreter, unless you move the basic start to after 16384. But even then, it will run very slowly, so don't bother with it. 

The build script in build compiles it using the MOSpeed BASIC compiler: https://github.com/EgonOlsen71/basicv2

The build script is for Windows only ATM, but the compiler will work on any platform that supports Java, so you should be able to compile it with minor changes on those. This might apply to the availability of the c1541.exe that the script uses to compile the d64-image but you can always do this yourself in some other way, if required.

It generates two output files (which can be found in the build directory as well), called multorio.prg and multorio-c.prg. They are both functional identical, but the -c variant has been compressed after compilation.

In addition, it creates a d64-image containing the game and the machine language routines required to talk to the WiC64.

##Game setup

Currently, there's no lobby or match making functionality. You have to know the name/id of your opponent (as well your own...). An example:

Your choosen name is "hans", the other player's name is "wurst". You both start the game, your setup should look like this:

LOCAL PLAYER:HANS

REMOTE PLAYER:WURST

where wurst's setup should look like this:

LOCAL PLAYER:WURST

REMOTE PLAYER:HANS

That's it, the clients should be able to find themselves, negotiate a common game setup and start a new game. Of course, this only works, if there's no other pairing with the same names. In that case, you (and them) will get faulty data. That's due to the way in which the server works and there's no way around it for now. If only one of the names is the same, that's fine. 

## Game controls

The game is controlled via keyboard only. In the first part of your turn, you can select the cannon's angle by either using the A and D keys to de-/increase the angle or you can use the number keys to type in an angle directly. DEL will delete the last character of your input.
Either way, pressing SPACE or RETURN will end this part of your turn. While you are here, you can choose between 8 different taunts as well by using the F1-F8 keys. The choosen taunt will be send to the other player once you've finished your turn. If you choose not to send a taunt, you can remove the current one by pressing the back arrow key in the upper left corner of the keyboard.

If you want to quit the game, you can do so at this stage by pressing the RUN/STOP key two times. The other player should then get a message that you did so and you both will be send back to the setup screen.

Please note that the cannon's graphics only rougly reflect the actual angle, because they are rendered using PETSCII, which limits the options.

Once you've choosen the angle, you can now select the power of your shot on the powermeter. Just press SPACE or RETURN at the right moment to choose.

Keep in mind that there's also wind. The current wind's strength and direction will be shown in the center on top of the screen. The wind might change with each round.


##License

The game itself has been released under the Unlicense (see details in the license text file). However, this license doesn't apply to the WiC64 rountines in "universal.prg" as well as to the c1541.exe in the build-directory. For these parts, the corresponding licenses still apply.