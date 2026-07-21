extends Node

var score = 0
var key = 0
@onready var score_label = $Label

func add_point():
	score+=1
	score_label.text = "You collected " + str(score) + " coins and " + str(key) + " key/s."
