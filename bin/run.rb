require_relative '../config/environment'
require_relative '../lib/command_line_interface'


start_team

welcome

preference = " "
character = get_character_from_user

until preference == "yes"

    preference = get_preference
    
    character_instance = find_character(character)
    
    team = character_information(character_instance, preference, start_team)
    
    end
    
    until team.count == 6
    
    requested_character = find_other_characters_for_team(team)
    
    character_instance = find_character(requested_character)
    
    player = find_characters_player_id(character_instance.id)
    
    player_who_has_character = find_name_from_player_id(player)
    
    choice = save_team_member(player_who_has_character)
    
    add_team_loop(choice, character_instance, team)
    
    end
    
    last_message