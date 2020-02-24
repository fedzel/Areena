extends "res://scribut/pawn.gd"

class_name Actor



onready var dmgind = get_node("DamageInd")
onready var label = get_node("Sprite/Label")

var noppa

var dmg1 = load("res://tavarat/dmg1.png")
var dmg2 = load("res://tavarat/dmg2.png")
var dmg3 = load("res://tavarat/dmg3.png")


var actor_hp : int
var actor_maxhp : int
var actor_speed : int
var actor_dmg : int
var actor_team : int

# Init empty actor

func _init(p_name = "noname", p_maxhp = 10, p_speed = 1, p_dmg = 1, p_team = 0):
	self.name = p_name
	actor_hp = p_maxhp
	actor_maxhp = p_maxhp
	actor_speed = p_speed
	actor_dmg = p_dmg
	actor_team = p_team



func _ready():
	randomize()
	noppa = randi()%10 + 1
	set_actor_speed(noppa)
	turn_que.all_actors.append(self)
	label.text = str(actor_speed)

func set_actor_speed(speed):
	actor_speed = speed
	
func set_actor_team(team):
	actor_team = team
	team.team_chars.append(self)

func reset_ind():
	dmgind.texture = null
	





#func take_damage(damage):
#	dmg = randi() % 5 + 1
#	print(damage, "DAMAGE")
#	dmgind.modulate = Color(1,1,1,1)
#	print(hp, " HP ENNE")
#	hp -= damage
#	print(hp, " HP jälke", self.name)
#	if damage > 3:
#		dmgind.texture = dmg2
#	if damage <= 3:
#		dmgind.texture = dmg1
#	if hp <= 0:
#		dmgind.texture = dmg3
