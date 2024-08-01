extends Resource

class_name SaveData

@export var speed = 300
@export var SavePos: Vector2
@export var inventory: Array[InvSlot]

@export var kitchen_open = false

@export var nap_key = false

func save_inventory(value: Array[InvSlot]):
	inventory = value

func save_position(value: Vector2):
	SavePos = value

