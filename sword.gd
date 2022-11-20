extends Node3D

@onready var melee_anim = get_parent().get_node("AnimationPlayer")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func melee():
	if Input.is_action_just_pressed("attack"):
		if not melee_anim.is_playing():
			melee_anim.play("attack")
			melee_anim.queue("return")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	melee()
