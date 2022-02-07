# gossip.rb - Coded with love & sweat by Jean-Baptiste VIDAL for THP Developer curriculum (Winter 2022)
# W5D1 - Gossip app upgraded with Sinatra + Rackup + Shotgun

# Useful includes and bundles
require_relative 'applicationcontroller.rb'
require 'io/console'

# Gossip - Class instantiating the Gossip objects and related methods (CRUD = create, read, update, delete)
class Gossip

  attr_accessor :id, :author, :content
  @@unique_gossip_counter = 1
  
  # initialize - Gossip constructir method. Enables to create 'real' Gossip with an auto-incremented 'id' or temp Gossip with arbitrary 'id'
  def initialize(my_author,my_content,my_id,new_real_gossip)
    @author = my_author
    @content = my_content
    if new_real_gossip
      tmp_tab = Gossip.read_all(ApplicationController.get_csv_name,false)
      if tmp_tab.nil? 
        @@unique_gossip_counter = 1
      else
        @@unique_gossip_counter = (tmp_tab.sort_by { |item| -item.id})[0].id+1
      end
      @id = @@unique_gossip_counter
    else
      @id = my_id
    end
  end

  # read_all - Open the pointed CSV file (if exists, if not return nil) and return a table containing gossip id, author and content
  def self.read_all(my_csv_filename, verbose)
    tmp_file = nil
    tmp_lines_tab = []
    tmp_all_gossips_tab = []
    tmp_gossip_tab = []
    tmp_line_counter = 0
    if verbose
      # Show.disp("")
      # Show.disp("Reading all gossips from CSV file:")
      # Show.disp("  > Searching for the pointed CS file '#{my_csv_filename}'.")
    end
    if !File.exists?(my_csv_filename)
      if verbose
      #   Show.disp("  > File does not exist, sorry. Hence not able to display all gossips.")
      end
      return nil
    else
      if verbose
        # Show.disp("  > Block reading from CSV file.")
      end
      tmp_lines_tab = IO.readlines(my_csv_filename)
      tmp_lines_tab.each do |my_line|
        tmp_gossip_tab = my_line.split("|")
        tmp_all_gossips_tab.push(Gossip.new(tmp_gossip_tab[1].chomp,tmp_gossip_tab[2].chomp,tmp_gossip_tab[0].chomp.to_i,false))
        tmp_line_counter += 1
      end
      if verbose
        # Show.disp("  > Read #{tmp_line_counter} lines from CSV file and stored them into an array of Gossip objects.")
      end
      return tmp_all_gossips_tab
    end
  end

# read_all - Open the pointed CSV file (if exists, if not return nil) and return a table containing gossip id, author and content
def self.get_gossip_by_id(my_csv_filename, my_id, verbose)
  tmp_lines_tab = []
  tmp_my_gossip = nil
  tmp_gossip_tab = []
  tmp_line_counter = 0
  if verbose
    # Show.disp("")
    # Show.disp("Reading 1 gossip with ID = #{my_id} from CSV file:")
    # Show.disp("  > Searching for the pointed CS file '#{my_csv_filename}'.")
  end
  if !File.exists?(my_csv_filename)
    if verbose
    #   Show.disp("  > File does not exist, sorry. Hence not able to display all gossips.")
    end
    return nil
  else
    if verbose
      # Show.disp("  > Block reading from CSV file.")
    end
    tmp_lines_tab = IO.readlines(my_csv_filename)
    tmp_lines_tab.each do |my_line|
      tmp_gossip_tab = my_line.split("|")
      if tmp_gossip_tab[0].chomp.to_i == my_id
        tmp_my_gossip = Gossip.new(tmp_gossip_tab[1].chomp,tmp_gossip_tab[2].chomp,tmp_gossip_tab[0].chomp.to_i,false)
        if verbose
          # Show.disp("  > Gossip with ID #{my_id} found!.")
        end
      end
      tmp_line_counter += 1
    end
    if verbose
      # Show.disp("  > Read #{tmp_line_counter} lines from CSV file before finding Gossip with ID #{my_id}.")
    end
    return tmp_my_gossip
  end
end

  # save_to_csv - Write ('w' mode if new file, 'a' mode if not) a Gossip author and content into "gossip.csv"
  def save_to_csv(my_csv_filename, verbose)
    tmp_file = nil
    tmp_write_mode = "w"
    if verbose
      # Show.disp("")
      # Show.disp("Saving gossip into CSV file:")
      # Show.disp("  > Searching for backup file '#{my_csv_filename}'.")
    end
    if File.exists?(my_csv_filename)
      if verbose
        # Show.disp("  > File '#{my_csv_filename}' exists already - Adding the gossip.")
      end
      tmp_file = File.open(my_csv_filename, "a")
      tmp_file.write("#{self.id}|#{self.author}|#{self.content}\n")
      tmp_file.close
    else
      if verbose 
        # Show.disp("  > File '#{my_csv_filename}' does not exist - Creating, opening and writing the gossip into the file.")
      end
      File.write(my_csv_filename, "#{self.id}|#{self.author}|#{self.content}\n")
    end
    if verbose
      # Show.disp("  > Data written.")
      # Show.disp("  > Closing file.")
      # Show.pause
    end
  end

end

# gossip.rb - Coded with love & sweat by Jean-Baptiste VIDAL for THP Developer curriculum (Winter 2022)