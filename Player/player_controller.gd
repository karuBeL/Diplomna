extends Entity

func die():
	#print("big die")
	pass

func _ready():
	pass
	#set("speed", 13)
	#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
