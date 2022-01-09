extends KinematicBody2D


const UP = Vector2(0, -1)
const GRAVITY = 9.8
var velocity = Vector2()
const SPEED = 80
var direction = 1

func _physics_process(delta):
	velocity.x = SPEED * direction
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity, UP)
	
	if direction == 1:
		$AnimationPlayer.play("right")
	
	if is_on_wall():
		direction = direction * -1
		$AnimationPlayer.play("left")
