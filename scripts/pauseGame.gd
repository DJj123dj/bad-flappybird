extends TextureButton

@export var isPaused = false

func _on_togglePause(button_pressed):
	isPaused = button_pressed
	get_node("/root/main/PauseMenu").visible = isPaused
	if isPaused:
		get_node("/root/main/bird/birdFlap").stop(false)
	else:
		get_node("/root/main/bird/birdFlap").play()


func _on_menu_PauseButton():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_resume_PauseButton():
	isPaused = false
	get_node("/root/main/PauseMenu").visible = false
	get_node(".").button_pressed = false
