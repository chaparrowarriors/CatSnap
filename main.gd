extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#$gato.add_constant_central_force(Vector2(-10,0))
	#$gato.set_axis_velocity(Vector2(-100,0))
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$gato.set_axis_velocity(Vector2(-100,0))
