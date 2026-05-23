# Private: not part of MLME public API -- subject to change without notice
data modify storage mlme:engine locks append value {name:"",held:1b}
data modify storage mlme:engine locks[-1].name set from storage mlme:input lock.name
data modify storage mlme:output lock.acquired set value 1b
