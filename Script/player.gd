extends CharacterBody2D

var target_velocity : Vector2;
var gravity : int;
@onready var animation_player : AnimationPlayer = $AnimationPlayer;
# Called when the node enters the scene tree for the first time.
func _ready():
	gravity= ProjectSettings.get_setting("physics/2d/default_gravity") * 3;
	
func  _physics_process(delta):
	if Input.is_action_pressed("move_right"):
		target_velocity.x = 600.0;
	elif Input.is_action_pressed("move_left"):
		target_velocity.x = -600.0;
	if not is_on_floor():
		target_velocity.y = velocity.y;
		target_velocity.y += gravity * delta;
	velocity = target_velocity;
	move_and_slide();
	target_velocity = Vector2.ZERO;

func _input(event):
	if event.is_action_pressed("jump"):
		target_velocity.y = -900.0;
	elif event.is_action_pressed("play_animation_a") and animation_player.has_animation_library("current"):
		animation_player.play("current/A");
	elif event.is_action_pressed("play_animation_b")and animation_player.has_animation_library("current"):
		animation_player.play("current/B");
