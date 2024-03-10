class_name WeaponComponent
extends Node

## Stores and provides access to weapons.

## Array of stored weapons.
@export var weapons: Array[Weapon]
## Maximum number of stored weapons.
@export var limit: int = 2
## Body component for updating the hand texture.
@export var body: BodyComponent
## Equipped weapon index.
var equipped: int:
  set(index):
    equipped = index % limit

func swap_weapon(index) -> void:
  equipped = index
  body.main_hand = weapons[equipped].texture if weapons[equipped] else null

func can_attack() -> bool:
  if weapons[equipped] and weapons[equipped].is_ready:
    return true
  return false

func attack(position: Vector2, direction: Vector2) -> void:
  weapons[equipped].attack(self, position, direction)
