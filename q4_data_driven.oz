declare Counter = {NewCell 0} % Inicializa o contador
declare
fun {Pipe Xs L H F}
    if L =< H then 
       {Pipe {F Xs L} L+1 H F} 
    else 
       Xs 
    end
 end
 
 declare
 fun {Josephus2 N K}
    fun {Victim Xs I}
      Counter := @Counter + 1  % Incrementa o contador
       case Xs of kill(X S)|Xr then
          if S == 1 then 
            {Browse 'Counter' # @Counter}
            Counter := 0
             Last = I nil
          elseif X mod K == 0 then
             kill(X+1 S-1)|Xr
          else
             kill(X+1 S)|{Victim Xr I}
          end
       [] nil then 
          nil 
       end
    end
    
    Last Zs
 in
    Zs = {Pipe kill(1 N)|Zs 1 N
       fun {$ Is I} 
          thread {Victim Is I} 
       end 
    end}
    Last
 end

 {Browse {Josephus2 10 2}}
 {Delay 2000}
 {Browse {Josephus2 40 3}}
 {Delay 2000}
 {Browse {Josephus2 500 3}}
 {Delay 2000}
 {Browse {Josephus2 1000 5}}