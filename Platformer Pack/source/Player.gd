extends KinematicBody2D
const speed = 200
const jumpforce = 200
const up = Vector2.UP
var velocity = Vector2()
const gravity = 9.8
const max_fallspeed = 10
onready var anim = $AnimationPlayer
onready var raycast = $RayCast2D

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = speed
		anim.play("right")
	elif Input.is_action_pressed("left"):
		velocity.x = -speed
		anim.play("left")
	velocity.x *= 0.9
	if Input.is_action_just_pressed("jump") && raycast.is_colliding():
		velocity.y = -jumpforce
	else:
		apply_gravity()
	move()

func move():
	velocity = move_and_slide(velocity, up)
func apply_gravity():
	velocity.y += gravity
	if gravity >  max_fallspeed:
		velocity.y = max_fallspeed


