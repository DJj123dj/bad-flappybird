extends Node


var location = Vector2(0,0)
var bgLocation = Vector2(0,0)
@onready var background = get_node("background")
@onready var ground = get_node("ground")
# Called when the node enters the scene tree for the first time.
func _ready():
	var bird = get_node("bird")
	
	#timer
	get_node("timer/AnimationPlayer").play("TimerAnimation")
	
	
	while bird.isGameRunning:
		var isPaused = get_node("/root/main/pauseButton").isPaused
		if not isPaused:
			location.x = location.x + 1.3
			bgLocation.x = bgLocation.x + 1.6
			background.region_rect.position = bgLocation
			ground.region_rect.position = location
		await get_tree().create_timer(0.01).timeout
		
	await get_tree().create_timer(1.8).timeout
	TransitionScene.switchScene("GameOverPanel")
