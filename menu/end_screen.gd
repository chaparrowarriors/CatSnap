extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Puntuacion.text = str(Global.puntuacion).pad_decimals(2)
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
	get_tree().change_scene_to_file("res://menu/menu.tscn")


func _on_jugar_pressed():
	Global.nivel = 1
	Global.gatovelocidad = Global.gatovelocidadbase
	Global.puntuacion = 0
	get_tree().change_scene_to_file("res://main.tscn")
