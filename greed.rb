class DiceGames

#High Score is read-write.
attr_accessor :greed_high_score

def DiceGames.greed
  #if high score is currently "nil" (this is the first time you are playing), set the high score to 0.
  #Otherwise, keep the high score at its current value.
  @greed_high_score ||= 0
  dice = [] #sets up a blank array
  5.times do #use the rand method 5 times and store the (rolled) results in the dice array
    dice << rand(1..6) #To make rand behave like a 6-sided die, you have to set the rand paramater as a range.
    end
  #display the dice array
  puts "You rolled #{dice}."
  score = 0
  #the following code came from javierjulio, and its goal is to create a Hash
  #that stores the freqeuency of each possible roll. Default is 0.
  counts = Hash.new(0) 
  dice.each do |value|
    counts[value] += 1
  end
  #also from javierjulio, check all possible die rolls from this Hash, and 
  #assign points accordingly. All scoring rolls are deleted from the Hash
  counts.each do |roll,numFound|
    #1000 points for rolling 3 ones, then delete those rolls from the hash
    if roll == 1 && numFound >= 3
      score += 1000
      numFound -= 3
      puts "Triple 1s: 1000"
    end
    #100 points for each "lone" one.
    if roll == 1 && numFound > 0
      score += 100*numFound
      puts "Lone 1s: #{100*numFound}"
      numFound -= numFound
    end
    #get 100*(roll) points if you roll a number other than one 3 times or more. For example,
    #if you roll three 5s, you get 500 points.
    if numFound >= 3
      score += roll*100
      puts "Triple #{roll}s: #{roll*100}"
      numFound -= 3
    end
    #50 points for each "lone" 5
    if roll == 5 && numFound > 0
      score += 50*numFound
      puts "Lone 5s: #{50*numFound}"
      numFound -= numFound
    end
  end
  #report your score to the player
  puts "Your score is #{score}. Thanks for playing!"
  #check to see if the current high score is lower than your current score.
  #If it does, set the current high score to equal your current score and praises the player.
  if @greed_high_score < score
    @greed_high_score = score
    puts "Excellent! New high score!"
    end
  #let the player know the current high score
  puts "The current high score is #{@greed_high_score}."
end

end
