extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.nivel = 1
	Global.velocidadactual = 0
	
	$Puntuacion.text = str(Global.puntuacion).pad_decimals(2)
	Global.puntuacion = 0
	
	if Global.victoria:
		$sonido_victoria.play()
	else:
		$sonido_derrota.play()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_salir_pressed():
	get_tree().quit()


func _on_menu_pressed():
	if Global.victoria:
		get_tree().change_scene_to_file("res://creditos.tscn")
	else:
		get_tree().change_scene_to_file("res://menu/menu.tscn")


func _on_jugar_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
