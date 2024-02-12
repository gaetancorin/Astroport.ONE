#!/bin/bash
clear
# Initialise the Title Art
file1="../art/titleart.ben"
while IFS= read -r line
do
    echo "$line"
done <"$file1"
echo

# I like this room. There is no way to get out of it alive.
sleep 1

echo"	$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
		$$$$$$$XXx+++++;;;;;;;;;;;;;;;;;;;;;;;;;;;;;+++++++++++++++++++++++++++++++++++++++xxxXXX$$$$$$$$$$$
		$$$x+;;;;++++++;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;++++++++xxxx++++++++++++++++++++++++++++++++++xX$$$$$$
		$x;;;;;;++++++++++;;;;;;;;;;;;;;;;;;;;;;;+++++xXXXXXxxxx+x+++++++++++++++++++++++++++++++++++++X$$$$
		$;;;;;;;;;+++++++++;;;;;;;;;;;;;;;;;;++++++;;;;;+++xXXXxxxxx+++++++++++++++++++++++++++++++++++x$$$$
		X;;;;;;;;;;;+++++++++;;;;;;;;;;;;;+++x+;++xxxXXXX++xx++xXXXXXx++++++++++++++++++++++++++++++++++X$$$
		X;;;;;;;;;;;;;;;;;+;;;;;;++++;;;;;++++;;+++++++++++++xXXXXXXXXxxx+++++++++++++++++++++++++++++++XX$$
		X;;;;;;;;;;;;;;;;;;;+++++++;;;++++++++;;;;++++xxxxx+++xXX$$$XXXXXXXxxx++++++++++++++++++++++++++XX$$
		X;;;;;;;;;;;;;;;;;++++++++++++x+;;;++XXx+++++xxXXXXXXxxXXX$$$$$$XXXXXXxx+x++++;;++++++++++++++++XX$$
		X;;;;;;;;;;;;;;;;;;;+xxXXXxxx++++;;++xXxXx+;;;;+xXXX$XXxxxXXX$$$Xx++++x+++xxx++;;;;+;;+;;+++++++XX$$
		X;;;;;;;;;;+++x+xxxXXXXXXXxxx++;;;;;+++xx++XXXXxxxXXXX$$$$XXXXX$$$XxxXXXxxxxx++;;;;;;;;;;;;+++++XX$$
		X;;;;+;;;;;;+++xXXXXXXXXXXXXXXXxx+++++xXXXXxxxXXX$XXXXXXX$$$$$$$$$$$XxXXXXXXx+++;;;;;;;;;;;;++++XX$$
		X;;;;;+;;;;;;+++xXXXXX$$$$$XXXXXx++++++XXXX$$$$$$$$$$$$$$XX$$$$$$$$$$$$XXXXXXxx+++;;;;;;;;;;++++XX$$
		X;;;;;;;;;;;;;+xXXX$$$$$XXxx++xxXxx+++xXXX$$$$$$$$$$$$$$$$$$$$$$$$$$$$$XXXXXXXXx++++;;;;;;;+++++XXX$
		X;;:;;;++++xxxXXXXXXxxx+++++;;;;++xXXXX$X$$$$$$$$$$$$$$$$$$$$$$$$$$$$XXXXXXXXXXXXX+++;;;;;;+++++XXX$
		X;;:;:;;++xXXXXXXXXXXXXXXxxx+++++xXXXX$$$$$$$$$$$$$$$$$$$X$$$$$XXXXXXXXXXXXX$XXXXXX+++;;;;;+++++XX$$
		X;:;::;;;+xxXXXXXXXXXxxXXX$XXXXXXXXXXXXX$$$$XXXXXXXXXXXXXXXXXXXXXXXXXXXXX$$$$$XXXXXx++;;;;;+++;+XXX$
		X;:::;;+xXXXXX$$XXXXXXXX$$XXXXXXXXXXXXXXXXXXx++x++xx++xx+xxxxxxxxxXXxXXXXX$$$$XXXXXXX++;;;;;;;;+XXX$
		X++++++xXXXXXXXXXXXXXXXXXXXxxxxxxxxx++++++++;;;+++;+;;;;;+++++++++xxxxXXX$$$$$$$XXxxxx+;++;;;;;+XX$$
		X+++xxxXXXXXXXXXXXXX$XXXXXx++++++++++;;;;++;;;;;::;;;;;;;;;+;;;;+++++++XXXX$$XXXXXx++++++;;;;;;+XXX$
		X++++xXXXXXXXXXXXX$$$XX+::....:::::::::::;;;;;::::::::::::::;::::;;;;+++XX$$$$$$XXXx+++++;;+;;;+XXX$
		X+;++++xxxXXXXX$$$X;:..:;;++++;;++++++;;;::..............:::::::::::;++;:;+X$$$$XXXxx++++++;;+;+XX$$
		X++++++++xXXXX$$$$x. .:XXx++++++xxxXXXXXXxx:.     ....;xXXXXXXXxx+xxxxx++;:.::+$$XXx++++++++++;+XXX$
		X;;;;+++;+xxxX$$XX+.. ;$Xx+++xxxXXXXXXXXXXX+:.    ...;XXXXX$$XXXXXXXXXXXXX+:::+$$$$XXXXxxx++++;+XXX$
		X+;;;;;;;;++xXXxxXx:..;$Xx++xXXXXX$X$$$$$$Xx:.:::::.:+X$$$$$$$$$XXXXXXXXXXx:::+$$$$XXXXXx++++;;+XX$$
		X+;;;;;;;;;+++xXXXXX+.;XXx+XXXXXXXXXXXXXXXX;.:::::;:.;X$$$$$XXXXXXX$$$XXXX+..;x$$$$XXXXXx+++;;++XXX$
		X;;;;;;;;;++xXXXxxX$$;:Xx+xXxxXXXXXXXXXXx+;:.:::::;;:;XXX$$XXXXXXXXXXXXXXX;:X$$$$$$XXXXXXx++++;+XXX$
		X;;;;;;;;++xXXXXxx$&$X:;x+;;++++;;;;;;;;::::::::::;;;:;;;;;+++xxxXxx+++xx+:+$$$$$$$XXXXXXxx+++;+XX$$
		X+;++++++xxxXXXXxX$$XX+::;;;;::::::::::::.:::::::::;;;::::::;;;;;+++++xx+::X$$$$$$$$XXXxx+++++++XXX$
		X+;;+++++xxxxxXxXX$XXXx+;::::::::..::::::;;::::::::;;;;:::::::::;;;;;++;:;xX$$$$$XX$$$XXx++++;;+XXX$
		X;;;;;;++++xxxxXXXXXxx;++;;::::::;;++xxx+:::::::::;+++;::+X++++;;;;;+x+xXXXX$$$$$$$$$$XXx++;;;;+XXX$
		X+;;;;;;+++xxxxXXXXXxx;;;;;;;;+++;;;;+++:;;;;;;+++xXXXxx+xXXXXXXxx++++xxXXXXX$$$$$$$$$$XX+++;;;+XX$$
		X;;;;;;;+++++xxxXXXXXx+;;;;;;;;::::;;+;;+xXXXXXXXXX$$$$$XXXXXXx+xxXXXXXXXXXXX$$$$$$$$$$$Xx+++;;+XXX$
		X;;;;;;;;++++xxxXXXXXx+;;;+;;:::::;;+;::+XXXXXXXXX$$$$$$$$X++++++++xXXXXXXXXX$$$$$$$$$$XX+++++;+XXX$
		X;;;;;;;;+++++++XXxXxx++;;;;;;;;;;++;:::;++++xX$$$$$$$$$XXX+;++++++xXXXXXXXX$$$$$$$$$$$Xx+;;;;;+XX$$
		X;;;;;;;;++++++x+xxxXx;;;;;;;;;;;;++;::::::;;+xX$$$$$$XXx++;;;;+++xxxXXXXXXXX$$$$X$XX$X+;;;;;;;+XXX$
		X;;;;;;;;;++xx++++xxXX;;;;;;;;;;;++;::::::;;;++XXXXXXXxx+++;;;;;;;+xXXXXXXXXXX$XX$XXXX+;;;;;;;;+XXX$
		X;;;;:::;:;;+;;;;+xxXx;;;;;;;;;;;+;:::;;;;;;++++;+xXXxxXXxxxx++;;;;+xXXXXXXXXXXXX$$$X+;;;;;;;;;+XX$$
		X;;;;;;:;;;;;;;;;;+xXx;:::::;;;;;;;;;;+++xxXXXXXXXXXXX$$$XXXXXXxx+++++xxxXXXXXX$+XXX+;;;;;;;;;;+XXX$
		X;;;;;;;;;;;;;;;;;+xX+;:::::;;;;;;++xxXXX$$$$$$$$$$$$$$$$$$$$$$Xx++++++++xxXXX$X+xx+;;;;;;;;;;;;XXX$
		X;;;;;;;;;;;;;;;;;+x++;::::::::;;++XX$$$$$$$$$$$$$$$$$$&&&&&$$$X+;;;;;;;;++XX$$x+;;;;::::::::;:;XX$$
		X;;;;;;;:;;;;;;;;;;++;;:::::::::;;+xx++xX$$$XXXXXX$XXXXXXXXXXxx+;;;;;;;;;+xX$X+;;;;;;;;;;;;;;;;;XXX$
		X;;;;;;;::::::;;;;;++;;;:::::::::;;;;:;:;;;::::::;;;:;;;;;++;;;;+;;++;;+++xxX;;;;;;;;;;;;;;;;;;+XXX$
		X;;;;;;;::::::::;:;;;++;::::::::;;;;;:::;;;;;:;::;;;;;;;+++++;;;;;;;++++++xXx;;;;;;;;;;;;;;;;;;;XX$$
		X;;;;;;;;:::::::::::;++;:::::::::;;::::;;;;;;;;;;;;++++++++++;;;;;;;+++++++;;;;;;;;;;;;;;;;;;;;;XXX$
		X;;;;;;;;;;;;::::::;;+xx;;;;;;;;;;:::::;;;;;;;;;;;;;;;;++++++;;;::;++++++x+;;;;;;;;;;;;;;;;;;;;;XX$$
		X;;;;;;;;;;;;;;;::::;+xX+;;;;;;;;::::::::;;;::::::;;;;;;;+;;;;::;;;+++++xx;;;;;;;;;;;;;;;;;;;;;;XX$$
		X;;;;;;;;;;;;;;:::::;+x;++;;;;;;:::::::::::::::::::::::::;;;;;;;;;+++xx+xXX+;;;;;;;;;;;;;;;;;;;;XX$$
		X;;::;;;;;:::::::;:;:;+;++;;;;;;;;;;::;:::::::::::::::;;;;;;;;;;;+++xXXXX$$X+;;+;;;;;;;;;;;;;;;;XX$$
		X;;;;;;;;;::::;;;;::::;;;;;;;;++;;;;;;;;;::::::;::::;;;;;;;;;;+++xXXXXXXXxxXXx+;;;;;;;;;;;;;;;;;XX$$
		X+;;;;;;;;;;;;;;;;;;;;;:;;;;;+++++;;;;;;;;:::;;;;;;;;;;++;++++xxXXXXXXXXX++;;;:;:;;;;;;;;;;;;;;;X$$$
		X++;;;;;;;;;;;;;;;;;;;;;;;;;;++x++++;;;;;;;;;;;;;;;++;++;++x+xXXXXXXXXXXx;;;;;;;;:;;:;;;;;;;;;;;X$$$
		X+++;;;;;;;;;;;;;;;;;;;;;;;;;+++++++++++++++++++;++xxx++xXXxXXXXXXXXXXXXx;;;;;;;;;;;;;;;;;;;;;;+$$$$
		$x+++;;;;;;;;;;;;;;;;;;;;;;;;;++++xxxxx++xxxxx++xxXXxxxXXXXX$XXXXXXXXXXXx;;;;;;;;;;;;;;;;;;;;;;x$$$$
		$$$x+;;;;;;;;;;;;;;;;;;;;;;;;;;+++xxxxxxXXXXXXXXXXXXXXXXXXX$$X$$$$X$$$$Xx;;;;;;;;;;;;;;;;;;;+x$$$$$$
		$$$$$$$XXxxx+++++++;;;;;;;;;;;;;++xXXXXXXXxXXXXXXXXXXXXXXXX$X$$$$$$$$$$Xx;;;;;;++++++++xXX$$$$$$$$$$
		$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"

read -p "Appuyez sur [ENTER] pour revenir..."
./mainroom.sh

exit
