extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	
	$polaroid/screenshot.texture = ImageTexture.create_from_image(Global.screenshot)
	$puntuacion_value.text = str(Global.puntos).pad_decimals(2)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	Global.nivel += 1
	Global.gatovelocidad = Global.gatovelocidad + Global.nivel * 10
	get_tree().change_scene_to_file("res://main.tscn")
	pass # Replace with function body.
