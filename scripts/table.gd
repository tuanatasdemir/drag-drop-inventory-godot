extends Area2D

enum  STATE {
	BOS,
	POTION1,
	POTION2
}

var current_state = STATE.BOS

func interact():
	match current_state:
		STATE.BOS:
			print("Masa boş. Bir şey ekle.")
			
			if Inventory.has_item("potion1"):
				print("Potion1 masaya eklendi.")
				Inventory.remove_item("potion1")
				current_state = STATE.POTION1
				
		STATE.POTION1:
			print("Masada potion1 var. Şimdi potion2 ekle.")
			
			if Inventory.has_item("potion2"):
				print("Potion2 masaya eklendi.")
				Inventory.remove_item("potion2")
				craft_potion3()

func craft_potion3():
	
	Inventory.add_item("potion3") 
	current_state = STATE.BOS
	print("Potion 3 üretildi!")


