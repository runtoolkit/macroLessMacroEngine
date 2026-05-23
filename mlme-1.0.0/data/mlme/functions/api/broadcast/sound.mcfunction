# PUBLIC API -- mlme:api/broadcast/sound
# macroLessMacroEngine v1.0.0
#
# Play a sound to all players.
# Without macros the sound ID must be set via command block tunnel if dynamic,
# or use playsound directly in your functions for static sounds.
#
# Macro-free pattern (in your pack):
#   playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1
#
# This function plays the sound stored in mlme:input broadcast.sound
# via the command block tunnel (requires mlme:core/run/cmd).
#
# Input:
#   mlme:input broadcast.sound -- string, full playsound command
#
# Usage:
#   data modify storage mlme:input broadcast.sound set value "playsound minecraft:ui.button.click master @a ~ ~ ~ 1 1"
#   function mlme:api/broadcast/sound

data modify storage mlme:cmd Command set from storage mlme:input broadcast.sound
function mlme:core/run/setup_marker
function mlme:core/run/cmd
data remove storage mlme:input broadcast.sound
