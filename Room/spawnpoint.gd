extends Marker3D

@export var entity : PackedScene 

func spawn_entity():
	var spawned_entity : EntityClass = entity.instantiate() as EntityClass
	add_child(spawned_entity)
	spawned_entity.global_position = global_position
