extends Entity

## One of the four base playable characters. The knight features a tankier playstyle.

@export var state: StateComponent
@export var weapon: WeaponComponent

func _ready():
  state.init(self)
  weapon.swap_weapon(0)

func _process(delta: float) -> void:
  state.process(delta)

func _physics_process(delta: float) -> void:
  state.process_physics(delta)

func _unhandled_input(event: InputEvent) -> void:
  if Input.is_key_pressed(KEY_1):
    weapon.swap_weapon(0)
  if Input.is_key_pressed(KEY_2):
    weapon.swap_weapon(1)
  state.process_input(event)
