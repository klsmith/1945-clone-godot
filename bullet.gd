extends Node2D

class_name Bullet

@export var speed: int = 600;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	translate(Vector2.UP * (speed * delta));


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
