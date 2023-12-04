extends Node

var Day = 3	#day adjustments
var Day_2_unlock = false
var Day_3_unlock = false
var Day_4_unlock = false
var Day_5_unlock = false
var have_gigi = false
var used_door = false
var door_used
var is_dialog_active = false

var items = []
var collected_items = []

var is_day = false	#changes the sprite in the HUD to Day HUD or Night HUD
#==================================================================================================
# night 1 specific flags
var day_1_intro = false
var night_1_intro = false
var first_time_found_gigi = false
var night_1_end = false
#==================================================================================================
# night 2 specific flags
var day_2_intro = false
var night_2_intro = false
var garage_first_check_car = false
var key_taken = false
var garage_open_trunk = false
var night_2_end = false
#==================================================================================================
# night 3 specific flags
var day_3_intro = false
var night_3_intro = false
var front_ent_recept_first_check = false
var read_receipt = false
var password_known = false
var ordered_return = false
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

var have_crowbar = false
var trapdoor_locked = true
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
var day_5_intro = false
var night_5_intro = false

var garage_trigger = false
# This flag is meant to change Gigi's label and portrait into Mimi's for the night 5 scenes.
# Set to true once night_5_intro is true, set back to false once we load the ending cutscene
var slot1_empty = true
var slot2_empty = true
var slot3_empty = true
var fuel_cell1 = false
var fuel_cell2 = false
var fuel_cell3 = false
var fuel_cell = 0
var mimi_is_here = false
var mimi_replace_gigi = false

#Set to false when we have all three batteries. Play the teleporter_interact_not_enough_batteries dialogue until then
var teleporter_needs_batteries = true
