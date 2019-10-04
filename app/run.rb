#require_relative '../config/enviroment'
require 'pry'
$prompt = TTY::Prompt.new


def start
    
    puts "Welcome to RPS(Rock, Paper, Scissor)!!"
    @user_name = $prompt.ask("What is your name challenger!", default: 'Anonymous')
    puts "\e[H\e[2J"
    main_menu
end
 
def negative(win_count)
    if @win_count < 0
        @win_count = 0
    end
end
 
def loop_fight
    user_choice = $prompt.select("#{@user_name} choose your weapon!") do |menu|
    menu.choice 'Rock', 1
    menu.choice 'Paper', 2
    menu.choice 'Scissor', 3
    menu.choice 'Exit to Main Menu and Save', 'x'
    end
    fight(user_choice,ai_pick)
end
 
def ai_pick
    ai_wep = [1,2,3] #1)Rock, 2)Paper, 3)Scissor
    ai_choice = ai_wep.shuffle.first
    ai_choice
end
 
def status
    if @win_count < 0
        @win_count == 0
        @status = 'Egg'
    elsif @win_count == 0
        @status = 'Egg'
    elsif @win_count == 1
        @status = 'Chicken'
    elsif @win_count == 2
        @status = 'Raptor'
    elsif @win_count == 3
        @status = 'OVERLORD'
    end
end
 
def fight(user_wep,ai_wep)
    user_w = getting_wep(user_wep)
    ai_w = getting_wep(ai_wep)

    if user_w == ai_w
        status
        puts "\e[H\e[2J"
        puts " "
        puts "Both fighters weapons are #{user_w}!"
        puts "#{@user_name}'s and the champion's weapons cancel each other out!"
        puts "Win count: #{@win_count}"
        puts "Status: #{@status}"
        puts "Highest Streak: #{@highest_streak}"
    elsif user_w == "Rock" && ai_w == "Scissor" || user_w == "Paper" && ai_w == "Rock" || user_w == "Scissor" && ai_w == "Paper"
        @win_count +=1
        status
        streak
        puts "\e[H\e[2J"
        puts " "
        puts "The #{@user_name}'s' #{user_w} has the advantage over the champ's #{ai_w}."
        puts "You win!"
        puts "Win count: #{@win_count}"
        puts "Status: #{@status}"
        puts "Highest Streak: #{@highest_streak}"
    elsif ai_w == "Rock" && user_w == "Scissor" || ai_w == "Paper" && user_w == "Rock" || ai_w == "Scissor" && user_w == "Paper"
        if @win_count - 1 < 0
            @win_count = 0
        else
            @win_count -=1
        end
        
        status
        puts "\e[H\e[2J"
        message = "The champ's #{ai_w} has the advantage over #{@user_name}'s' #{user_w}."
        if @status == "OVERLORD"
            puts 'DEFEATED: YOURE NOW AN EGG'
            if @highest_streak <= @streak
                @highest_streak = @streak
            end
            @status = 'Egg'
            @win_count = 0
            @streak = 0
        end
        puts " "
        puts "The champ's #{ai_w} has the advantage over #{@user_name}'s' #{user_w}."
        puts "You lose!"
        puts "Win count: #{@win_count}"
        puts "Status: #{@status}"
        puts "Highest Streak: #{@highest_streak}"
    else
        @u = User.create(name: @user_name)
        @s = Status.create(name: @status)
        Scoreboard.create(user_id: @u.id, status_id: @s.id, streak: @highest_streak)
        puts "\e[H\e[2J"
        puts "Exited out"
        start
        @i += 100
        
    end
end

 
def getting_wep(weapon_num)
    if weapon_num == 1
        weapon = "Rock"
    elsif weapon_num == 2
        weapon = "Paper"
    elsif weapon_num == 3
        weapon = "Scissor"
    elsif weapon_num == 'x'

    end
    weapon
end

def streak
    if @win_count >= 4
        @streak +=1
    end
end

def main_menu

    menu_choice = $prompt.select("#{@user_name} what would you like to do?") do |menu|
    menu.choice 'Start Game', 1
    menu.choice 'See High Score', 2
    menu.choice 'Log Out', 3
    menu.choice 'Close Game', 4
    end

    if menu_choice == 1 
        start_game
    elsif menu_choice == 2
        puts "\e[H\e[2J"
        top_5_score_board
    elsif menu_choice == 3
        puts "\e[H\e[2J"
        start
    elsif menu_choice == 4
        end_game
    end

end

def top_5_score_board
    puts " "
    puts "Nothing yet...."
    # u1 = Scoreboard.find(user_id = 9)
    # puts u1
    start
end

def end_game
    puts "Bye Bye ..."
end

def start_game
    @status = 'Egg'
    @win_count = 0
    @streak = 0
    @highest_streak = 0

    @i = 0
    while @i < 100 do
        loop_fight
        @i+=1
    end
    @u = User.create(name: @user_name)
    @s = Status.create(name: @status)
    Scoreboard.create(user_id: @u.id, status_id: @s.id, streak: @highest_streak)
    puts "\e[H\e[2J"
    puts "You used all your turns..."
    start
end
 
start