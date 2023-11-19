extends Node2D

var desplazamiento = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$RigidBody2D/creditos_texto.position.y = $RigidBody2D/creditos_texto.position.y - desplazamiento
	
	$RigidBody2D/gato.position.y = $RigidBody2D/gato.position.y - desplazamiento
	$RigidBody2D/toro.position.y = $RigidBody2D/toro.position.y - desplazamiento
	$RigidBody2D/rata.position.y = $RigidBody2D/rata.position.y - desplazamiento
	$RigidBody2D/conejo.position.y = $RigidBody2D/conejo.position.y - desplazamiento
	$RigidBody2D/tigre.position.y = $RigidBody2D/tigre.position.y - desplazamiento
	$RigidBody2D/dragon.position.y = $RigidBody2D/dragon.position.y - desplazamiento
	
	if $RigidBody2D/logo_chaparro.position.y != 300:
		$RigidBody2D/logo_chaparro.position.y = $RigidBody2D/logo_chaparro.position.y - desplazamiento
	else:
		await get_tree().create_timer(5).timeout
		$creditos_sonido.stop()
		get_tree().change_scene_to_file("res://menu/menu.tscn")
