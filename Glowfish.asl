/*
 * The state section is required for every script. It defines which process to
 * connect to (without the .exe).
 *
 * Optionally, you can also define one or several states that should be read
 * from the game's memory, which you can then access in other places in the
 * script. This is commonly the way to go for simple scripts.
 *
 * https://github.com/LiveSplit/LiveSplit/blob/master/Documentation/Auto-Splitters.md
 * https://github.com/tduva/LiveSplit-ASL/blob/master/AlanWake-README.md
 */
state("Glowfish")
{
	int levelComplete : "Glowfish.exe", 0x22AB50, 0x158, 0x5C;
    int currentLevel : "Glowfish.exe", 0x22AB50, 0x214;
}

/*
 * This is an Action, which is sort of like a function that is automatically
 * called by the ASL Component. It can interact with other Actions and LiveSplit
 * only by special variables that the environment provides. Inside the function
 * you can write C# code.
 *
 * The "startup" Action is run when the script is first loaded. This is a good
 * place to define things you need in the whole script. This is the only place
 * where you can define settings.
 */
startup
{
	print("startup");
}

init
{
    print("init");
}

update
{
    print("current " + current.currentLevel);
    print("prev " + current.levelComplete);
}
start
{
    if (current.currentLevel != old.currentLevel && old.currentLevel == 0)
        {
            return true;
        }
}

split
{
	if (current.levelComplete == 0 && current.currentLevel != 50)
	{
		return;
	}

    if (current.levelComplete != old.levelComplete)
    {
        return true;
    }
}
