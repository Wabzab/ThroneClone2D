class_name HitboxComponent
extends Area2D

## Used to make an entity/object damageable.

signal hit(damage: DamageData)

@export var group: Enums.GroupType

func handle_damage(damage: DamageData) -> void:
  # Apply resistances if any?
  hit.emit(damage)