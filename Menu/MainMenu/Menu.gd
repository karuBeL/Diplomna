extends Control


func _ready():
	var play_button : Button = $MarginContainer/VBoxContainer/Play as Button
	var quit_button : Button = $MarginContainer/VBoxContainer/Quit as Button
	play_button.pressed.connect(play_pressed)
	quit_button.pressed.connect(quit_pressed)

func play_pressed():
	get_tree().change_scene_to_file("res://Menu/AbilityMenu/abilitymenu.tscn")

func quit_pressed():
	get_tree().quit()


