extends Node

var items = []

func add_item(item_name):
	if not items.has(item_name):
		items.append(item_name)
		print("Envantere eklendi: ", item_name)
		print("Mevcut envanter: ", items)

func has_item(item_name):
	return items.has(item_name)

func remove_item(item_name):
	if has_item(item_name):
		items.erase(item_name)
		print("Envanter silindi: ", item_name)
		
