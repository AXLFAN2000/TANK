mob/Enemies
    Red_Guy
        icon='Enemies.dmi'
        icon_state="EnemyRed"
        Level=1
        Exp=5
        MaxHP=100
        Str=10
        Def=5

    Purple_Guy
        icon='Enemies.dmi'
        icon_state="EnemyPurple"
        Level=2
        Exp=10
        MaxHP=150
        Str=11
        Def=6

mob/Enemies/New()
    src.HP=src.MaxHP
    spawn(-1)    src.CombatAI()
    return ..()

mob/Enemies/proc/CombatAI()
    while(src)
        for(var/mob/Player/M in oview())
            if(get_dist(src,M)<=1)
                src.dir=get_dir(src,M)
                src.Attack()
            else
                step_to(src,M)
            break
        sleep(rand(4,8))