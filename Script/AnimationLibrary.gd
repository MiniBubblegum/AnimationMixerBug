extends Area2D

@export var animation_library : AnimationLibrary;

func _on_body_entered(body: Node2D):
	if body.is_in_group("Player"):
		sendAnimationLibrary(body);

func sendAnimationLibrary(player: Node2D):
	var animation_player: AnimationPlayer = player.get_node("AnimationPlayer");
	if animation_player.has_animation_library("current"):
		animation_player.remove_animation_library("current");
	animation_player.add_animation_library("current", animation_library);
