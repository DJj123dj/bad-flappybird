extends Node2D

onready var pipe1 = get_node("pipe 1")
onready var pipe2 = get_node("pipe 2")
onready var pipe3 = get_node("pipe 3")
onready var pipe4 = get_node("pipe 4")
onready var pipe5 = get_node("pipe 5")
onready var pipe6 = get_node("pipe 6")

var resetPipeDistance = 200

func _ready():
	
	#pipe location
	var rng = RandomNumberGenerator.new()
	var rngS = 200
	var rngE = 450
	rng.randomize()

	var locationPipe1 = Vector2(1300,350)
	var locationPipe2 = Vector2(1550,round(rng.randf_range(rngS,rngE)))
	var locationPipe3 = Vector2(1800,round(rng.randf_range(rngS,rngE)))
	var locationPipe4 = Vector2(2050,round(rng.randf_range(rngS,rngE)))
	var locationPipe5 = Vector2(2300,round(rng.randf_range(rngS,rngE)))
	var locationPipe6 = Vector2(2550,round(rng.randf_range(rngS,rngE)))
	
	print(round(rng.randf_range(rngS,rngE)))
	
	var bird = get_node("../bird")
	while bird.isGameRunning:
		var isPaused = get_node("/root/main/pauseButton").isPaused
		
		if not isPaused:
			
			#pipe1
			if locationPipe1.x < -resetPipeDistance:
				locationPipe1.x = 1300
				locationPipe1.y = rng.randf_range(rngS,rngE)
			else:
				locationPipe1.x = locationPipe1.x - 2.55
			pipe1.position = locationPipe1
			
			#pipe2
			if locationPipe2.x < -resetPipeDistance:
				locationPipe2.x = 1300
				locationPipe2.y = rng.randf_range(rngS,rngE)
			else:
				locationPipe2.x = locationPipe2.x - 2.55
			pipe2.position = locationPipe2
			
			#pipe3
			if locationPipe3.x < -resetPipeDistance:
				locationPipe3.x = 1300
				locationPipe3.y = rng.randf_range(rngS,rngE)
			else:
				locationPipe3.x = locationPipe3.x - 2.55
			pipe3.position = locationPipe3
			
			#pipe4
			if locationPipe4.x < -resetPipeDistance:
				locationPipe4.x = 1300
				locationPipe4.y = rng.randf_range(rngS,rngE)
			else:
				locationPipe4.x = locationPipe4.x - 2.55
			pipe4.position = locationPipe4
			
			#pipe5
			if locationPipe5.x < -resetPipeDistance:
				locationPipe5.x = 1300
				locationPipe5.y = rng.randf_range(rngS,rngE)
			else:
				locationPipe5.x = locationPipe5.x - 2.55
			pipe5.position = locationPipe5
			
			#pipe6
			if locationPipe6.x < -resetPipeDistance:
				locationPipe6.x = 1300
				locationPipe6.y = rng.randf_range(rngS,rngE)
			else:
				locationPipe6.x = locationPipe6.x - 2.55
			pipe6.position = locationPipe6
			
		yield(get_tree().create_timer(0.01),"timeout")
