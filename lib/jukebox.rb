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

#puts "Enter your name:"
#users_name = gets.chomp

def run(songs)

  help

  while true do
    puts "Please enter a command:"
    command = gets.chomp.downcase

    case command
    when "exit"
      exit
      break
    when "help"
      help
    when "list"
      list(songs)
    when "play"
      play(songs)
    else
      puts "Invalid command"
      help
    end

  end

end


def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end


def exit_jukebox
  puts "Goodbye"
end


def list(songs)
  songs.each_with_index do |song, i|
    puts "#{i+1}. #{song}"
  end
end


# return song index, or nil if invalid
def selection_valid(selection, songlist)
  if selection.to_i > 0
    # user entered a number
    index = selection.to_i - 1
    index = nil if index >= songlist.length
  else
    # user entered a song name
    index = songlist.index(selection)
  end

  index
end


def play(songs)

  puts "Please enter a song name or number:"
  selection = selection_valid(gets.chomp, songs)

  if selection == nil
    puts "Invalid input, please try again"
    return
  end

  puts "Playing " + songs[selection]
  
end
