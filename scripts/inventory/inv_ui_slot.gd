extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display
@onready var label_text: Label = $CenterContainer/Panel/Label
@onready var item_detail = $"../../../NinePatchRect2/GridContainer/inv_ui_detail"
@onready var item_slot: InvSlot
@onready var inv: Inventory = preload("res://scripts/inventory/player_inventory.tres")
@onready var slot_position: int

func _ready():
	label_text.visible = false

func update(slot: InvSlot):
	if !slot:
		item_visual.visible = false
		label_text.visible = false
	else:
		if slot.item != null:
			item_visual.visible = true
			item_visual.texture = slot.item.texture
			label_text.text = str(slot.item.name)
			#print(slot.item.name)
			label_text.visible = true
			item_slot = slot
		else:
			item_visual.visible = false
			label_text.visible = false

func remove(item: String):
	if item == label_text.text:
		item_slot.item = null
		inv.slots[self.slot_position].item = null
		item_visual.visible = false
		label_text.visible = false

func load_item(file):
	item_visual.texture = file.texture
	label_text.text = file.name

func _on_item_button_pressed():
	if item_slot != null:
		item_detail.select_item(item_slot)
