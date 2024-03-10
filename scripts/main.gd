class_name Main
extends Node2D

## This is the main game handler. It handles projectiles/entity spawning and sprite ordering.

@export_category("Containers")
@export var projectiles: Node2D
@export var entities: Node2D

func _ready() -> void:
  Ref.main = self

func spawn_projectile(projectile: Projectile) -> void:
  projectiles.add_child(projectile)

# func create_damage_text(damage: DamageData, position: Vector2) -> void:
#   pass