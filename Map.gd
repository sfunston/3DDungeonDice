extends Node2D

@onready var player = get_node("/root/Player")
@onready var map = get_node("MapCreator")
func get_tilemap():
	return find_child("MapCreator")
