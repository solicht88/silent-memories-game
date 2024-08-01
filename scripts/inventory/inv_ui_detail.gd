extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display
@onready var title: Label = $CenterContainer/Panel/Label
@onready var description: Label = $CenterContainer/Panel/Label2

func _ready():
	title.visible = false
	description.visible = false

func select_item(slot: InvSlot):
	if !slot:
		item_visual.visible = false
		title.visible = false
		description.visible = false
	else:
		if slot.item != null:
			item_visual.visible = true
			item_visual.texture = slot.item.texture
			title.visible = true
			title.text = str(slot.item.name)
			description.visible = true
			description.text = str(slot.item.description)
