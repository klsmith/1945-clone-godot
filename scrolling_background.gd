extends ParallaxBackground

@export var scroll_speed: float = 100;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_offset.y += scroll_speed * delta;
