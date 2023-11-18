extends Node2D

var sound_camara: AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	#$gato.add_constant_central_force(Vector2(-10,0))
	#$gato.set_axis_velocity(Vector2(-100,0))
	sound_camara = $AudioStreamPlayer2D
	inicializar_gato()
	inicializar_toro()
	inicializar_rata()
	
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
			var imagen = get_viewport().get_texture()
			var image_data = imagen.get_data()
			var image_path = "res://screenshot.png"
			
			var image = Image.new()
			
			image.create_from_data(imagen.get_width(), imagen.get_height(), false, Image.FORMAT_RGBA8, image_data)
			
		# Guardar la imagen como archivo PNG (puedes ajustar la ruta y el nombre del archivo)
			#var file = File.new()
			#file.open("user://screenshot.png", File.WRITE)
			#image.save_png(file)
			#file.close()
			
			await get_tree().create_timer(0.1).timeout
			if get_node("gato").velocidad == 0:
				get_tree().change_scene_to_file("res://polaroid.tscn")
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

func inicializar_rata():
 # Carga la escena que contiene el RigidBody
	var escena_rata = preload("res://animales/rata.tscn")
	# Instancia la escena
	var rata = escena_rata.instantiate()
	var rata2 = escena_rata.instantiate()
	var rata3 = escena_rata.instantiate()
	# Agrega el RigidBody al nodo actual
	add_child(rata)
	add_child(rata2)
	add_child(rata3)
