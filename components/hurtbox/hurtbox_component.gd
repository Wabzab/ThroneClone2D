class_name HurtboxComponent
extends Area2D

## This component is used to detect damageable objects/entities.

## Emitted when a hitbox has been detected.
signal hurt(hitbox: HitboxComponent)

@export var group: Enums.GroupType

func _on_area_entered(area: Area2D):
  if area is HitboxComponent:
    if group == Enums.GroupType.Neutral or group != area.group:
      hurt.emit(area)
