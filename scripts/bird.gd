extends Sprite


func _ready():
	get_node("birdFlap").play("birdFlap")


func _on_touchPipe(area):
	print("Touched pipe!")
	print(area.name)
