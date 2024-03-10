class_name Projectile
extends CharacterBody2D

## Generic projectile interface.

@export var damage: DamageData
@export var duration: float
@export var hurtbox: HurtboxComponent
var direction: Vector2

func init(direction_in: Vector2) -> void:
  direction = direction_in

func _ready():
  look_at(position + direction)
  var timer = get_tree().create_timer(duration)
  timer.timeout.connect(
    func():
      queue_free()
  )
  hurtbox.hurt.connect(_on_hurtbox_component_hurt)

func _on_hurtbox_component_hurt(hitbox: HitboxComponent):
  hitbox.handle_damage(damage)