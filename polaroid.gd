extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	
	#$polaroid/screenshot.texture = load("res://screenshot.png")
	var texture = ImageTexture.new()
	texture.create_from_image(Global.screenshot)
	$polaroid/screenshot.texture = texture

	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
