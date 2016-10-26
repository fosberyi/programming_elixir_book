fizz_buzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, a -> a
end

IO.puts "should be fizz:"
IO.puts fizz_buzz.(0,0,8)

IO.puts "should be buzz:"
IO.puts fizz_buzz.(9,0,4)

IO.puts "should be value:"
IO.puts fizz_buzz.(9,8,0)

rem_fb = fn
  n -> fizz_buzz.(rem(n, 3), rem(n, 5), n)
end

IO.puts rem_fb.(10)
IO.puts rem_fb.(11)
IO.puts rem_fb.(12)
IO.puts rem_fb.(13)
IO.puts rem_fb.(14)
IO.puts rem_fb.(15)
IO.puts rem_fb.(16)
