extends Control
var savedic = {}
var newsavedic = {}
var puntuacionstored = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.nivel = 1
	Global.velocidadactual = 200
	
	$Puntuacion.text = str(Global.puntuacion).pad_decimals(2)
	puntuacionstored = Global.puntuacion
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


func _on_button_pressed():
	save_game()
	get_tree().change_scene_to_file("res://menu/menu.tscn")

func save_game():
	# Abrimos el Fichero
	var contenido = FileAccess.open(Global.ranking, FileAccess.READ)
	var json_string = ""
	var json = JSON.new()
	if contenido.get_length() > 0:
		json_string = contenido.get_line()
		json.parse(json_string)
		savedic = json.get_data()
		var x = 1
#		print(savedic)
#		print(savedic[str(x)])
		for indice in range(9):
			if savedic.has(str(indice+1)):
				print(savedic[str(indice+1)])
#		for key in savedic:
#			newsavedic[key] = {}
#			if savedic[key]["value"] > puntuacionstored:
#				newsavedic[key]["nombre"] = savedic[key]["nombre"]
#				newsavedic[key]["value"] = savedic[key]["value"]
	else:
		contenido = FileAccess.open(Global.ranking, FileAccess.WRITE)
		savedic["1"] = {}
		savedic["1"]["nombre"] = $VBoxContainer/TextEdit.text
		savedic["1"]["value"] = snappedf(puntuacionstored, 0.01)
		json_string = JSON.stringify(savedic)
		contenido.store_line(json_string)
	print(savedic)
		
	
