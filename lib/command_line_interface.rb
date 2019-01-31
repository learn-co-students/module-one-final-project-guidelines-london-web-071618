

def welcome
    puts "
    Hello, welcome to Overwatch.

    To play, you need a full team. At this point in time, you are two team players short. The current team is...

    -----------------------------------------"
    team_makeup(start_team)
    puts "
    -----------------------------------------"

end

def team_makeup(finished_list)
    finished_list.map {|t| puts "character: #{t.name}, #{"role:".rjust(10-t.name.length)} #{t.role}"}
end
  
def start_team
    team =[]
      dva = find_character("D.Va")
      team << dva
      hanzo = find_character("Hanzo")
      team << hanzo
      mei = find_character("Mei")
      team << mei
      mercy = find_character("Mercy")
      team << mercy
  end

  def find_character(character)
    Character.find_by_name(character)
  end

  def get_character_from_user
    puts "
    Please select a character out of this list to join your team:
    'Ana', 'Bastion', 'Genji', 'Junkrat', 'Lucio', 'McCree', 'Pharah', 'Reaper', 'Reaper', 'Roadhog', 'Soldier: 76', 'Symmetra', 'Torbjorn', 'Tracer', 'Widowmaker', 'Winston', 'Zarya'.
    -------------------------------------------------"
    return gets.chomp
  end

  def get_preference
    puts "
  Find out more info or type other to select another character.
  Type '1: description', '2: role', '3: difficulty,' or type 'yes' to choose this character or 'other' to choose another.
  ---------------------------------------------"
    return gets.chomp
  end
  
  def character_information(character, pref, team)
    if pref == "1"
      puts "Description:
  
  #{character.description}"
    elsif pref == "2"
      puts "Role:
  #{character.role}"
    elsif pref == "3"
      puts "Difficulty:
  #{character.difficulty}"
    elsif pref == "yes"
      puts "
  character saved
  ----------------------------------------"
      saved_character = character
      team << saved_character
    elsif pref == "other"
      get_character_from_user
    end
  end

  def find_other_characters_for_team(team_list)
    puts "You have #{team_list.count} in your team. To add more players choose a character to complement your team.
  'Ana', 'Bastion', 'Genji', 'Junkrat', 'Lucio', 'McCree', 'Pharah', 'Reaper', 'Reaper', 'Roadhog', 'Soldier: 76', 'Sombra', 'Symmetra', 'Torbjorn', 'Tracer', 'Widowmaker', 'Winston', 'Zarya'.
  
  ----------------------------------------"
    return gets.chomp
  end
  
  def find_characters_player_id(character_id)
   char_id = Game.all.select {|game| game.character_id == character_id}
   player_id = char_id.map {|character| character.player_id}
  end
  
  def find_name_from_player_id(player_id)
   player_name = Player.find_by_id(player_id)
   if player_name
    player_name.name
   else 
    puts "No one"
   end
  end
  
  def save_team_member(player)
    puts "#{player} has played this character. Would you like to add them to your team? 'y' or 'n'"
    return gets.chomp
  end
  
  def team_makeup(finished_list)
    finished_list.map {|t| puts "character: #{t.name}, #{"role:".rjust(10-t.name.length)} #{t.role}"}
  end
  
  def add_team_loop(player_choice, character, team_list_5)
    if player_choice == "y"
      team_list_5 << character
      puts "You now have a full team and are ready to play!
  ----------------------------------------------"
      team_makeup(team_list_5)
    end
  end
  
  def last_message
    puts "
  ------------------------------------------------
  Go kick some ass!"
  end
  
  