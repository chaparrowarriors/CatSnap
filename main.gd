extends Node2D

var sound_camara: AudioStreamPlayer2D
var time_elapsed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	#$gato.add_constant_central_force(Vector2(-10,0))
	#$gato.set_axis_velocity(Vector2(-100,0))
	time_elapsed = 0
	sound_camara = $sonido_camara
	$"nivel 1".stop()
	$"nivel 2".stop()
	$"nivel 3".stop()
	$"nivel 4".stop()
	$"nivel 5".stop()
	$"nivel 6".stop()
	
	match Global.nivel:
		1:
			$"nivel 1".play()
			nivel1()
		2:
			$"nivel 2".play()
			nivel2()
		3:
			$"nivel 3".play()
			nivel3()
		4:
			$"nivel 4".play()
			nivel4()
		5:
			$"nivel 5".play()
			nivel5()
		6:
			$"nivel 6".play()
			nivel6()
	# Conectar la señal del hijo.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_elapsed += delta
	var gato_onscreen = get_node("gato")
	if gato_onscreen != null:
		var gato_onworld = gato_onscreen.offworld
		if gato_onscreen.offworld == true:
			get_tree().change_scene_to_file("res://menu/end_screen.tscn") 
			
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			#sound_camara.play()
# Obtén las coordenadas del evento de clic en relación con esta escena
			var click_position = event.position
# Capturamos la ventana al hacer click
	# Obtiene la imagen de la pantalla
			var screenshotTemp = get_viewport().get_texture().get_image()
			var viewport_tam = get_viewport_rect().size
			var x_max = viewport_tam.x
			var y_max = viewport_tam.y

			# get_viewport rectangle 100x100 centered on the mouse position
			var pos_x = click_position.x - 182
			var pos_y = click_position.y - 182
			if pos_x < 0:
				pos_x = 0
			if pos_x > x_max:
				pos_x = x_max
			if pos_y < 0:
				pos_y = 0
			if pos_y > y_max:
				pos_y = y_max
			var rect = Rect2i(pos_x, pos_y, 365, 365)
			# Crop the image to the rectangle using blip_rect
			Global.screenshot = screenshotTemp
			Global.screenshot.blit_rect(screenshotTemp, rect, Vector2(0, 0))
			Global.screenshot.crop(365, 365)
			
			await get_tree().create_timer(0.1).timeout
			if Global.gatovelocidad == 0:
				Global.puntos = (Global.puntos_base / time_elapsed) * Global.nivel
				Global.puntuacion += Global.puntos
				if Global.nivel == Global.nivel_final:
					Global.victoria = true
					get_tree().change_scene_to_file("res://menu/end_screen.tscn")
				else:
					get_tree().change_scene_to_file("res://polaroid.tscn")
			else:
				get_tree().change_scene_to_file("res://menu/end_screen.tscn") 

func inicializar_animal(animal):
	var path = "res://animales/"+animal+".tscn"
	var escena = load(path)
	var instancia = escena.instantiate()
	add_child(instancia)

# Niveles
func nivel1():
	inicializar_animal("gato")
	
func nivel2():
	nivel1()
	inicializar_animal("toro")
	inicializar_animal("toro")

func nivel3():
	nivel2()
	inicializar_animal("rata")
	inicializar_animal("rata")
	inicializar_animal("rata")
		
func nivel4():
	nivel3()
	#inicializar_animal("conejo")
		
func nivel5():
	nivel4()
	inicializar_animal("tigre")
	inicializar_animal("tigre")
		
func nivel6():
	nivel5()
	inicializar_animal("dragon")
