extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var play_button : Button = $MarginContainer/VBoxContainer/Play as Button
	var options_button : Button = $MarginContainer/VBoxContainer/Options as Button
	var quit_button : Button = $MarginContainer/VBoxContainer/Quit as Button
	play_button.pressed.connect(play_pressed)
	options_button.pressed.connect(options_pressed)
	quit_button.pressed.connect(quit_pressed)

func play_pressed():
	get_tree().change_scene_to_file("res://World/world.tscn")

func options_pressed():
	get_tree().change_scene_to_file("res://Menu/AbilityMenu/abilitymenu.tscn")

func quit_pressed():
	get_tree().quit()

