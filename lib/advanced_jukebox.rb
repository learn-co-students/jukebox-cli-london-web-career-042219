#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer


def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end


def list(my_songs)
  songlist = my_songs.keys
  songlist.each_with_index do |song, i|
    puts "#{i+1}. #{song}"
  end
end


# return song key, or nil if invalid
def selection_valid(selection, songlist)
  if selection.to_i > 0
    # user entered a number
    index = selection.to_i - 1
    if index >= songlist.length
      key = nil
    else
      key = songlist.keys[index]
    end
  else
    # user entered a song name
    key = selection
    key = nil if songlist[key] == nil
  end

  key
end


#this method is slightly different!
#you should still ask the user for input and collect their song choice
#this time, only allow user's to input a song name
#check to see if the name they give is in fact a key of the my_songs hash
#if it isn't, tell them their choice is invalid
#if it is, play the song using the system 'open <file path>' syntax
#get the file path of the song by looking it up in the my_songs hash
def play(songs, path)

    puts "Please enter a song name or number:"
    selection = selection_valid(gets.chomp, songs)

    if selection == nil
      puts "Invalid input, please try again"
      return
    end

    puts "Playing " + selection

    system "open " + path + songs[selection]

end


def exit_jukebox
  puts "Goodbye"
end


def run(songs)

    path = Dir.pwd + "/"

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
        play(songs, path)
      else
        puts "Invalid command"
        help
      end
    end

end
