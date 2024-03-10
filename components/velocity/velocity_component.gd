class_name VelocityComponent
extends Node2D

## Handles any velocity related data

## The maximum speed determines the velocity that can be reached.
@export var max_speed: float
## The acceleration determines how soon the max speed is reached.
@export var acceleration: float
## Current velocity.
var current_velocity := Vector2.ZERO

func accelerate_to_velocity(velocity: Vector2) -> void:
  current_velocity = current_velocity.lerp(velocity, acceleration / max_speed)

func accelerate_in_direction(direction: Vector2) -> void:
  accelerate_to_velocity(direction * (max_speed / acceleration))

func move(body: CharacterBody2D, delta:=1.0) -> void:
  body.move_and_collide(current_velocity * delta)