extends TileMap

enum { EMPTY = -1, ACTOR, OBJECT, OBSTACLE}

onready var Game = get_parent()



# Update label with coords

func _input(event):
	if InputEventMouseMotion:
		var world_pos = get_global_mouse_position()
		var map_pos = world_to_map(world_pos)
		get_tree().call_group("näppä", "update_label", map_pos)

# Set cell position from global position

func set_children_to_cells():
	for child in get_children():
		set_cellv(world_to_map(child.position), child.type)
		var node_pos = world_to_map(child.position)
		node_pos = map_to_world(node_pos)
		child.position = node_pos + Vector2(32,32)


# Return pawn from coordinates

func get_cell_pawn(coordinates):
	for node in get_children():
		if world_to_map(node.position) == coordinates:
			return(node)

# Set pawn from coordinates

func set_cell_pawn(pawn,coordinates):
	if get_cellv(coordinates) == -1:
		var new_pos = map_to_world(coordinates)
		pawn.position = new_pos + Vector2(32,32)
		set_cellv(world_to_map(pawn.position), pawn.type)
	else:
		print("improper spawn")

# Request move of a pawn in direction

func request_move(pawn, direction):
	var cell_start = world_to_map(pawn.position)
	var cell_target = cell_start + direction
	
	var cell_target_type = get_cellv(cell_target)
	match cell_target_type:
		EMPTY:
			return update_pawn_position(pawn, cell_start, cell_target)
		OBJECT:
			var object_pawn = get_cell_pawn(cell_target)
			object_pawn.queue_free()
			return update_pawn_position(pawn, cell_start, cell_target)
		ACTOR:
			var pawn_name = get_cell_pawn(cell_target)
			print("Cell %s contains %s" % [cell_target, pawn_name])
#			return [cell_target, pawn_name]

# Make starting cell empty and new cell same type as pawn

func update_pawn_position(pawn, cell_start, cell_target):
	set_cellv(cell_target, pawn.type)
	set_cellv(cell_start, EMPTY)
	return map_to_world(cell_target) + cell_size / 2







