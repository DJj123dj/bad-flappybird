extends Control


func _ready():
	#animations
	get_node("menu/title/AnimationPlayer").play("menuLogo_animation")
	
	#spacing
	get_node("menu/HBoxContainer").add_theme_constant_override("separation",20)


func _on_playbutton_mousefocus():
	get_node("menu/HBoxContainer/play_button").flip_v = true


func _onplaybutton_mouseunfocus():
	get_node("menu/HBoxContainer/play_button").flip_v = false


func _on_startbutton_press():
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_scorebutton_pressed():
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes/scoreboard.tscn")
