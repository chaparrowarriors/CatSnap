extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	inicializar_posicion()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func inicializar_posicion():
	# Constantes de posición de pantalla x min/max y y min/max
	var viewport_tam = get_viewport_rect().size
	var x_max = viewport_tam.x
	var y_max = viewport_tam.y
	var x_min = 0
	var y_min = 0
	
	# Randomizamos posicion
	var pos_x = 0
	var pos_y = 0
	var random = randf_range(1, 4) # Número aleatorio para cases.
	print(random)
	
	match random:
		1:
			pos_x = 1
			pos_y = 1

	$AnimatedSprite2D.play('idle')
