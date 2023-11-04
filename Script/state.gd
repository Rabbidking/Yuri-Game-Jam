extends Node

var Day = 1	#day adjustments
var key_taken = false
var cur_room = 0
var player_pos = 0
var used_door = false
var door_used
var is_dialog_active = false

var items = []
var collected_items = []
#==================================================================================================
# night 1 specific flags
var day_1_intro = true
var night_1_intro = false
var first_time_found_gigi = false
var night_1_end = false
#==================================================================================================
# night 2 specific flags
var day_2_intro = false
var night_2_intro = false
var garage_first_check_car = false
var garage_open_trunk = false
var night_2_end = false
#==================================================================================================
# night 3 specific flags
var day_3_intro = false
var night_3_intro = false
var front_ent_recept_first_check = false

# If this is true, play the password missing dialog. Else, play the dialog where she stops delivery, 
# then set Gigi to appear at the front entrance.
var bedroom_laptop_no_password = true 

var living_room_sticky = false
var gigi_at_entrance = false
var night_3_end = false
#==================================================================================================
# night 4 specific flags
var day_4_intro = false
var night_4_intro = false

#This should only be true if we're in night 4 and 5
var living_room_trapdoor = false

#plays dialog of Demi needing the crowbar
var trapdoor_no_crowbar = true

#plays dialog when Demi opens the trapdoor
var trapdoor_with_crowbar = false

#play dialog of Demi finding Gigi in basement
var gigi_found_in_basement = false

var night_4_end = false
#==================================================================================================
# night 5 specific flags
