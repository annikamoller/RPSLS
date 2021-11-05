ROCK = 0       #Global variables
PAPER = 1
SCISSORS = 2
LIZARD = 3
SPOCK = 4

def string_to_int(choice)
    choice = choice.downcase
    if choice == "rock"
        return ROCK           
    elsif choice == "paper"
        return PAPER
    elsif choice == "scissors"
        return SCISSORS
    elsif choice == "lizard"
        return LIZARD
    elsif choice == "spock"
        return SPOCK
    else
        return -1        #Used on row 35 to give an error message 
    end
end

def int_to_string(int)
    choices = ["rock", "paper", "scissors", "lizard", "spock"]
    return choices[int]
end

computer_score = 0
player_score = 0

while true
    puts "Choose rock, paper, scissors, lizard or spock!"
    players_choice = string_to_int(gets.chomp)         #Chomp removes \n
    while players_choice == -1
        puts "You need to choose one of the alternatives!"
        players_choice = string_to_int(gets.chomp) 
    end

    computers_choice = rand(0..4)
    puts "Computer chose #{int_to_string(computers_choice)}"

    beats = []

    beats[ROCK] = [PAPER, SPOCK]            #What beats each move
    beats[PAPER] = [LIZARD, SCISSORS]       
    beats[SCISSORS] = [ROCK, SPOCK]
    beats[LIZARD] = [ROCK, SCISSORS]
    beats[SPOCK] = [PAPER, LIZARD]

    if beats[players_choice].include? (computers_choice)        #Checks if computer won
        puts "You lost!"
        computer_score += 1
    elsif beats[computers_choice].include? (players_choice)      #Checks if player won
        puts "You won!"
        player_score += 1
    else
        puts "Draw!"            
    end

    puts "Computers score: #{computer_score}, your score: #{player_score}"
end