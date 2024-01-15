extends Sprite2D

@export var isGameRunning = true

var startPos = Vector2(600,400)
var verticalSpeed = 0
@onready var bird = get_node(".")

var wingSoundReady = true

func _ready():
	get_node("birdFlap").play("birdFlap")
	bird.position = startPos
	print(3)
	await get_tree().create_timer(0.8).timeout
	print(2)
	await get_tree().create_timer(0.8).timeout
	print(1)
	await get_tree().create_timer(0.8).timeout
	print("GO!")
	
	_startGame() 
	

func _startGame():
	
	
	while (isGameRunning == true):
		var isPaused = get_node("/root/main/pauseButton").isPaused
		
		if not isPaused:
			#set position & rotation
			if (bird.position.y > 15 or verticalSpeed < 0):
				bird.position.y = bird.position.y - verticalSpeed
			bird.rotation_degrees = -(verticalSpeed*3)
			
			#physics math
			if (Input.is_action_pressed("ui_space",true)):
				verticalSpeed = (abs(verticalSpeed)/4)+5
				if wingSoundReady and GameOverStorage.soundEnabled:
					$WingSound.play()
					wingSoundReady = false
				
			else:
				verticalSpeed = verticalSpeed - 0.35
				wingSoundReady = true
			
			#debug + yield inf. loop
			await get_tree().create_timer(0.01).timeout
		else:
			await get_tree().create_timer(0.1).timeout
		
	
	bird.rotation_degrees = 0
	get_node("birdFlap").stop(false)


func _on_touch(area):
	print("touched "+area.name)
	var areaName = area.name
	if (areaName.begins_with("ground") or areaName.begins_with("pipe")):
		isGameRunning = false
		
		if (not $HitSound.playing) and GameOverStorage.soundEnabled:
			$HitSound.play()
		
		var fallSpeed = 0
		var bonkSpeed = 6
		
		while bird.position.y < 637:
			bird.position.y = bird.position.y + fallSpeed
			fallSpeed = fallSpeed + 0.2
			
			if bonkSpeed > 0:
				bird.position.x = bird.position.x - bonkSpeed
				bonkSpeed = bonkSpeed - 0.2
				
			await get_tree().create_timer(0.01).timeout
		
		if (not $DieSound.playing) and GameOverStorage.soundEnabled:
			$DieSound.play()
		
		bird.position.y = 637
