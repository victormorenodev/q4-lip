declare
fun {Josephus3 N K} 
    A={NewArray 1 N true} % Uso um array de booleanos para indicar se o elemento está "vivo" ou "morto"
    X={NewCell 1} % Indica em qual elemento estamos
    S={NewCell N} % Quantos elementos restam
    Step={NewCell 1} % Passo atual
    KillVictims
in
    fun {KillVictims}
        if @X > N then X:=1 end % Se passei do último elemento, volto para o primeiro (circular)
        if A.@X==true then % Se o elemento estiver vivo
            if @S==1 then @X % Condição de parada
            elseif @Step==3 then % Se estivermos no k-elemento, coloque-o como falso, diminua o S e resete o passo.
                A.@X := false
                X:=@X+1
                S:=@S-1
                Step:=1
                {KillVictims} 
            else % Se não estivermos no k-elemento, só avance o Step e siga para o próximo
                X:=@X+1
                Step:=@Step+1
                {KillVictims} 
            end
        else
            X:=@X+1 % Se estiver morto, só prossiga (sem short-circuiting)
            {KillVictims}
        end
    end
    {KillVictims}
end

{Browse {Josephus3 40 3}}