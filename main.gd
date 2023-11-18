extends Node2D

var sound_camara: AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	#$gato.add_constant_central_force(Vector2(-10,0))
	#$gato.set_axis_velocity(Vector2(-100,0))
	sound_camara = $AudioStreamPlayer2D
	inicializar_animal("gato")
	inicializar_animal("toro")
	inicializar_animal("rata")
	inicializar_animal("rata")
	inicializar_animal("rata")
	inicializar_animal("tigre")
	
	# Conectar la señal del hijo.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var gato_onscreen = get_node("gato")
	if gato_onscreen != null:
		var gato_onworld = gato_onscreen.offworld
		if gato_onscreen.offworld == true:
			get_tree().change_scene_to_file("res://menu/end_screen.tscn") 
			
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			sound_camara.play()		
# Obtén las coordenadas del evento de clic en relación con esta escena
			var click_position = event.position
			
			await get_tree().create_timer(0.1).timeout
			if get_node("gato").velocidad == 0:
				get_tree().change_scene_to_file("res://polaroid.tscn")
			else:
				get_tree().change_scene_to_file("res://menu/end_screen.tscn") 
				
			

func inicializar_animal(animal):
	var path = "res://animales/"+animal+".tscn"
	var escena = load(path)
	var instancia = escena.instantiate()
	add_child(instancia)
