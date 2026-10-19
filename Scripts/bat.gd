extends Node2D
@export var FlipTime: float = 1.0
@export var Speed: float = 100.0
var Direction: float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$FlipTimer.wait_time = FlipTime
	$FlipTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += Direction * Speed * delta


func _on_flip_timer_timeout() -> void:
	Direction *= -1.0
	$AnimatedSprite2D.flip_h = !$AnimatedSprite2D.flip_h
