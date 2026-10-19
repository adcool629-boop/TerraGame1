extends Node2D

var direction = 1

@onready var RayCastRight = $RayCastRight
@onready var RayCastLeft = $RayCastLeft
@onready var AnimatedSprite = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if RayCastRight.is_colliding():
		direction = -1
		AnimatedSprite.flip_h = true
	if RayCastLeft.is_colliding():
		direction = 1
		AnimatedSprite.flip_h = false
	position.x += direction * 1
	
	


func _on_animated_sprite_2d_animation_finished() -> void:
	#$AnimatedSprite2D.play()
	pass
