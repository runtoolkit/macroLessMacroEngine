# Private: not part of MLME public API -- subject to change without notice
# Checks mlme:engine locks list for existing entry with this name.
# If not found or found with held:0b, sets held:1b and returns acquired.
execute unless data storage mlme:engine locks[0] run function mlme:core/lock/acquire_new
execute if data storage mlme:engine locks[0] run function mlme:core/lock/acquire_scan
