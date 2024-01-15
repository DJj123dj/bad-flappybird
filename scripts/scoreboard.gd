extends Control


@export var points = 0

func _on_touch(area):
	var name = area.name
	var bird = get_node("/root/main/bird")
	if name.begins_with("pointCheck"):
		if bird.isGameRunning:
			points = points + 1
			if GameOverStorage.soundEnabled:
				$Point.play()
			print("points: "+String(points)) 

func _ready():
	var bird = get_node("/root/main/bird")
	var digit1 = get_node("digit1")
	var digit2 = get_node("digit2")
	var defaultPath = "res://images/letters/"
	
	#nr1
	var tRight1 = load(defaultPath+"1_right.png")
	var tLeft1 = load(defaultPath+"1_left.png")
	#nr2
	var t2 = load(defaultPath+"2.png")
	#nr3
	var t3 = load(defaultPath+"3.png")
	#nr4
	var t4 = load(defaultPath+"4.png")
	#nr5
	var t5 = load(defaultPath+"5.png")
	#nr6
	var t6 = load(defaultPath+"6.png")
	#nr7
	var t7 = load(defaultPath+"7.png")
	#nr8
	var t8 = load(defaultPath+"8.png")
	#nr9
	var t9 = load(defaultPath+"9.png")
	#nr0
	var t0 = load(defaultPath+"0.png")
	
	#script
	while bird.isGameRunning:
		await get_tree().create_timer(0.1).timeout
		var pointString = String(points)
		
		if pointString.length() > 1:
			var score10 = float(pointString[0])
			var score1 = float(pointString[1])
			
			#DIGIT 1
			if score10 == 0:
				digit1.texture = t0
			elif score10 == 1:
				digit1.texture = tRight1
			elif score10 == 2:
				digit1.texture = t2
			elif score10 == 3:
				digit1.texture = t3
			elif score10 == 4:
				digit1.texture = t4
			elif score10 == 5:
				digit1.texture = t5
			elif score10 == 6:
				digit1.texture = t6
			elif score10 == 7:
				digit1.texture = t7
			elif score10 == 8:
				digit1.texture = t8
			elif score10 == 9:
				digit1.texture = t9
				
			#DIGIT 2
			if score1 == 0:
				digit2.texture = t0
			elif score1 == 1:
				digit2.texture = tLeft1
			elif score1 == 2:
				digit2.texture = t2
			elif score1 == 3:
				digit2.texture = t3
			elif score1 == 4:
				digit2.texture = t4
			elif score1 == 5:
				digit2.texture = t5
			elif score1 == 6:
				digit2.texture = t6
			elif score1 == 7:
				digit2.texture = t7
			elif score1 == 8:
				digit2.texture = t8
			elif score1 == 9:
				digit2.texture = t9
			
		else:
			var score1 =  float(pointString[0])
			
			#DIGIT 1
			digit1.texture = t0
			
			#DIGIT 2
			if score1 == 0:
				digit2.texture = t0
			elif score1 == 1:
				digit2.texture = tLeft1
			elif score1 == 2:
				digit2.texture = t2
			elif score1 == 3:
				digit2.texture = t3
			elif score1 == 4:
				digit2.texture = t4
			elif score1 == 5:
				digit2.texture = t5
			elif score1 == 6:
				digit2.texture = t6
			elif score1 == 7:
				digit2.texture = t7
			elif score1 == 8:
				digit2.texture = t8
			elif score1 == 9:
				digit2.texture = t9
	
	var beforeScore = GameOverStorage.score
	GameOverStorage.score = points
	if beforeScore < points:
		GameOverStorage.highScore = points
		GameOverStorage.newHighScore = true
