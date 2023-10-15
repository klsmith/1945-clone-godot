extends CharacterBody2D

# This is configurable in the editor
@export var speed: int = 400;
@export var bullet_scene: PackedScene;

@onready var shoot_timer := $ShootTimer as Timer;

var _fire_button: bool = false;
var _can_shoot: bool = true;

# Similar to Game Maker's "Create" event
# Called when the node enters the scene tree for the first time.
func _ready():
	motion_mode = MOTION_MODE_FLOATING
	shoot_timer.timeout.connect(on_shoot_timer)

func on_shoot_timer():
	_can_shoot = true

# Similar to Game Maker's "Step" event
func _physics_process(delta):
	var input = Input.get_vector(
		"player_left",
		"player_right",
		"player_up",
		"player_down"
	)
	velocity = input * speed
	move_and_slide()
	if _fire_button: fire_bullet()

# Similar to Game Maker's "Draw" event
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass # not doing anything, I just wanted to explain it
	

# Not really similar to Game Maker...
# Any unhandled input events will be picked up by objects that inplement this.
# The regular _input(event) method is often used by GUI and then game objects
# use _unhandled_input(event) in order to let the GUI code have first dibs
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit() # ESC => Quit Game
	if event.is_action_pressed("player_shoot"):
		_fire_button = true
	if event.is_action_released("player_shoot"):
		_fire_button = false

func fire_bullet():
	if not _can_shoot: return
	var bullet = bullet_scene.instantiate()
	get_parent().add_child(bullet)
	bullet.global_position = self.global_position
	_can_shoot = false
	shoot_timer.start()
