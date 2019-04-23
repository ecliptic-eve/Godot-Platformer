extends KinematicBody2D

var motion = Vector2()
const UP = Vector2(0,-1)
const MAX_SPEED = 400
const ACC = 50
const JUMP_FORCE = -1000
const GRAVITY = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	motion.y += GRAVITY#adds gravity
	var friction = false
	
	if Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACC, -MAX_SPEED)#accelerates to max speed left
	elif Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+ACC, MAX_SPEED)#accelerates to max speed right
	else:
		friction = true
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_FORCE#jumps if you're on the floor and the button is pressed
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)#no input, no motion
	else:
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)#no input, no motion
	#if Input.is_action_pressed("ui_down"):
		#crouch time
		
	motion = move_and_slide(motion, UP)#applies motion and zeros the motion variable
