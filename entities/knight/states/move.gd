extends State

@export var idle: State
@export var attack: State
@export var velocity: VelocityComponent
@export var animation: AnimationTree
@export var weapon: WeaponComponent

func enter() -> void:
  animation['parameters/playback'].travel('move')

func process_physics(_delta: float) -> State:
  var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
  if direction.length() == 0:
    return idle
  velocity.accelerate_in_direction(direction.normalized())
  velocity.move(entity)
  return null

func process_input(_input: InputEvent) -> State:
  if Input.is_action_just_pressed('attack') and weapon.can_attack():
    return attack
  return null