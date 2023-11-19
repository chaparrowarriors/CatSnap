extends RigidBody2D

var sound_dragon: AudioStreamPlayer2D


var velocidad = 10
var direction = 1
#var random = randi_range(1, 4) # Número aleatorio para cases.
var random = 1 # Número aleatorio para cases.
var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	ini_posicion()
	ini_animacion()
	sound_dragon = $AudioStreamPlayer2D
	sound_dragon.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	
	if direction < 0:
		$AnimatedSprite2D.play('izquierda')
	else:
		$AnimatedSprite2D.play('derecha')
	
	var position_in_world = global_position
	var viewport_rect = get_viewport_rect()
	if time > 1 && !viewport_rect.has_point(position_in_world):
		direction = -1
	
	var freq = 5
	var amplitude = 50
	
	var v = Vector2(10, 1)

	v.y = sin(time * freq) * amplitude
	v.x = v.x * direction
	set_axis_velocity(v*velocidad)

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

	if random == 1:
		pos_x = x_min
		pos_y = y_max / 4

	# Asignamos posición
	set_position(Vector2(pos_x, pos_y))
	
func ini_animacion():
		# Asignamos animacion
	if random == 1:
		$AnimatedSprite2D.play('derecha')
	elif random == 2:
		$AnimatedSprite2D.play('izquierda')
