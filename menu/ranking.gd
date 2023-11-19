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
	# Acceder a los datos
	#var nombre = datos["nombre"]
	#var edad = datos["edad"]
	#var trabajo = datos["trabajo"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_volver_pressed():
	get_tree().change_scene_to_file("res://menu/menu.tscn")
