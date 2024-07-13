mob/proc
    LevelCheck()    
        if(src.Exp>src.Nexp)
            src.Exp=0
            src.Nexp+=10
            src.Level+=1
            src.MaxHP+=5
            src.HP=src.MaxHP
            src.Str+=1
            src.Def+=1
            src<<"You are now level [src.Level]"
    
    TakeDamage(var/Damage,var/mob/Attacker)
        src.HP-=Damage
        src.DeathCheck(Attacker)

    DeathCheck(var/mob/Killer)
        if(src.HP<=0)
            if(src.client)
                world<<"[Killer] Killed [src]!"
                src.HP=src.MaxHP
                src.loc=locate(5,5,1)
            else
                Killer<<"<b>You Killed [src] for [src.Exp] Exp"
                Killer.Exp+=src.Exp
                Killer.LevelCheck()
                del src
