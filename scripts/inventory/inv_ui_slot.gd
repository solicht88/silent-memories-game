extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display
@onready var label_text: Label = $CenterContainer/Panel/Label

func update(slot: InvSlot):
	if !slot:
		item_visual.visible = false
		label_text.visible = false
	else:
		item_visual.visible = true
		if slot.item != null:
			item_visual.texture = slot.item.texture
		label_text.visible = true
		label_text.text = str(slot.label)
