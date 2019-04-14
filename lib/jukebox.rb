require 'pry'

songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]
def run(array)
  command = ""
  help
  puts "Please enter a command:"
  until command == "exit"
    command = gets.chomp
    # use if or case statemnts to determine how your program will respond
    case command
      when "list"
        list(array)
      when "play"
        play
      when "help"
        help
      when "exit"
        exit_jukebox
        break
      else
        puts "that is not valid input"
    end
  end
end

def play(songs)
  response = ""
  puts "Please enter a sond name or number:"
  response = gets.chomp
  if songs.include?(response)
    puts "Playing #{response}"
  elsif ((response.to_i <= songs.length + 1) && response.to_i != 0) #strings evauate to 0
    puts "Playing #{songs[response.to_i - 1]}"
  else
    puts "Invalid input, please try again"
  end
  #binding.pry
end

def exit_jukebox
  puts "Goodbye"
end

def list(songs)
  songs.each_with_index { |song,i|
    puts "#{i+1}. " + song
  }
end

def help
  puts "I accept the following commands:
- help : displays this help message
- list : displays a list of songs you can play
- play : lets you choose a song to play
- exit : exits this program"
end
