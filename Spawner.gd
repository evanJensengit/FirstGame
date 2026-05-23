# Spawner.gd
extends Node2D

# Preloading the packed scene into memory for fast instantiation
const ITEM_SCENE = preload("res://Item.tscn")

var screen_width: float = 540.0

func _ready() -> void:
	
	$Timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout() -> void:
	var item = ITEM_SCENE.instantiate() as FallingItem

	# Randomize type: 80% chance of Gem, 20% chance of Bomb
	if randf() > 0.8:
		item.type = FallingItem.Type.BOMB
	else:
		item.type = FallingItem.Type.GEM

	# Randomize horizontal spawn location
	item.position = Vector2(randf_range(40, screen_width - 40), -50)

	# Add the dynamically created instance to the runtime tree
	add_child(item)
