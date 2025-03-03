declare
fun {Josephus3 N K}
    A={NewArray 1 N true}
    X={NewCell 1}
    S={NewCell N}
    Step={NewCell 1}
    KillVictims
in
    fun {KillVictims}
        if @X > N then X:=1 end
        if A.@X==true then
            if @S==1 then @X 
            elseif @Step==3 then
                A.@X := false
                X:=@X+1
                S:=@S-1
                Step:=1
                {KillVictims} 
            else 
                X:=@X+1
                Step:=@Step+1
                {KillVictims} 
            end
        else
            X:=@X+1
            {KillVictims}
        end
    end
    {KillVictims}
end

{Browse {Josephus3 40 3}}