extends CharacterBody2D

var current_animation : String
var previous_animation : String

@onready var animation_player := $Sprite2D
@export var speed : int = 200

func _ready() -> void :
	current_animation = "idle"
	previous_animation = "default"
	
func handle_animation() :
	if Input.is_action_pressed("move_down") :
		current_animation = "down_walk"
		animation_player.flip_h = false
	elif Input.is_action_pressed("move_up") :
		current_animation = "up_walk"
		animation_player .flip_h= false
	elif Input.is_action_pressed("move_right") :
		current_animation = "side_walk"
		animation_player.flip_h = false
	elif Input.is_action_pressed("move_left") :
		current_animation = "side_walk"
		animation_player.flip_h = true
	else :
		current_animation = "idle"
		animation_player.flip_h = false
	
	if current_animation != previous_animation :
		animation_player.play(current_animation)
	previous_animation = current_animation
	
	
func handle_movement() :
	var velocity := Vector2.ZERO
	if Input.is_action_pressed("move_down") :
		velocity.y +=1
	if Input.is_action_pressed("move_up") :
		velocity.y -=1
	if Input.is_action_pressed("move_right") :
		velocity.x +=1
	if Input.is_action_pressed("move_left") :
		velocity.x -=1
	
	velocity = velocity.normalized()
	velocity = velocity * speed
	return velocity
	
	
func _process(delta: float) -> void:
	handle_animation()
	
func _physics_process(delta: float) -> void:
	velocity = handle_movement()
	move_and_slide()
	

		

		
