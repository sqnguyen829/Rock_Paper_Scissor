require 'pry'




def opponent 
    opponent_choices = [0, 1, 2]
    
    opp_choice = opponent_choices.shuffle.first
    if opp_choice == 0
        puts "Your opponent chose rock"
    elsif opp_choice == 1 
        puts "Your opponent chose paper"
    elsif opp_choice == 2  
        puts "Your opponent chose scissors"
    end
end


# opponent_move
puts opponent

#  binding.pry
0

