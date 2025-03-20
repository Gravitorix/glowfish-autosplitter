state("Glowfish")
{
	int levelComplete : "Glowfish.exe", 0x22AB50, 0x158, 0x5C;
    int currentLevel : "Glowfish.exe", 0x22AB50, 0x214;
}

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
