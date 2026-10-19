extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$JumpSound.play()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	
	if velocity.x > 0: #Flips the direction the player is facing based on their velocity
		$AnimatedSprite2D.flip_h = false #facing right
	elif velocity.x < 0: 
		$AnimatedSprite2D.flip_h = true #facing left
	
	#play animations
	if is_on_floor():
		if direction == 0 :
			$AnimatedSprite2D.play('Idle')
		else: 
			$AnimatedSprite2D.play('Run')
	else:
		$AnimatedSprite2D.play("Jump")
	
