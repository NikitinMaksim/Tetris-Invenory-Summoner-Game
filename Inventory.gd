extends Control

@onready var slot_scene = preload("res://slot.tscn")
@onready var grid_container = $ColorRect/MarginContainer/VBoxContainer/ScrollContainer/GridContainer

var grid_array := []

func _ready():
	for i in range(56):
		create_slot()


func _process(delta):
	pass

func create_slot():
	var new_slot = slot_scene.instantiate() 
	new_slot.slot_ID = grid_array.size()
	grid_container.add_child(new_slot)
	grid_array.push_back(new_slot)
	new_slot.slot_entered.connect(_on_slot_mouse_entered)
	new_slot.slot_exited.connect(_on_slot_mouse_exited)

func _on_slot_mouse_entered(a_Slot):
	a_Slot.set_color(a_Slot.States.TAKEN)

func _on_slot_mouse_exited(a_Slot):
	a_Slot.set_color(a_Slot.States.DEFAULT)
#TODO остановился на 20.51
