extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	
	$polaroid/screenshot.texture = ImageTexture.create_from_image(Global.screenshot)

	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
