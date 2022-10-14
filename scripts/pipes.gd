extends Node2D


var locationPipe1 = Vector2(1300,350)
onready var pipe1 = get_node("pipe 1")

func _ready():
	while true:
		if locationPipe1.x < -20:
			locationPipe1.x = 1300
		else:
			locationPipe1.x = locationPipe1.x - 2.5
		pipe1.position = locationPipe1
		yield(get_tree().create_timer(0.01),"timeout")
