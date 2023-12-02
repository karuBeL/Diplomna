extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pivy = rotation.y - PI
	var z = (pivy - PI/2) - PI/2
	var y = (-2*z + pivy) - PI/2
	$Sprite3D.rotation.z = z
	$Sprite3D.rotation.y = y
