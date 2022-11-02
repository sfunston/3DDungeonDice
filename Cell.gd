extends Node3D
class_name Cell

@onready var topFace: = $TopFace
@onready var northFace: = $NorthFace
@onready var eastFace: = $EastFace
@onready var southFace: = $SouthFace
@onready var westFace: = $WestFace
@onready var bottomFace: = $BottomFace
@onready var my_grid_position: = Vector2i.ZERO

func update_faces(cell_list) -> void:
	my_grid_position = Vector2i(position.x/Globals.GRID_SIZE, position.z/2)
	if cell_list.has(my_grid_position + Vector2i.RIGHT):
		print("RIGHT")
		eastFace.queue_free()
	if cell_list.has(my_grid_position + Vector2i.LEFT):
		print("LEFT")
		westFace.queue_free()
	if cell_list.has(my_grid_position + Vector2i.DOWN):
		print("DOWN")
		southFace.queue_free()
	if cell_list.has(my_grid_position + Vector2i.UP):
		print("UP")
		northFace.queue_free()
