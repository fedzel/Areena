extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var butons = get_node("VBoxContainer/GridContainer").get_children()
	for i in butons:
		i.connect("pressed", self, "_on_button_press", [i.name])


		
func update_label(tex):
	get_node("VBoxContainer/VBoxContainer/Label4").text = str(tex)
		
func _on_button_press(button):
	var coord
	match button:
		"ylös":
			coord = Vector2(0,-1)
		"alas":
			coord = Vector2(0,1)
		"oikea":
			coord = Vector2(1,0)
		"vasen":
			coord = Vector2(-1,0)
		"vasenylös":
			coord = Vector2(-1,-1)
		"oikeeylös":
			coord = Vector2(1,-1)
		"vasenalas":
			coord = Vector2(-1,1)
		"oikeaalas":
			coord = Vector2(1,1)
		"ohita":
			pass
	get_tree().call_group("Taistelu", "Nappi", coord)

