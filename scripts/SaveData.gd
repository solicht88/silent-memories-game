extends Resource

class_name SaveData

@export var CurRoom: String
@export var SavePos: Vector2
@export var inventory: Array[InvSlot]

@export var nap_open = false
@export var staff_open = false
@export var kitchen_open = false
@export var nap_key = false
@export var pink_key = false
@export var staff_key = false
@export var blue_key = false
@export var caretaker_key = false

func save_inventory(value: Array[InvSlot]):
	inventory = value

func save_position(value: Vector2):
	SavePos = value

func update_data_vars():
	nap_open = Dialogic.VAR.doors.daycare.nap_open
	staff_open = Dialogic.VAR.doors.daycare.staff_open
	kitchen_open = Dialogic.VAR.doors.daycare.kitchen_open
	nap_key = Dialogic.VAR.inventory.daycare.nap_key
	pink_key = Dialogic.VAR.inventory.daycare.pink_key
	staff_key = Dialogic.VAR.inventory.daycare.staff_key
	blue_key = Dialogic.VAR.inventory.daycare.blue_key
	caretaker_key = Dialogic.VAR.inventory.daycare.caretaker_key

func update_dialogic_vars():
	Dialogic.VAR.doors.daycare.nap_open = nap_open
	Dialogic.VAR.doors.daycare.staff_open = staff_open
	Dialogic.VAR.doors.daycare.kitchen_open = kitchen_open
	Dialogic.VAR.inventory.daycare.nap_key = nap_key
	Dialogic.VAR.inventory.daycare.pink_key = pink_key
	Dialogic.VAR.inventory.daycare.staff_key = staff_key
	Dialogic.VAR.inventory.daycare.blue_key = blue_key
	Dialogic.VAR.inventory.daycare.caretaker_key = caretaker_key
