extends Resource

class_name SaveData

@export var CurRoom: String
@export var SavePos: Vector2
@export var inventory: Array[InvSlot]

@export var kitchen_open = false

@export var nap_key = false
@export var nap_open = false

func save_inventory(value: Array[InvSlot]):
	inventory = value

func save_position(value: Vector2):
	SavePos = value

