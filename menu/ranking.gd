extends Node2D

# Cargar el archivo JSON
var archivo = "res://ranking.json"
#var datos_json = FileAccess.new.call()



# Called when the node enters the scene tree for the first time.
func _ready():
	# Leer el contenido JSON
	var contenido = FileAccess.open(archivo, FileAccess.READ)
	
	var json_string = contenido.get_line()
	var json = JSON.new()
		
	var datos = json.parse(json_string)
	
	$Jugador1_name.text = json.get_data()["1"]["nombre"]
	$Jugador2_name.text = json.get_data()["2"]["nombre"]
	$Jugador3_name.text = json.get_data()["3"]["nombre"]
	$Jugador4_name.text = json.get_data()["4"]["nombre"]
	$Jugador5_name.text = json.get_data()["5"]["nombre"]
	$Jugador6_name.text = json.get_data()["6"]["nombre"]
	$Jugador7_name.text = json.get_data()["7"]["nombre"]
	$Jugador8_name.text = json.get_data()["8"]["nombre"]
	$Jugador9_name.text = json.get_data()["9"]["nombre"]
	$Jugador10_name.text = json.get_data()["10"]["nombre"]
	
	$jugador1_puntos.text = str(json.get_data()["1"]["value"])
	$jugador2_puntos.text = str(json.get_data()["2"]["value"])
	$jugador3_puntos.text = str(json.get_data()["3"]["value"])
	$jugador4_puntos.text = str(json.get_data()["4"]["value"])
	$jugador5_puntos.text = str(json.get_data()["5"]["value"])
	$jugador6_puntos.text = str(json.get_data()["6"]["value"])
	$jugador7_puntos.text = str(json.get_data()["7"]["value"])
	$jugador8_puntos.text = str(json.get_data()["8"]["value"])
	$jugador9_puntos.text = str(json.get_data()["9"]["value"])
	$jugador10_puntos.text = str(json.get_data()["10"]["value"])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_volver_pressed():
	get_tree().change_scene_to_file("res://menu/menu.tscn")
