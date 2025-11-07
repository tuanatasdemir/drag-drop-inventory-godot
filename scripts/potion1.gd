extends Area2D

@export var item_name: String = "potion1"

var is_dragging = false 
var original_position = Vector2.ZERO 

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		Inventory.add_item("potion1")
		if event.pressed:
			is_dragging = true
			original_position = self.global_position 
			print(item_name, " sürüklenmeye başladı.")
		else:
			pass
			
func _process(_delta):
	if is_dragging:
		self.global_position = get_global_mouse_position()
		
func _unhandled_input(event):
	if is_dragging and event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
		
		print(item_name, " bırakıldı.")
		is_dragging = false 

		var success = false 
		var overlapping_areas = get_overlapping_areas()
		
		for area in overlapping_areas:
			if area.is_in_group("drop_target"):
				print("Başarılı! '", area.name, "' üzerine bırakıldı.")

				if area.has_method("interact"):
					area.interact() 
				
				success = true
				queue_free() 
				break 
		
		if not success:
			print("Geçersiz alan. Eski yerine dönülüyor.")
			self.global_position = original_position
