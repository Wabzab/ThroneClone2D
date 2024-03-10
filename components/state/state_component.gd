class_name StateComponent
extends Node

## Handles state entering/exiting and processing.

## State to load first when ready.
@export var initial_state: State
## Current state being processed.
var current_state: State

## Sets up all child states to control the entity.
func init(entity: Entity):
  for child in get_children() as Array[State]:
    child.init(entity)
  change_state(initial_state)

## Changes from one state to another.
func change_state(new_state: State) -> void:
  if current_state:
    current_state.exit()
  current_state = new_state
  current_state.enter()

## Process the frame for the current state.
func process(delta: float) -> void:
  if !current_state:
    return
  var new_state = current_state.process(delta)
  if new_state:
    change_state(new_state)

## Processes the physics frame for the current state
func process_physics(delta: float) -> void:
  if !current_state:
    return
  var new_state = current_state.process_physics(delta)
  if new_state:
    change_state(new_state)

## Process the input for the current state.
func process_input(input: InputEvent) -> void:
  if !current_state:
    return
  var new_state = current_state.process_input(input)
  if new_state:
    change_state(new_state)
    