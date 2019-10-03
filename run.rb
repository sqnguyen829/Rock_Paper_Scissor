require_relative './config/enviroment'
require "tty-prompt"

$prompt = TTY::Prompt.new
def start
   @win_count = 0
   @status = 'Egg'
   puts "Welcome to RPS(Rock, Paper, Scissor)!!"
   @user_name = $prompt.ask("What is your name challenger!")
   counter = 0
   @i = 0
   while @i < 100 do
       loop_fight(counter)
       @i+=1
   end
end
def negative(win_count)
   if @win_count < 0
       @win_count == 0
   end
end
def loop_fight(counter)
   user_choice = $prompt.select("#{@user_name} choose your weapon!") do |menu|
   menu.choice 'Rock', 1
   menu.choice 'Paper', 2
   menu.choice 'Scissor', 3
   menu.choice 'Exit', 'x'
   end
   fight(user_choice,ai_pick)
end
def ai_pick
   ai_wep = [1,2,3] #1)Rock, 2)Paper, 3)Scissor
   ai_choice = ai_wep.shuffle.first
   ai_choice
end
def status
   # @status = 'Egg'
   if @win_count == 0
       @status == 'Egg'
   elsif @win_count == 1
       @status == 'Chicken'
   elsif @win_count == 2
       @status == 'Raptor'
   elsif @win_count == 3
       @status == 'OVERLORD'
   end
end
def fight(user_wep,ai_wep)
   user_w = getting_wep(user_wep)
   ai_w = getting_wep(ai_wep)
   status
   if user_w == ai_w
       puts "Both fighters weapons are #{user_w}!"
       puts "#{@user_name}'s and the champion's weapons cancel each other out!"
       puts "Your status: #{@status}. Win count: #{@win_count}"
   elsif user_w == "Rock" && ai_w == "Scissor" || user_w == "Paper" && ai_w == "Rock" || user_w == "Scissor" && ai_w == "Paper"
       @win_count +=1
       puts "The #{@user_name}'s' #{user_w} has the advantage over the champ's #{ai_w}."
       puts "You win!"
       puts "Your status: #{@status}. Win count: #{@win_count}"
   elsif ai_w == "Rock" && user_w == "Scissor" || ai_w == "Paper" && user_w == "Rock" || ai_w == "Scissor" && user_w == "Paper"
       @win_count -=1
       puts "The champ's #{ai_w} has the advantage over #{@user_name}'s' #{user_w}."
       puts "You lose!"
       puts "Your status: #{@status}. Win count: #{@win_count}"
   else
       puts "high score"
       @i += 100
   end
   negative(win_count)
end
def getting_wep(weapon_num)
   if weapon_num == 1
       weapon = "Rock"
   elsif weapon_num == 2
       weapon = "Paper"
   elsif weapon_num == 3
       weapon = "Scissor"
   elsif weapon_num == 'x'
       puts 'Thanks for playing! Your score is:'
   end
   weapon
end
def overlord_streak
   streak = 0
   if @status == 'OVERLORD' && @win_count > 4
       streak += 1
   else
       @status == 'Egg'
   end
end
start