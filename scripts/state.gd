class_name State
extends Node

## A state that can control some behaviour for an entity.

## Entity that the state will control.
var entity: Entity

## Sets up the entity for the state to control.
func init(new_entity: Entity) -> void:
  entity = new_entity

## Called when state starts.
func enter() -> void:
  pass

## Called when state ends.
func exit() -> void:
  pass

## Called on every process frame.
func process(_delta: float) -> State:
  return null

## Called on every physics frame.
func process_physics(_delta: float) -> State:
  return null

## Called on every input.
func process_input(_input: InputEvent) -> State:
  return null
