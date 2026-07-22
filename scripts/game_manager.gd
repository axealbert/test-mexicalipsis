extends Node

var score = 0
var key = 0
@onready var score_label = $Label

func add_point():
	score+=1
	score_label.text = "You collected " + str(score) + " coins and " + str(key) + " keys."
	
func add_key_point():
	key+=1
	score_label.text = "You colected " + str(score) + " coins and " + str(key) + " keys."

func get_coins():
	return score

func get_keys():
	return key
