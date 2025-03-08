extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var jump = $Jump
@onready var die = $Die
@onready var timer = $Timer


@onready var camera = $Camera2D
@onready var label = %Label

const SPEED = 150.0
const JUMP_VELOCITY = -330.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionX = Input.get_axis("move_left", "move_right")
	if directionX:
		velocity.x = directionX * SPEED
		animated_sprite.flip_h = velocity.x < 0
	else:
		velocity.x = 0
		
	move_and_slide()
	
func on_player_death():
	animated_sprite.play("die")
	die.play()
	velocity.x = 0
	timer.start()


func _on_timer_timeout():
	queue_free()
	get_tree().reload_current_scene()
