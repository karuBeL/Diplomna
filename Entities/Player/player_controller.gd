extends Entity

func die():
	#print("big die")
	pass

func _ready():
	set("speed", 10)
	add_to_group("player")
	#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
