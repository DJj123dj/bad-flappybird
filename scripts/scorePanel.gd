extends Sprite2D

var defaultPath = "res://images/smallLetters/"
@onready var t1 = load(defaultPath+"1.png")
@onready var t2 = load(defaultPath+"2.png")
@onready var t3 = load(defaultPath+"3.png")
@onready var t4 = load(defaultPath+"4.png")
@onready var t5 = load(defaultPath+"5.png")
@onready var t6 = load(defaultPath+"6.png")
@onready var t7 = load(defaultPath+"7.png")
@onready var t8 = load(defaultPath+"8.png")
@onready var t9 = load(defaultPath+"9.png")
@onready var t0 = load(defaultPath+"0.png")

func _ready():
	await get_tree().create_timer(1).timeout
	$AnimationPlayer.play("showPanel")
	var score = GameOverStorage.score
	var highScore = GameOverStorage.highScore
	
	scoreCounter(0)
	highscoreCounter(0)
	
	await get_tree().create_timer(2).timeout
	
	var currentHighscore = 0
	var currentScore = 0
	#add score
	var countSpeed = 0.02
	while currentHighscore < highScore:
		currentHighscore = currentHighscore+1
		if currentScore < score:
			currentScore = currentScore+1
		scoreCounter(currentScore)
		highscoreCounter(currentHighscore)
		await get_tree().create_timer(countSpeed).timeout
		countSpeed = countSpeed + 0.005
		
		
	#NEW HIGHSCORE
	if GameOverStorage.newHighScore:
		GameOverStorage.newHighScore = false
		$newHighscore/AnimationPlayer.play("fadeIn")
		await get_tree().create_timer(1).timeout
		$newHighscore/AnimationPlayer.play("bounce")
	
	#MEDAL
	if score >= 100:
		var medalTexture = load("res://images/medals/platina.png")
		$medal.texture = medalTexture
	elif score >= 60:
		var medalTexture = load("res://images/medals/gold.png")
		$medal.texture = medalTexture
	elif score >= 30:
		var medalTexture = load("res://images/medals/silver.png")
		$medal.texture = medalTexture
	elif score >= 10:
		var medalTexture = load("res://images/medals/bronze.png")
		$medal.texture = medalTexture
	else:
		var medalTexture = load("res://images/medals/bronze.png")
		$medal.texture = medalTexture
		
	if score >= 10:
		$medal/AnimationPlayer.play("medal")
	
func scoreCounter(points: float):
	var digit1 = get_node("scoreCounter/digit1")
	var digit2 = get_node("scoreCounter/digit2")
	
	var pointString = String(points)
		
	if pointString.length() > 1:
		var score10 = float(pointString[0])
		var score1 = float(pointString[1])
		
		#DIGIT 1
		if score10 == 0:
			digit1.texture = t0
		elif score10 == 1:
			digit1.texture = t1
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
			digit2.texture = t1
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
			digit2.texture = t1
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



func highscoreCounter(points: float):
	var digit1 = get_node("highscoreCounter/digit1")
	var digit2 = get_node("highscoreCounter/digit2")
	
	var pointString = String(points)
		
	if pointString.length() > 1:
		var score10 = float(pointString[0])
		var score1 = float(pointString[1])
		
		#DIGIT 1
		if score10 == 0:
			digit1.texture = t0
		elif score10 == 1:
			digit1.texture = t1
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
			digit2.texture = t1
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
			digit2.texture = t1
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
