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

def help
  puts  "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end

def list( songs )
  songs.each_with_index do | v, i |
    puts "#{i+1}. #{v}"
  end
end

def play( songs )

  choice=""
  int_choice=0
  selected=false

    puts "Please enter a song name or number:"
    choice=gets.chomp

    songs.each_with_index do | v, i |
      if choice==(i+1).to_s || choice==v
         int_choice=i+1
         puts "Playing <#{v}>"
         selected=true
         break
      end
    end

    if int_choice==0
      puts "Invalid input, please try again"
    end

    selected

end

def exit_jukebox
  puts "Goodbye"
end

def run( songs )
  help
  choice=""
  while choice!="exit"
      puts "Please enter a command:"
      choice=gets.chomp
      puts choice
      case choice
      when "help"
        help
      when "list"
        list( songs )
      when "play"
        if play( songs )
          break
        end
      when "exit"
        exit_jukebox
      end
  end    
end
