extends Node2D

onready var Board = get_node("TileMap")

var ActorPawn = load("res://skenet/Actor.tscn")

var direction
var turn = 0
var current_act


var array_of_actors = []


func _ready():
	SpawnActors(Vector2(0,1))
	SpawnActors(Vector2(1,1))
	SpawnActors(Vector2(1,3))
	GenerateTurnOrder()
	TurnStart()



class MyCustomSorter:
	static func sort_ascending(a, b):
		if a[0] < b[0]:
			return true
		return false

# Load chars from 2 battling teams

func TeamLoader():
	pass



func GenerateTurnOrder():
	# sort all actors in turnque by speed
	for actor in turn_que.all_actors:
		var holder_array = []
		holder_array.append(actor.actor_speed)
		holder_array.append(actor)
		array_of_actors.append(holder_array)
	array_of_actors.sort_custom(MyCustomSorter, "sort_ascending")
	print(array_of_actors)
	for item in array_of_actors:
		item.pop_front()

# Spawn empty actors at position

func SpawnActors(coordinates):
	var ActorInstance = ActorPawn.instance()
#	InitializeActor(ActorInstance)
	Board.add_child(ActorInstance)
	Board.set_cell_pawn(ActorInstance,coordinates)
	
	
	
#	var ActorInstance= Actor.instance()
#	for TeamSpawn in Leveldata:
#		if TeamSpawn.name == "Team1":
#			for Actor in Leveldata.Team1:
#				Board.add_child(ActorInstance)
#		if TeamSpawn.name == "Team2":
#			for Actor in Leveldata.Team2:
#				Board.add_child(ActorInstance)
				



#---------------------------------------------------------------------
#Make instance
#    var GrabedInstance= MySmokeResource.instance()
#You could now make changes to the new instance if you wanted
#    CurrentEntry.name = "SmokeA"
#Attach it to the tree
#    self.add_child(GrabedInstance)
#---------------------------------------------------------------------






# Input buttons

func Nappi(coord):
	direction = coord
	print(coord)
	var target_position = Board.request_move(current_act, direction)
	if target_position:
		move_to(target_position)
#		turner()
		TurnEnd()
	else:
		pass




# Movement Logic



# Move after determined legal move
func move_to(target_position):
	current_act.position = target_position





# Turn logic -----------------------------------

# Turn start

func TurnStart():
	if array_of_actors.size() == 0:
		# generate new speed que
		GenerateTurnOrder()
	# get first node in que
	var first_item = array_of_actors.pop_back()
	var actor_path = get_path_to(first_item[0])
	current_act = get_node(actor_path)
	print(typeof(current_act))


# proceed with ok
func OkPressed():
	pass



# Turn end

func TurnEnd():
#	switchturn
	TurnStart()
	



#func turner():
#	for n in turn_que.turns:
#		current_act = get_node(str(turn_que.turns[(turn)]))
#	turn += 1
#	if turn >= turn_que.turns.size():
#		turn = 0
#	get_tree().call_group("actors", "reset_ind")


