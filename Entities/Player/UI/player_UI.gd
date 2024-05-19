extends PanelContainer

@onready var b_container = $AbilitiesMargin/BaseAbilities
@onready var s_container = $AbilitiesMargin/SecondaryAbilities
@onready var health_bar = $HPMargin/ProgressBar as ProgressBar

func set_health(value):
	health_bar.value = value

func set_cooldown(cd_time, index):
	b_container.get_ability(index).set_cooldown(cd_time)

func set_ability(name, index):
	b_container.b_abilities[index].set_label(name[0])
	s_container.s_abilities[index].set_label(name[1])
