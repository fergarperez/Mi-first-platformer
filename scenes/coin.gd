extends Area2D
@onready var animation_player = $AnimationPlayer
@onready var game_manager = %GameManager


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print("1+ coin")
	game_manager.add_point()
	animation_player.play("pickup")
