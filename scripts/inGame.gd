extends Node


var location = Vector2(0,0)
onready var background = get_node("background")
onready var ground = get_node("ground")
# Called when the node enters the scene tree for the first time.
func _ready():
	while true:
		location.x = location.x + 1.3
		background.region_rect.position = location
		ground.region_rect.position = location
		yield(get_tree().create_timer(0.01),"timeout")
