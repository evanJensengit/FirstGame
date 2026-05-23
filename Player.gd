extends Area2D

# Signals to alert the Game Manager
signal item_caught(score_modifier: int)

@export var speed: float = 15.0
var target_x: float = 270.0 # Center of screen default
var screen_width: float = 740.0

#func _ready() -> void:
	# Center the player near the bottom of the screen
	#position = Vector2(270, 850)
	# Connect Godot's built-in collision signal to our own function
	#area_entered.connect(_on_area_entered)

#func _input(event: InputEvent) -> void:
	## Handles both mouse clicks/drags and mobile touch events seamlessly
	#if event is InputEventMouseButton or event is InputEventMouseMotion:
		#target_x = event.position.x
#
func _physics_process(delta: float) -> void:
	# Smoothly interpolate (lerp) toward target input for juicy movement
	global_position = Vector2(270.0, 850.0)
	#position.x = min(max(40, lerp(position.x, target_x, speed * delta)), screen_width - 40)
	
func _on_area_entered(area: Area2D) -> void:
	# Type assertion / Guard clause
	if area is FallingItem:
		item_caught.emit(area.score_value)
		area.queue_free() # Destroy the caught item
