# Main.gd
extends Node

var score: int = 0

@onready var score_label: Label = $UI/ScoreLabel
@onready var player: Area2D = $Player

func _ready() -> void:
	# Standardizing the event-driven hooks
	player.item_caught.connect(_on_player_item_caught)
	_update_ui()

func _on_player_item_caught(score_modifier: int) -> void:
	score += score_modifier
	# Prevent negative scores
	if score < 0: score = 0 
	_update_ui()

func _update_ui() -> void:
	score_label.text = "Score: %d" % score
