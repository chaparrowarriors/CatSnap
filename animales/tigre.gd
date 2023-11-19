extends RigidBody2D

var sound_tigre: AudioStreamPlayer2D
var direccion = Vector2(1, 0)
var random = randi_range(1, 2) # Número aleatorio para cases.
var velocidad = 30
var tiempo = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	ini_posicion()
	ini_velocidad()
	ini_animacion()
	sound_tigre = $AudioStreamPlayer2D
	sound_tigre.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	tiempo += delta
	
	if random < 0:
		$AnimatedSprite2D.play('izquierda')
	else:
		$AnimatedSprite2D.play('derecha')
	var position_in_world = global_position
	var viewport_rect = get_viewport_rect()
	if tiempo > 1 && !viewport_rect.has_point(position_in_world):
		random = -1

	var freq = 10
	var amplitude = 40
	var v = Vector2(10, 1)
	v.y = sin(tiempo * freq) * amplitude
	if random==2:
		v.x = -v.x
	set_axis_velocity(v*velocidad)
	
			
func gauss(t):
	return exp(-t * t)
	
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
	
	# Randomizamos posición pero algo centrado en el eje Y
	if random == 1:
		pos_x = x_min - 40
		pos_y = randf_range(y_min+60, y_max-60)
	# Case 4: Derecha
	elif random == 2:
		pos_x = x_max - 40
		pos_y = randf_range(y_min+60, y_max-60)

	# Asignamos posición
	set_position(Vector2(pos_x, pos_y))
	
func ini_velocidad():
	# Asignamos velocidad
	if random == 1:
		direccion = Vector2(1, 0)
	elif random == 2:
		direccion = Vector2(-1, 0)
		
	set_axis_velocity(direccion * velocidad)
	
func ini_animacion():
		# Asignamos animacion
	if random == 1:
		$AnimatedSprite2D.play('derecha')
	elif random == 2:
		$AnimatedSprite2D.play('izquierda')

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			velocidad = 0
			sound_tigre.stop()
			$AnimatedSprite2D.stop()
			
# Función que checkea la posición del animal para ver si sigue dentro de pantalla.
func on_screen():
	# Obtén las coordenadas del mundo del RigidBody
	var position_in_world = global_position

	# Obtén las dimensiones del Viewport
	var viewport_rect = get_viewport_rect()

	# Verifica si la posición del RigidBody está dentro del Viewport
	if viewport_rect.has_point(position_in_world):
		if !sound_tigre.is_playing() && velocidad > 0:
			sound_tigre.play()
	else:
		sound_tigre.stop()
