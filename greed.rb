def greed
  dice = []
  5.times do
    dice << rand(1..6)
  end
  puts "You rolled #{dice}."
  score = 0
  for i in 1..6
    if i == 1
      score += (1000 + ((dice.count(i) - 3) * 100) ) if dice.count(i) >= 3
      score += 100*dice.count(i) if dice.count(i) >= 1 && dice.count(i) < 3
      next
    elsif i == 5 
      score += (500 + 50*(dice.count(i) - 3) )  if dice.count(i) >= 3
      score += 50*dice.count(i)  if dice.count(i) >= 1 && dice.count(i) < 3
      next
    else
      score += 100*i if dice.count(i) >= 3
      end
    end
  puts "Your score is #{score}. Thanks for playing!"
end
