extends Resource

class_name SaveData

@export var speed = 300
@export var SavePos: Vector2
@export var inventory: Array[InvSlot]

func save_inventory(value: Array[InvSlot]):
	inventory = value

func save_position(value: Vector2):
	SavePos = value

