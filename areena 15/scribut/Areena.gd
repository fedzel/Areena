extends Control


# siirrä menun aloituksen jälkeen
var NewTeam = load("res://scribut/classes/Teams.gd")

var Team1 = NewTeam.new()
var Team2 = NewTeam.new()

var adj
var object
var total


func _ready():
	randomize()
	TeamsToMake(10 + 1)
	InitTeams()
	Team1.set_team_name("Lolorit")
	Team2.set_team_name("Olorit")


# Make a number of teams 
func TeamsToMake(count):
	while count != 1:
		count -= 1
		var team = NewTeam.new()
		Randomizer()
		team.set_team_name(str(total))
		Global.AllTeams.append(team)
	for team in Global.AllTeams:
		print(team.team_name)

# Init teams
func InitTeams():
#	print(Teams.TeamArray)
	pass
#	for team in Teams.TeamArray:
#		print(Teams.TeamArray)
#		print(Teams.TeamArray.pop_back())

var adj_array = ["Ravenous ","Ritual ","Black ","Fury ","Sacred ","Bloodhounds ","Chaos ","Raving ","White "]
var adj_array2 = ["Lords of ","Masters of "]
var obj_array = ["Burdens","Gang","Guardians","Conscripts","Martyrs","Warriors","Improvisers","Hunters","Brawlers","Knights"]
var obj_array2 = ["the Rings", "the Chosen", "War", "Battle"]
# Random names for team
func Randomizer():
	var dice = randi() % 2 + 1
	var adjektiv = randi() % (adj_array.size() + 1)
	var dice2 = randi() % (adj_array2.size() + 1)
	var dice3 = randi() % (obj_array2.size() + 1)
	var objektiv = randi() % (obj_array.size() + 1)
	if dice == 2:
		if adj_array2.size() > 0:
			adj = adj_array2[(dice2 - 1)]
			adj_array2.remove(dice2 - 1)
			object = obj_array2[(dice3 - 1)]
			obj_array2.remove(dice3 - 1)
		else:
			adj = adj_array[adjektiv -1]
			adj_array.remove(adjektiv-1)
			object = obj_array[objektiv-1]
			obj_array.remove(objektiv-1)
	elif dice == 1:
		adj = adj_array[adjektiv -1]
		adj_array.remove(adjektiv-1)
		object = obj_array[objektiv-1]
		obj_array.remove(objektiv-1)
	total = adj + object



# burdens gang guardians conscripts martyrs warriors improvisers hunters brawlers knights
# the rings the chosen war battle

