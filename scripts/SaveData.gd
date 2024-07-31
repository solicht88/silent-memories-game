extends Resource

class_name SaveData

@export var speed = 300
@export var SavePos: Vector2
@export var inventory: Inventory

func save_inventory(value: Inventory):
	inventory = value

func save_position(value: Vector2):
	SavePos = value

