extends Node2D

export var score = 0
export var highScore = 0

func _ready():
	$gameOver.visible = true
	$buttonContainer.visible = true
	$buttonContainer.add_constant_override("separation",20)
	
	yield(get_tree().create_timer(0.5),"timeout")
	$gameOver/AnimationPlayer.play("gameOverAnimation")
	$buttonContainer/AnimationPlayer.play("buttonAnimation")


func _on_menuButton_pressed():
	TransitionScene.switchScene("menu")


func _on_restartButton_pressed():
	TransitionScene.switchScene("main")
