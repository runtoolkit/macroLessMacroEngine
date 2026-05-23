# Private: not part of MLME public API -- subject to change without notice
# Routes tag add through command block tunnel since tag name is in storage.
data modify storage mlme:cmd Command set value "tag @e[tag=mlme.target] add placeholder"
# We cannot dynamically set the tag name without macros.
# This function is a pattern guide -- use direct tag commands in your pack.
# For runtime dynamic tags, use the command block tunnel:
data modify storage mlme:cmd Command set value "tag @e[tag=mlme.target] add mlme.tagged"
function mlme:core/run/setup_marker
function mlme:core/run/cmd
tag @e remove mlme.target
