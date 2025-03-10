declare Counter = {NewCell 0} % Inicializa o contador
declare
fun {Josephus3 N K} 
    A={NewArray 1 N true} % Uso um array de booleanos para indicar se o elemento está "vivo" ou "morto"
    X={NewCell 1} % Indica em qual elemento estamos
    S={NewCell N} % Quantos elementos restam
    Step={NewCell 1} % Passo atual
    KillVictims
in
    fun {KillVictims}
        Counter := @Counter + 1  % Incrementa o contador
        if @X > N then X:=1 end % Se passei do último elemento, volto para o primeiro (circular)
        if A.@X==true then % Se o elemento estiver vivo
            if @S==1 then @X % Condição de parada
            elseif @Step==K then % Se estivermos no k-elemento, coloque-o como falso, diminua o S e resete o passo.
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

{Browse {Josephus3 10 2}}
{Browse 'Stateful (10 2) rodou: ' # @Counter # ' vezes'}
Counter:= 0
{Browse {Josephus3 40 3}}
{Browse 'Stateful (40 3) rodou: ' # @Counter # ' vezes'}
Counter:= 0
{Browse {Josephus3 500 3}}
{Browse 'Stateful (500 3) rodou: ' # @Counter # ' vezes'}
Counter:= 0
{Browse {Josephus3 1000 5}}
{Browse 'Stateful (1000 5) rodou: ' # @Counter # ' vezes'}
Counter:= 0
