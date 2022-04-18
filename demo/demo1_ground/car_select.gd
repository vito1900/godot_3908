extends Control

var town = null

func _ready():
	OS.get_current_video_driver()
	

func _process(_delta):
	if Input.is_action_just_pressed("back"):
		_on_Back_pressed()


func _load_scene(car):
	var tt = load(car).instance()
	tt.set_name("car")
	town = load("res://town_scene.tscn").instance()
	town.get_node("InstancePos").add_child(tt)
	town.get_node("Back").connect("pressed", self, "_on_Back_pressed")
	for child in town.get_children():
		print(child.name)
	town.get_node("InstancePos").get_node("car").get_node("Body").translation = Vector3(1000,1000,1000)
	get_parent().add_child(town)
	hide()


func _on_Back_pressed():
	if is_instance_valid(town):
		# Currently in the town, go back to main menu.
		town.queue_free()
		show()
	else:
		# In main menu, exit the game.
		get_tree().quit()


func _on_MiniVan_pressed():
	_load_scene("res://car_base.tscn")
	#_load_scene("res://Cam.tscn")


func _on_TrailerTruck_pressed():
	_load_scene("res://trailer_truck.tscn")


func _on_TowTruck_pressed():
	_load_scene("res://tow_truck.tscn")
