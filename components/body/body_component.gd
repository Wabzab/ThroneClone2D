@tool
class_name BodyComponent
extends Node2D

@export var base: AtlasTexture:
  set(texture):
    if base_sprite:
      base_sprite.texture = texture
    base = texture
@export var head: AtlasTexture:
  set(texture):
    if head_sprite:
      head_sprite.texture = texture
    head = texture
@export var chest: AtlasTexture:
  set(texture):
    if chest_sprite:
      chest_sprite.texture = texture
    chest = texture
@export var legs: AtlasTexture:
  set(texture):
    if legs_sprite:
      legs_sprite.texture = texture
    legs = texture
@export var main_hand: AtlasTexture:
  set(texture):
    if main_hand_sprite:
      main_hand_sprite.texture = texture
    main_hand = texture
@export var off_hand: AtlasTexture:
  set(texture):
    if off_hand_sprite:
      off_hand_sprite.texture = texture
    off_hand = texture

@onready var base_sprite: Sprite2D = $Base
@onready var head_sprite: Sprite2D = $Head
@onready var chest_sprite: Sprite2D = $Chest
@onready var legs_sprite: Sprite2D = $Legs
@onready var main_hand_sprite: Sprite2D = $MainHand
@onready var off_hand_sprite: Sprite2D = $OffHand

var hit_blink_shader = preload ('res://components/body/hit_blink.gdshader')

func _ready():
  base_sprite.texture = base
  head_sprite.texture = head
  chest_sprite.texture = chest
  legs_sprite.texture = legs
  main_hand_sprite.texture = main_hand
  off_hand_sprite.texture = off_hand
  
  material = ShaderMaterial.new()
  material.shader = hit_blink_shader.duplicate(true)
