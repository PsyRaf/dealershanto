extends Node2D


var time = 0.0
var time_f = 0.0
var high_time = 0
@onready var rich_text_label: RichTextLabel = $texts/RichTextLabel
@onready var rich_text_label_2: RichTextLabel = $texts/RichTextLabel2
@onready var higheffect: Sprite2D = $Higheffect
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _process(delta: float) -> void:
	time_f = "%.2f" % time
	rich_text_label.text = "Time: "+str(time_f)+"\nPoints: "+str(Globals.points)
	rich_text_label_2.text = "Collect: "+str(Globals.collect)+"\nDeliver: "+str(Globals.deliver)
	time += delta
	if time > high_time:
		Globals.high = false
		Globals.speed = 200
		higheffect.visible = false
		audio_stream_player.stop()
	if time > 3000:
		get_tree().change_scene_to_file("res://scenes/endscreen.tscn")
	
func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	if Globals.collect == 1:
		Globals.holding_weed = true
	if Globals.deliver == 1:
		Globals.holding_weed = false
		Globals.points += 1
		Globals.collect = randi_range(1, 4)
		Globals.deliver = randi_range(1, 4)
		if Globals.collect == Globals.deliver:
			Globals.deliver = randi_range(1, 4)
			if Globals.collect == Globals.deliver:
				Globals.deliver = randi_range(1, 4)


func _on_area_2d_2_body_entered(body: CharacterBody2D) -> void:
	if Globals.collect == 2:
		Globals.holding_weed = true
	if Globals.deliver == 2:
		Globals.holding_weed = false
		Globals.points += 1
		Globals.collect = randi_range(1, 4)
		Globals.deliver = randi_range(1, 4)
		if Globals.collect == Globals.deliver:
			Globals.deliver = randi_range(1, 4)
			if Globals.collect == Globals.deliver:
				Globals.deliver = randi_range(1, 4)

func _on_area_2d_3_body_entered(body: CharacterBody2D) -> void:
	if Globals.collect == 3:
		Globals.holding_weed = true
	if Globals.deliver == 3:
		Globals.holding_weed = false
		Globals.points += 1
		Globals.collect = randi_range(1, 4)
		Globals.deliver = randi_range(1, 4)
		if Globals.collect == Globals.deliver:
			Globals.deliver = randi_range(1, 4)
			if Globals.collect == Globals.deliver:
				Globals.deliver = randi_range(1, 4)

func _on_area_2d_4_body_entered(body: CharacterBody2D) -> void:
	if Globals.collect == 4:
		Globals.holding_weed = true
	if Globals.deliver == 4:
		Globals.holding_weed = false
		Globals.points += 1
		Globals.collect = randi_range(1, 4)
		Globals.deliver = randi_range(1, 4)
		if Globals.collect == Globals.deliver:
			Globals.deliver = randi_range(1, 4)
			if Globals.collect == Globals.deliver:
				Globals.deliver = randi_range(1, 4)


func _on_button_pressed() -> void:
	if Globals.boost_amount > 0:
		Globals.high = true
		high_time = time + 5
		Globals.speed = 1000
		Globals.boost_amount -= 1
		higheffect.visible = true
		audio_stream_player.play()



func _on_area_2d_5_body_entered(body: CharacterBody2D) -> void:
	Globals.speed = 20


func _on_area_2d_5_body_exited(body: Node2D) -> void:
	Globals.speed = 300
