extends Node2D

var score = 0
@onready var label = $Label

func add_point():
	score += 1
	label.text = "Score: " + str(score)
