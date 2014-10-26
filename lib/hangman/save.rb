require "date"
require "yaml"


module Hangman
  class Save

    def initialize
    end

  	
=begin
 	r - Read only. The file must exist.   
	w - Create an empty file for writing.
	a - Append to a file.The file is created if it does not exist.
	r+ - Open a file for update both reading and writing. The file must exist.
	w+ - Create an empty file for both reading and writing.
	a+ - Open a file for reading and appending. The file is created if it does not exist.
=end
  	def self.load_game(filename)
      puts Dir.pwd
  	  f = File.open('../saved_games/#{filename}', 'r')
  	  yaml = f.read
  	  game = Game.new
	    game = YAML::load(yaml)
	    game.resume
    end

    def self.save_game(file, name)
      time = Time.new
      f = File.open("../saved_games/#{name}_#{time.to_i}.yml", "w")
      serialized_object = YAML.dump (file)
      f.puts serialized_object
      f.close
    end


  	def self.list_of_games
      puts Dir.pwd
  	  @list = []
  	  Dir.foreach('../saved_games/') do |item|
  	    @list << item
	    end
	    @list
	  end

    def self.access_list(list = @list, position)
      list[position + 1]
    end

	
  end
end