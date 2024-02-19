extends PlayerState

@onready var hit_timer : Timer = $"../../GetHitTimer" as Timer
@onready var sprite : AnimatedSprite3D = $"../../AnimatedSprite3D" as AnimatedSprite3D
var max_flashes = 6
var curr_flashes = 0
var flash_white = true

func enter(_msg := {}) -> void:
	apply_damage(_msg.get("dmg_amount"))
	if !hit_timer.timeout.is_connected(hit_flash):
		hit_timer.timeout.connect(hit_flash)
	hit_flash()
	state_machine.transition_to("Run")

func apply_damage(dmg_amount):
	if player.current_health - dmg_amount > 0:
		player.current_health -= dmg_amount
	else:
		state_machine.transition_to("Death")

func hit_flash():
	if curr_flashes == max_flashes:
		curr_flashes = 0
		hit_timer.stop()
		flash_white = true
		return
	if flash_white == true:
		sprite.material_override.set_shader_parameter("active", true)
		flash_white = false
	else:
		sprite.material_override.set_shader_parameter("active", false)
		flash_white = true
	curr_flashes += 1
	hit_timer.start(0.1)
