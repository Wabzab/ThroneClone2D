extends Projectile

@export var velocity_component: VelocityComponent

func _physics_process(_delta):
  velocity_component.accelerate_in_direction(direction)
  velocity_component.move(self)

func _on_hurtbox_component_hurt(hitbox: HitboxComponent) -> void:
  super(hitbox)
  queue_free()
