extends CharacterBody2D
@onready var shanto: Sprite2D = $Shanto
@onready var jahid: Sprite2D = $Jahid
@onready var weed: Sprite2D = $Weed

func _ready() -> void:
	if Globals.character == "jahid":
		jahid.visible = true
		shanto.visible = false
	else:
		jahid.visible = false
		shanto.visible = true



func _physics_process(delta: float) -> void:
	if Globals.holding_weed == false:
		weed.visible = false
	else:
		weed.visible = true
	
	var directionX := Input.get_axis("ui_left", "ui_right")
	var directionY := Input.get_axis("ui_up", "ui_down")

	if directionX:
		velocity.x = directionX * Globals.speed
	else:
		velocity.x = move_toward(velocity.x, 0, Globals.speed)

	if directionY:
		velocity.y = directionY * Globals.speed
	else:
		velocity.y = move_toward(velocity.y, 0, Globals.speed)
		
	move_and_slide()
