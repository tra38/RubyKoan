def greed
  dice = [] #sets up a blank array
  5.times do #use the rand method 5 times and store the (rolled) results in the dice array
    dice << rand(1..6) #To make rand behave like a 6-sided die, you have to set the rand paramater as a range.
  end
  #display the dice array
  puts "You rolled #{dice}."
  score = 0
  for i in 1..6 #check all possible die rolls
    if i == 1 #if you roll a one
      #if you rolled 3 or more ones, get 1000 points for rolling 3 ones plus 100 points for every additional one
      score += (1000 + ((dice.count(i) - 3) * 100) ) if dice.count(i) >= 3
      #if you rolled less than 3 ones, just get 100 points for every one you rolled
      score += 100*dice.count(i) if dice.count(i) >= 1 && dice.count(i) < 3
      next
    elsif i == 5 #if you roll a five
      #if you rolled 3 or more fives, get 500 points for rolling 3 fives plus 50 points for every additional five
      score += (500 + 50*(dice.count(i) - 3) )  if dice.count(i) >= 3
      #if you rolled less than 3 fives, just get 50 points for every five you rolled
      score += 50*dice.count(i)  if dice.count(i) >= 1 && dice.count(i) < 3
      next
    else
      #get 100*i points if you roll a number other than one or five 3 times or more
      score += 100*i if dice.count(i) >= 3
      end
    end
  #report your score to the player
  puts "Your score is #{score}. Thanks for playing!"
end
