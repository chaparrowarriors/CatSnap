extends Node2D

var sound_camara: AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	#$gato.add_constant_central_force(Vector2(-10,0))
	#$gato.set_axis_velocity(Vector2(-100,0))
	sound_camara = $AudioStreamPlayer2D
	inicializar_gato()
	inicializar_toro()
	
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
# Capturamos la ventana al hacer click
			var imagen = get_viewport().get_texture().get_image()
			await get_tree().create_timer(0.1).timeout
			if get_node("gato").velocidad == 0:
				pass
			else:
				get_tree().change_scene_to_file("res://menu/end_screen.tscn") 
				
			



# Utiliza get_node_at_position para obtener el nodo en esa posición
			#var clicked_node = get_node_at_position(click_position)
				
func inicializar_gato():
 # Carga la escena que contiene el RigidBody
	var escena_gato = preload("res://animales/gato.tscn")
	# Instancia la escena
	var gato = escena_gato.instantiate()
	# Agrega el RigidBody al nodo actual
	add_child(gato)
	

func inicializar_toro():
 # Carga la escena que contiene el RigidBody
	var escena_toro = preload("res://animales/toro.tscn")
	# Instancia la escena
	var toro = escena_toro.instantiate()
	# Agrega el RigidBody al nodo actual
	add_child(toro)

