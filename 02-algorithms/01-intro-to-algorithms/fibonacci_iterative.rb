def fib(n)
  if n < 1 || n % 1 != 0
    'Invalid Number. Input a sequence of at least 1.'
  else
    fib_0 = 0
    fib_1 = 1
    temp = 0
    n.times do
      temp = fib_0 + fib_1
      fib_0 = fib_1
      fin_1 = temp
    end
    
   puts fib(0)
   puts fib(1)
   puts fib(2)
   puts fib(3)
   puts fib(4)
   puts fib(5)
   puts fib(6)
   puts fib(7)
   puts fib(8)
   puts fib(9)
  end
end
