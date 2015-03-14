def score(dice)
  score = 0
  for i in 1..6
    if i == 1
      score += 1000  if dice.count(i) >= 3
      score += 100*dice.count(i) if dice.count(i) >= 1 && dice.count(i) < 3
      score += 100*(dice.count(i) - 3) if dice.count(i) >= 4
      next
    elsif i == 5 
      score +=500 if dice.count(i) >= 3
      score += 50*dice.count(i)  if dice.count(i) >= 1 && dice.count(i) < 3
      score += 50*(dice.count(i) - 3) if dice.count(i) >= 4
      next
    else
      score += 100*i if dice.count(i) >= 3
      end
    end
  score
end
