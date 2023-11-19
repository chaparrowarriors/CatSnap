extends RigidBody2D

var sound_conejo: AudioStreamPlayer2D


var direccion = Vector2(0, 0)
var random = randi_range(3, 4) # Número aleatorio para cases.
var offworld = false
var onworld = false
var speed = 200
var jump_force = 500
var gravity = 800
var velocity = Vector2()
var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.gatovelocidad = 200
	sound_conejo = $AudioStreamPlayer2D
	sound_conejo.play()
	
	ini_posicion()
	ini_animacion()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	var smooth = snapped(time, 1)
	
	if random == 3:
		velocity.x += 5
	else:
		velocity.x -= 5

	# Jumping
	if smooth % 2:
		velocity.y = -jump_force

	# Gravity
	velocity.y += gravity * delta

	# Normalize the velocity to ensure consistent movement speed in all directions
	velocity = velocity.normalized()

	# Set the linear velocity
	set_linear_velocity(velocity * speed)

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
	if random == 1:
		pos_x = randf_range( x_max/4, x_max*3/4)
		pos_y = y_max + 50
		# Case 2: Abajo
	elif random == 2:
		pos_x = randf_range( x_max/4, x_max*3/4)
		pos_y = y_min - 50
	# Case 3: Izquierda
	elif random == 3:
		pos_x = x_min - 50
		pos_y = randf_range( y_max*2/4, y_max)
	# Case 4: Derecha
	elif random == 4:
		pos_x = x_max + 50
		pos_y = randf_range( y_max*2/4, y_max)
	# Asignamos posición
	set_position(Vector2(pos_x, pos_y))
	
	
func ini_animacion():
		# Asignamos animacion
	if random == 1:
		$AnimatedSprite2D.play('izquierda')
	elif random == 2:
		$AnimatedSprite2D.play('derecha')
	elif random == 3:
		$AnimatedSprite2D.play('derecha')
	elif random == 4:
		$AnimatedSprite2D.play('izquierda')

