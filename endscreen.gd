extends Control

@onready var rich_text_label: RichTextLabel = $RichTextLabel

func _process(delta: float) -> void:
	rich_text_label.text = "Your Score: "+str(Globals.points)


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
