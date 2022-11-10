extends KinematicBody2D

export var velocity = Vector2()
var trans = Transform()
export var speed = 100

var MoveX = false
var IsAtack = false

func _physics_process(delta):
	Move()
	Anim()
	move_and_slide(velocity)
	
func Move():
	if Input.get_axis("move_forward","move_backward")!=0: 
		MoveX = true
	else:
		MoveX = false
		velocity.x = 0
	if MoveX == true:
		velocity.x = Input.get_axis("move_forward","move_backward") * -speed
		if Input.get_axis("move_forward","move_backward") == 1:
			$AnimatedSprite.flip_h = true
		else:
			$AnimatedSprite.flip_h = false
func Anim():
	if MoveX == true:
		$AnimatedSprite.play("walk")
	elif !IsAtack:
		$AnimatedSprite.play("idle")
