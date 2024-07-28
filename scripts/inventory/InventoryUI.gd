extends Control

@onready var player = $"../../player"
@onready var inv: Inventory = preload("res://scripts/inventory/player_inventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var is_open = false
var can_open = true

func _ready():
	update_slots()
	close()

func update_slots():
	for i in range(min(inv.items.size(), slots.size())):
		slots[i].update(inv.items[i])

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
				open()

func open():
	visible = true
	is_open = true

func close():
	visible = false
	is_open = false
