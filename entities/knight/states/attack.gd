extends State

@export var idle: State
@export var animation: AnimationTree
@export var weapon: WeaponComponent
@export var collision: CollisionShape2D
var finished = false

func enter() -> void:
  animation['parameters/playback'].travel('attack')
  animation.animation_finished.connect(on_finished, CONNECT_ONE_SHOT)
  weapon.attack(collision.global_position, entity.position.direction_to(entity.get_global_mouse_position()))

func exit() -> void:
  finished = false

func process_physics(_delta) -> State:
  if finished:
    return idle
  return null

func on_finished(_anim_name: StringName) -> void:
  finished = true
