extends KinematicBody2D

var motion = Vector2()
const UP = Vector2(0,-1)
const SPEED = 400
const JUMP_FORCE = -800
const GRAVITY = 40

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	motion.y += GRAVITY#adds gravity
	
	if Input.is_action_pressed("ui_left"):
		motion.x = -SPEED#moves left
	elif Input.is_action_pressed("ui_right"):
		motion.x = SPEED#moves right
	else:
		motion.x = 0#no input, no motion
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_FORCE#jumps if you're on the floor and the button is pressed
	#if Input.is_action_pressed("ui_down"):
		#crouch time
		
	motion = move_and_slide(motion, UP)#applies motion and zeros the motion variable
