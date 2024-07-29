extends Control

@onready var player = $"../../player"
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

func _input(event):
	if can_open:
		if event.is_action_pressed("open_inv"):
			if is_open:
				close()
				player.can_move = true
				InteractionManager.can_interact = true
			else:
				player.can_move = false
				player._animation_player.stop()
				InteractionManager.can_interact = false
				selected.select_item(null)
				open()

func open():
	visible = true
	is_open = true

func close():
	visible = false
	is_open = false
