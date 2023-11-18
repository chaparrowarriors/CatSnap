extends Node2D

var sound_camara: AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	#$gato.add_constant_central_force(Vector2(-10,0))
	#$gato.set_axis_velocity(Vector2(-100,0))
	sound_camara = $AudioStreamPlayer2D
	inicializar_gato()
	inicializar_toro()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$gato.set_axis_velocity(Vector2(-100,0))
	pass

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			sound_camara.play()
				
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

