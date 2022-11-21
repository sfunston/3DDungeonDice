extends Camera2D

var rate = 8
var cutoff = 4

@onready var player = get_node("../Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dest = player.global_position
	var x = lerp(position.x, dest.x, rate * delta)
	var y = lerp(position.y, dest.y, rate * delta)
	var pos = Vector2(x,y)
	if pos.distance_to(dest) > cutoff:
		position = pos
