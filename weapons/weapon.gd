class_name Weapon
extends Resource

## Contains data related to the weapon

enum State {
  Ready,
  Recharging
}

## The type of the weapon.
@export var type: Enums.WeaponType
## The name of the weapon.
@export var name: String
## The damage data of the weapon.
@export var cooldown: float
## The texture of the weapon.
@export var texture: AtlasTexture
## The projectile to spawn when attacking.
@export var projectile_scene: PackedScene
## The cooldown timer, if on cooldown.
var cooldown_timer: SceneTreeTimer
## The current state of the weapon.
var is_ready := true

## Triggers the weapon to attack.
func attack(weapon: WeaponComponent, position: Vector2, direction: Vector2) -> void:
  # Play sound
  is_ready = false
  if Ref.main:
    var projectile = projectile_scene.instantiate() as Projectile
    projectile.init(direction)
    projectile.position = position
    Ref.main.spawn_projectile(projectile)
  cooldown_timer = weapon.get_tree().create_timer(cooldown)
  cooldown_timer.timeout.connect(recharge)

func recharge() -> void:
  is_ready = true
