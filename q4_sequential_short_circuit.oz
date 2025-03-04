declare
fun {Josephus3 N K}
    A = {NewArray 1 N 0} % Usarei um array de inteiros agora
    X = {NewCell 1}
    S = {NewCell N}
    Step = {NewCell 1}
    Aux = {NewCell 0} % Variável auxiliar para realizar a troca de valores mais a frente
    fun {KillVictims Last} % Salvamos agora quem é o elemento anterior
        if @S==1 then % Caso de parada
            @X
        else
            if @Step==K then % Se estivermos no K elemento
                A.Last:=A.@X % O próximo do anterior é o próximo do elemento a ser removido
                X:=A.@X % Vamos para o próximo
                S:=@S-1
                Step:=1
                {KillVictims Last}
            else
                Aux:=@X
                X:=A.@X % O anterior agora será o elemento atual e assim seguimos para o próximo
                Step:=@Step+1
                {KillVictims @Aux}
            end
        end
    end
in
    for I in 1..N-1 do % Preencho um array onde cada posição está armazenando o próximo elemento de maneira circular [2, 3, 4, 5 .. N-1, N, 1]
        A.I:=I+1
    end
    A.N:=1
    {KillVictims 1}
end
{Browse {Josephus3 40 3}}