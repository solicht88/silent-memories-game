extends Resource

class_name SaveData

@export var speed = 300
@export var SavePos: Vector2
@export var inventory: Array

func save_inventory(value: Array):
	inventory = value

func save_position(value: Vector2):
	SavePos = value
