extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display
@onready var label_text: Label = $CenterContainer/Panel/Label
@onready var item_detail = $"../../../NinePatchRect2/GridContainer/inv_ui_detail"
@onready var item_slot: InvSlot

func _ready():
	label_text.visible = false

func update(slot: InvSlot):
	if !slot:
		item_visual.visible = false
		label_text.visible = false
	else:
		item_visual.visible = true
		if slot.item != null:
			item_visual.texture = slot.item.texture
			label_text.text = str(slot.item.name)
		label_text.visible = true
		item_slot = slot

func _on_item_button_pressed():
	if item_slot != null:
		item_detail.select_item(item_slot)
