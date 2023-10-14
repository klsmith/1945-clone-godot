extends Node2D

class_name Bullet

@export var speed: int = 600;

@onready var screen_checker := $ScreenChecker as VisibleOnScreenNotifier2D; 

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_checker.screen_exited.connect(on_screen_exit)
	pass # Replace with function body.

func on_screen_exit():
	queue_free() # destroy self

func _physics_process(delta):
	translate(Vector2.UP * (speed * delta));

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
