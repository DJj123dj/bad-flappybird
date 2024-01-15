extends CanvasLayer

var Gtarget = ""

func switchScene(target:String):
	var ap = get_node("ColorRect/AnimationPlayer")
	ap.play("fadeIn")
	Gtarget = target


func _on_finished(anim_name):
	var ap = get_node("ColorRect/AnimationPlayer")
	if (anim_name == "fadeIn"):
		var target = Gtarget
		get_tree().change_scene_to_file("res://scenes/"+target+".tscn")
		ap.play("fadeOut")
