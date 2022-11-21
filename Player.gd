extends Node3D

@onready var timerprocessor: = $Timer
@onready var tween
@onready var forward: = $RayForward
@onready var back: = $RayBack
@onready var right: = $RayRight
@onready var left: = $RayLeft

func collision_check(direction):
	if direction != null:
		print(direction.is_colliding())
		return direction.is_colliding()
	else:
		return false

func get_direction(direction):
	print("direction")
	if not direction is RayCast3D: return
	return direction.get_collider().global_transform.origin - global_transform.origin

func tween_translation(change):
	$AnimationPlayer.play("Step")
	tween = create_tween()
	tween.tween_property(self, "position", self.position + change, 0.5)
	tween.set_ease(tween.EASE_IN_OUT)
	tween.set_trans(tween.TRANS_QUAD)
	tween.play()
	await tween.finished
	if tween.finished:
		$AnimationPlayer.play("idle")

func tween_rotation(change):
	tween = create_tween()
	tween.tween_property(self, "rotation", self.rotation + Vector3(0, change, 0), 0.5)
	tween.set_ease(tween.EASE_IN_OUT)
	tween.set_trans(tween.TRANS_QUAD)
	tween.play()
	await tween.finished


func _on_Timer_timeout() -> void:
	var GO_W := Input.is_action_pressed("forward")
	var GO_S := Input.is_action_pressed("back")
	var GO_A := Input.is_action_pressed("strafe_left")
	var GO_D := Input.is_action_pressed("strafe_right")
	var TURN_Q := Input.is_action_pressed("turn_left")
	var TURN_E := Input.is_action_pressed("turn_right")

	var ray_dir
	var turn_dir = int(TURN_Q) - int(TURN_E)


	if GO_W: 
		ray_dir = forward
	elif GO_S: 
		ray_dir = back
	elif GO_A: 
		ray_dir = left
	elif GO_D: 
		ray_dir = right
	elif turn_dir:
		timerprocessor.stop()
		await tween_rotation(PI/2 * turn_dir) #.completed?
		timerprocessor.start()

	if collision_check(ray_dir):
		timerprocessor.stop()
		await tween_translation(get_direction(ray_dir)) #.completed?
		timerprocessor.start()
