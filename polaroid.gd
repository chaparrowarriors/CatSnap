extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$sonido_camara.play()
	$polaroid/screenshot.texture = ImageTexture.create_from_image(Global.screenshot)
	$puntuacion_value.text = str(Global.puntos).pad_decimals(2)
	$puntuation/valuecontainer/base_value.text = str(Global.puntos_base)
	$puntuation/valuecontainer/time_value.text = str(Global.tiempo).pad_decimals(2)
	$puntuation/valuecontainer/level_value.text = str(Global.nivel)
	$VBoxContainer/puntuacioncontainer/puntuacion_value.text = str(Global.puntuacion).pad_decimals(2)
	# Desglose de la puntuacion del nivel
	$puntuacion_desglose/desglosecontainer/puntuacion_valores.text = "100"+"    /" + str(Global.tiempo).pad_decimals(2)+"    *" + str(Global.nivel) + " = "+str(Global.puntos).pad_decimals(2)

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	Global.nivel += 1
	Global.velocidadactual = Global.velocidadactual + Global.nivel * 35
	get_tree().change_scene_to_file("res://main.tscn")
	pass # Replace with function body.
