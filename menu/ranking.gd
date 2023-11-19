extends Node2D

# Cargar el archivo JSON
#var archivo = "user://ranking.json"
#var datos_json = FileAccess.new.call()



# Called when the node enters the scene tree for the first time.
func _ready():
	# Leer el contenido JSON
	var contenido = FileAccess.open(Global.ranking, FileAccess.READ)
	if contenido.get_length() > 0:
		var json_string = contenido.get_line()
		var json = JSON.new()
			
		var datos = json.parse(json_string)
		if json.get_data().has("1"):
			$Jugador1_name.visible = true
			$Jugador1_name.text = json.get_data()["1"]["nombre"]
		if json.get_data().has("2"):
			$Jugador2_name.visible = true
			$Jugador2_name.text = json.get_data()["2"]["nombre"]
		if json.get_data().has("3"):
			$Jugador3_name.visible = true
			$Jugador3_name.text = json.get_data()["3"]["nombre"]
		if json.get_data().has("4"):
			$Jugador4_name.visible = true
			$Jugador4_name.text = json.get_data()["4"]["nombre"]
		if json.get_data().has("5"):
			$Jugador5_name.visible = true
			$Jugador5_name.text = json.get_data()["5"]["nombre"]
		if json.get_data().has("6"):
			$Jugador6_name.visible = true
			$Jugador6_name.text = json.get_data()["6"]["nombre"]
		if json.get_data().has("7"):
			$Jugador7_name.visible = true
			$Jugador7_name.text = json.get_data()["7"]["nombre"]
		if json.get_data().has("8"):
			$Jugador8_name.visible = true
			$Jugador8_name.text = json.get_data()["8"]["nombre"]
		if json.get_data().has("9"):
			$Jugador9_name.visible = true
			$Jugador9_name.text = json.get_data()["9"]["nombre"]
		if json.get_data().has("10"):
			$Jugador10_name.visible = true
			$Jugador10_name.text = json.get_data()["10"]["nombre"]
		
		if json.get_data().has("1"):
			$jugador1_puntos.visible = true
			$jugador1_puntos.text = str(json.get_data()["1"]["value"])
		if json.get_data().has("2"):
			$jugador2_puntos.visible = true
			$jugador2_puntos.text = str(json.get_data()["2"]["value"])
		if json.get_data().has("3"):
			$jugador3_puntos.visible = true
			$jugador3_puntos.text = str(json.get_data()["3"]["value"])
		if json.get_data().has("4"):
			$jugador4_puntos.visible = true
			$jugador4_puntos.text = str(json.get_data()["4"]["value"])
		if json.get_data().has("5"):
			$jugador5_puntos.visible = true
			$jugador5_puntos.text = str(json.get_data()["5"]["value"])
		if json.get_data().has("6"):
			$jugador6_puntos.visible = true
			$jugador6_puntos.text = str(json.get_data()["6"]["value"])
		if json.get_data().has("7"):
			$jugador7_puntos.visible = true
			$jugador7_puntos.text = str(json.get_data()["7"]["value"])
		if json.get_data().has("8"):
			$jugador8_puntos.visible = true
			$jugador8_puntos.text = str(json.get_data()["8"]["value"])
		if json.get_data().has("9"):
			$jugador9_puntos.visible = true
			$jugador9_puntos.text = str(json.get_data()["9"]["value"])
		if json.get_data().has("10"):
			$jugador10_puntos.visible = true
			$jugador10_puntos.text = str(json.get_data()["10"]["value"])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_volver_pressed():
	get_tree().change_scene_to_file("res://menu/menu.tscn")
