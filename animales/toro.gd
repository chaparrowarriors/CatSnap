extends RigidBody2D

var sound_toro: AudioStreamPlayer2D
var velocidad = 600
var velocidad_original = velocidad
var direccion = Vector2(0, 0)
var random = randi_range(1, 4) # Número aleatorio para cases.

# Called when the node enters the scene tree for the first time.
func _ready():
	ini_posicion()
	ini_velocidad()
	ini_animacion()
	sound_toro = $AudioStreamPlayer2D
	sound_toro.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Movimiento brusco del toro: decremento de velocidad suave, para y arranca brusco
	decremento_velocidad()
	await get_tree().create_timer(0.7).timeout
	set_axis_velocity(direccion * (velocidad_original*1.3))

func decremento_velocidad():
	for i in range(velocidad, 0, -50):
		set_axis_velocity(direccion * velocidad)
		velocidad=i
		await get_tree().create_timer(0.1).timeout

func ini_posicion():
	# Constantes de posición de pantalla x min/max y y min/max
	var viewport_tam = get_viewport_rect().size
	var x_max = viewport_tam.x
	var y_max = viewport_tam.y
	var x_min = 0
	var y_min = 0
	
	# Randomizamos posicion
	var pos_x = 0
	var pos_y = 0
	
	# Randomizamos posición pero tiene que estar fuera de la pantalla
	# Case 1: Arriba
	match random:
		1:
			pos_x = randf_range(x_min, x_max)
			pos_y = y_max + 50
		# Case 2: Abajo
		2:
			pos_x = randf_range(x_min, x_max)
			pos_y = y_min - 50
		# Case 3: Izquierda
		3:
			pos_x = x_min - 50
			pos_y = randf_range(y_min, y_max)
		# Case 4: Derecha
		4:
			pos_x = x_max + 50
			pos_y = randf_range(y_min, y_max)

	# Asignamos posición
	set_position(Vector2(pos_x, pos_y))
	
func ini_velocidad():
	match random:
		1:
			direccion = Vector2(0, -1)
		2:
			direccion = Vector2(0, 1)
		3:
			direccion = Vector2(1, 0)
		4:
			direccion = Vector2(-1, 0)
		_:
			print("Dirección no reconocida")
	
	set_axis_velocity(direccion * velocidad)
	
func ini_animacion():
		# Asignamos animacion
	match random:
		1:
			$AnimatedSprite2D.play('izquierda')
		2:
			$AnimatedSprite2D.play('derecha')
		3:
			$AnimatedSprite2D.play('derecha')
		4:
			$AnimatedSprite2D.play('izquierda')

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			velocidad = 0
			sound_toro.stop()
			$AnimatedSprite2D.stop()
			
# Función que checkea la posición del animal para ver si sigue dentro de pantalla.
func on_screen():
	# Obtén las coordenadas del mundo del RigidBody
	var position_in_world = global_position

	# Obtén las dimensiones del Viewport
	var viewport_rect = get_viewport_rect()

	# Verifica si la posición del RigidBody está dentro del Viewport
	if viewport_rect.has_point(position_in_world):
		if !sound_toro.is_playing() && velocidad > 0:
			sound_toro.play()
	else:
		sound_toro.stop()
