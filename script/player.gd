extends CharacterBody2D

const PlayerState = preload("res://script/player_state.gd")

const SPEED = 30.0

var movement_state = PlayerState.MovementState.IDLE
var attack_state = null
var crawl_state = null

@onready var anim_sprite = $AnimatedSprite2D

func _physics_process(_delta: float) -> void:

	if attack_state == null:
		handle_movement_input()
	else:
		velocity.x = 0
		velocity.y = 0

	handle_attack_input()
	update_animation() 

	move_and_slide()

func handle_movement_input() -> void:

	var direction_x := Input.get_axis("ui_left", "ui_right")
	var direction_y := Input.get_axis("ui_up", "ui_down") 

	velocity.x = direction_x * SPEED
	velocity.y = direction_y * SPEED   

	if velocity.length() > SPEED:
		velocity = velocity.normalized() * SPEED
		

	if direction_x < 0:
		movement_state = PlayerState.MovementState.MOVING_LEFT
	elif direction_x > 0:
		movement_state = PlayerState.MovementState.MOVING_RIGHT
	elif direction_y < 0: 
		movement_state = PlayerState.MovementState.MOVING_UP
	elif direction_y > 0: 
		movement_state = PlayerState.MovementState.MOVING_DOWN
	else:
		movement_state = PlayerState.MovementState.IDLE


func update_animation() -> void:
	var anim_name = "" 

	if attack_state != null:
		anim_name = PlayerState.ANIMATIONS["attack"][attack_state]
	
	else:
		anim_name = PlayerState.ANIMATIONS["movement"][movement_state]

	if anim_sprite.animation != anim_name:
		anim_sprite.play(anim_name)

func handle_attack_input() -> void:

	if attack_state == null and Input.is_action_just_pressed("ui_attack"):
		
		match movement_state:
			PlayerState.MovementState.MOVING_UP:
				attack_state = PlayerState.AttackState.ATTACK_UP
			PlayerState.MovementState.MOVING_LEFT:
				attack_state = PlayerState.AttackState.ATTACK_LEFT
			PlayerState.MovementState.MOVING_RIGHT:
				attack_state = PlayerState.AttackState.ATTACK_RIGHT
			_: 
				attack_state = PlayerState.AttackState.ATTACK_DOWN
				
func _on_animation_finished():
	
	if attack_state != null:
		attack_state = null
		
func _ready():
	anim_sprite.animation_finished.connect(_on_animation_finished)
