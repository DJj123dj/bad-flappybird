extends TextureButton

func _ready():
	pass

func _on_menubutton_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
