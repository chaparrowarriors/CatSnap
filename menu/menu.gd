extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_boton_pressed():
	get_tree().change_scene_to_file("res://main.tscn")

func _on_how_to_play_boton_pressed():
	get_tree().change_scene_to_file("res://menu/howto.tscn") 

func _on_quit_boton_pressed():
	get_tree().quit()


func _on_fieras_pressed():
	get_tree().change_scene_to_file("res://menu/fieras.tscn") 


func _on_ranking_pressed():
	get_tree().change_scene_to_file("res://menu/ranking.tscn") 
