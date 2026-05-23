#Item.gd
class_name FallingItem

extends Area2D

enum Type { GEM, BOMB }

@export var type: Type = Type.GEM
@export var speed: float = 350.0
@export var score_value: int = 1

@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	# Configuration based on type
	if type == Type.BOMB:
		modulate = Color.RED # Quick visual indicator without needing assets
		score_value = -5
	else:
		modulate = Color.GREEN

func _physics_process(delta: float) -> void:
	# Constant downward velocity (Firmware-like deterministic update)
	position.y += speed * delta

	# Self-garbage collection if it flies off-screen
	if position.y > 1000:
		queue_free()
