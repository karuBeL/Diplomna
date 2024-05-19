extends Control

@onready var all_abilities = $AllAbilities
@onready var base_abilities = $PlayerAbilities/AbilitiesMargin/BaseAbilities
@onready var secondary_abilities = $PlayerAbilities/AbilitiesMargin/SecondaryAbilities

func reset_abilities():
	base_abilities.reset_abilities()
	secondary_abilities.reset_abilities()
	all_abilities.reset_abilities()
