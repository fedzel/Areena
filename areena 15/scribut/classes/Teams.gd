extends Node
class_name Team

var team_name : String
var team_money : int
var team_chars = []

func _init(p_name = "0",p_money = 0, p_chars = []):
	team_name = p_name
	team_money = p_money
	team_chars = p_chars

func set_team_name(arg):
	team_name = arg


func set_team_money(monies):
	team_money = monies

func add_team_char(arg):
	team_chars.append(arg)

func get_val():
	return [self.team_name,self.team_money]

func get_team_chars():
	return team_chars

