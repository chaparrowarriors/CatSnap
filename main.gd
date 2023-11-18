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
# Capturamos la ventana al hacer click
	# Obtiene la imagen de la pantalla
			Global.screenshot = get_viewport().get_texture().get_image()

			# Guarda la imagen como un archivo PNG (puedes ajustar la ruta y el nombre del archivo)
			#var file = FileAccess.open("res://screenshot.png", FileAccess.WRITE)

			#screenshot.save_png("res://screenshot.png")
			
			#file.close()
			#var imagen = get_viewport().get_texture()
			#var image_data = imagen.get_image()
			
			#var image = Image.new()
			
			#image.create_from_data(imagen.get_width(), imagen.get_height(), false, Image.FORMAT_RGBA8, image_data)
			
		# Guardar la imagen como archivo PNG (puedes ajustar la ruta y el nombre del archivo)
			#if not FileAccess.file_exists("user://savegame.save"):
			#	FileAccess.open("user://polaroid.save", FileAccess.WRITE)
				
			#var file = FileAccess.open("user://polaroid.save", FileAccess.WRITE)
			
			#file.open("user://polaroid.save", FileAccess.WRITE)
			#image_data.save_png(file)
			#file.close()
			
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
