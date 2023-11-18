extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	
	#$polaroid/screenshot.texture = load("res://screenshot.png")
	$polaroid/screenshot.texture = Global.screenshot


	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
