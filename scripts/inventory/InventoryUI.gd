extends Control

@onready var inv: Inventory = preload("res://scripts/inventory/player_inventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
@onready var selected = $NinePatchRect2/GridContainer/inv_ui_detail

var is_open = false
var can_open = true

func _ready():
	inv.update.connect(update_slots)
	update_slots()
	close()

func update_slots():
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].update(inv.slots[i])
		slots[i].slot_position = str(i)

func remove_slot(item: String):
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].remove(item)

func open():
	visible = true
	is_open = true

func close():
	visible = false
	is_open = false
