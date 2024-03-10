class_name HealthComponent
extends Node2D

## The health component handles, well, health for the attached entity.

signal damaged(amount: float, type: int)
signal killed(amount: float, type: int)

## For animating the body when damaged.
@export var body: BodyComponent
## The maximum health.
@export var max_health: float
## The current health.
var current_health: float:
  set(health):
    previous_health = current_health
    current_health = clamp(current_health + health, 0, max_health)
## The previous health.
var previous_health: float

## Checks if current health is zero or less.
func is_dead() -> bool:
  return current_health <= 0

func damage(damageData: DamageData) -> void:
  if is_dead():
    return
  ## Apply damage resistances
  var tween = create_tween()
  tween.tween_method(set_shader_value, 1.0, 0.0, 0.25);
  tween.play()
  current_health -= damageData.amount
  if is_dead():
    killed.emit()

func _ready():
  current_health = max_health

# tween value automatically gets passed into this function
func set_shader_value(value: float):
  body.material.set_shader_parameter('hit_opacity', value)