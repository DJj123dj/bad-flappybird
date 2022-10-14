extends Control


func _ready():
	#animations
	var logoAnimation = get_node("menu/title/AnimationPlayer").play("menuLogo_animation")
	
	#spacing
	get_node("menu/HBoxContainer").add_constant_override("separation",20)


func _on_playbutton_mousefocus():
	get_node("menu/HBoxContainer/play_button").flip_v = true


func _onplaybutton_mouseunfocus():
	get_node("menu/HBoxContainer/play_button").flip_v = false


func _on_startbutton_press():
	get_node("menu/HBoxContainer/play_button").flip_v = true
	
	yield(get_tree().create_timer(0.5),"timeout")
	
	get_node("menu/HBoxContainer/play_button").flip_v = false
	get_tree().change_scene("res://scenes/main.tscn")
