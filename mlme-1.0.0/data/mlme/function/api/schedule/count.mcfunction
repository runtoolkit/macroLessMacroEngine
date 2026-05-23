# PUBLIC API -- mlme:api/schedule/count
# macroLessMacroEngine v1.0.0
#
# Count pending scheduled jobs.
# Output: mlme:output schedule.count (int)
#
# Usage:
# function mlme:api/schedule/count
# data get storage mlme:output schedule.count

execute store result storage mlme:output schedule.count int 1 run data get storage mlme:schedule jobs