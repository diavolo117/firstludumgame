
extends CharacterBody2D
class_name Player
signal  knockbackb
signal playerdir
signal playerdir2
@onready var animation = $AnimationPlayer
@onready var sprite = $Sprite2D
@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
@onready var hitbox = $hitnox
@onready var damage = 1
@export var jumped = false
@onready var lowbox = $hitboxlow
var test = 2
var dir = 1
var timer1 = 0.9
var isknock = false
var knockback = Vector2()
var dead = false
var timer = 1.5
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var attacking = false
func _process(delta):
	if Input.is_action_just_pressed("attack") && Input.is_action_pressed("down") && !is_on_floor():
		attack2()
	elif Input.is_action_just_pressed("attack"):
		attack()
func  attack():
	attacking = true
	animation.play("attack")
	if isknock == true:
		emit_signal("knockbackb")
		emit_signal("playerdir")
	

		
		
func attack2():
	attacking = true
	animation.play("attack2")
	if jumped == true:
		velocity.y = JUMP_VELOCITY * 0.9
	$hitnox/hit2.disabled = true
	jumped = false
	

func _ready():
	Gameload.player = self

	
func _physics_process(delta):
	var direction := Input.get_axis("left", "right")
	if dead == true:
		velocity.x = 0
		velocity.y = 0
	if Input.is_action_just_pressed("left"):
		sprite.scale.x = abs(sprite.scale.x) * -1
		hitbox.scale.x = abs(sprite.scale.x) * -1
		
	if Input.is_action_just_pressed("right"):
		sprite.scale.x = abs(sprite.scale.x)
		hitbox.scale.x = abs(sprite.scale.x) 
		
	if velocity.y > 0 ||velocity.y < 0:
		direction = direction * 0.7
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if position.y >= 1000:
		ded()
	

	if direction:
		velocity.x = direction * SPEED
		
	else:
		
		velocity.x = move_toward(velocity.x, 0, SPEED)
	

	update_animation()
	move_and_slide()
	
func update_animation():
		if attacking == false && dead == false:
			if velocity.x != 0:
				animation.play("run")
			else: animation.play("idle")
		
			if velocity.y < 0:
				animation.play("jump")
			if velocity.y > 0:
				animation.play("fall")

func ded():
	dead = true
	velocity.x = 0
	velocity.y = 0
	await get_tree().create_timer(1.0).timeout
	$AnimationPlayer.play("death")
	
	Gameload.respawn()


func _on_hitnox_area_entered(area: Area2D):
	if area.is_in_group("Enemies"):
		area.take_damage(damage)
	if Input.is_action_pressed("down") && !is_on_floor() && area.is_in_group("Enemies"):
		velocity.y = JUMP_VELOCITY * 0.9
