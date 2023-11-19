extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(2).timeout
	$chaparro_sonido.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
