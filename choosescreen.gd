extends Control


func _on_button_pressed() -> void:
	Globals.character = "shanto"
	get_tree().change_scene_to_file("res://scenes/node_2d.tscn")


func _on_button_2_pressed() -> void:
	Globals.character = "jahid"
	get_tree().change_scene_to_file("res://scenes/node_2d.tscn")
