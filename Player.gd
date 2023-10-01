extends Node2D

# This is configurable in the editor
@export var speed: int = 400;

@export var bullet_scene: PackedScene;

# Similar to Game Maker's "Create" event
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # not doing anything, I just wanted to explain it

# Similar to Game Maker's "Step" event
func _physics_process(delta):
	var input = Input.get_vector(
		"player_left",
		"player_right",
		"player_up",
		"player_down"
	);
	translate(input * (speed * delta));

# Similar to Game Maker's "Draw" event
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass # not doing anything, I just wanted to explain it
	

# Not really similar to Game Maker...
# Any unhandled input events will be picked up by objects that inplement this.
# The regular _input(event) method is often used by GUI and then game objects
# use _unhandled_input(event) in order to let the GUI code have first dibs
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			get_tree().quit(); # ESC => Quit Game
		if event.pressed and !event.is_echo() and event.keycode == KEY_SPACE:
			fire_bullet();

func fire_bullet():
	var bullet = bullet_scene.instantiate();
	get_parent().add_child(bullet);
	bullet.global_position = self.global_position;
