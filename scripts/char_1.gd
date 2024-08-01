extends CharacterBody2D

var save_file_path = "user://save/"
var save_file_name = "SaveData.tres"
var saveData = SaveData.new()

@export var inventory: Inventory
@export var speed = 300

@onready var _animation_player = $AnimationPlayer
@onready var interaction_finder: Area2D = $Direction/InteractionFinder
@onready var can_move = true
@onready var cur_node = $".."

func collect(item):
	inventory.insert(item)

func _ready():
	verify_save_directory(save_file_path)
	saveData.update_data_vars()

func verify_save_directory(path: String):
	DirAccess.make_dir_absolute(path)

func load_data():
	saveData = ResourceLoader.load(save_file_path + save_file_name).duplicate(true)
	#self.position = saveData.SavePos
	inventory.slots = saveData.inventory
	SceneSwitcher.switch_scene(saveData.CurRoom, saveData.SavePos)
	#print(inventory.slots)
	inventory.update.emit()
	saveData.update_dialogic_vars()
	#print(saveData.nap_key)
	print("loaded")

func save_data():
	saveData.SavePos = self.position
	saveData.save_inventory(inventory.slots)
	#print(saveData.CurRoom)
	ResourceSaver.save(saveData, save_file_path + save_file_name)
	#print(saveData.nap_key)
	print("saved")

func get_input():
	var input_direction = Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")
	if Input.is_action_pressed("walk_right") || Input.is_action_pressed("walk_left"):
		input_direction.y = 0
	elif Input.is_action_pressed("walk_up") || Input.is_action_pressed("walk_down"):
		input_direction.x = 0
	velocity = input_direction * speed

func _physics_process(_delta):
	if can_move:
		get_input()
		move_and_slide()

func _process(_delta):
	if can_move:
		if Input.is_action_pressed("walk_right") && Input.is_action_pressed("walk_left"):
			_animation_player.stop()
		elif Input.is_action_pressed("walk_up") && Input.is_action_pressed("walk_down"):
			_animation_player.stop()
		elif Input.is_action_pressed("walk_left"):
			_animation_player.play("walk_left")
		elif Input.is_action_pressed("walk_right"):
			_animation_player.play("walk_right")
		elif Input.is_action_pressed("walk_up"):
			_animation_player.play("walk_up")
		elif Input.is_action_pressed("walk_down"):
			_animation_player.play("walk_down")
		else:
			_animation_player.stop()

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact") && InteractionManager.can_interact:
		_animation_player.stop()
		var interactions = interaction_finder.get_overlapping_areas()
		#print(interactions)
		if interactions.size() > 0:
			interactions[0].interact.call()
			return
