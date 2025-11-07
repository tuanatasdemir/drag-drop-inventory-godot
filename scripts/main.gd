extends Node2D

@onready var win_label = $Sprite2D
@onready var win_label_anim = $Sprite2D/AnimationPlayer
@export var item_name = "potion3"
@onready var music_play = $Music
@onready var tutorial_label = $Tutorial
@onready var tutorial_label_anim = $Tutorial/AnimationPlayer

var game_won = false

func _ready():
	win_label.visible = false
	music_play.play()
	tutorial_label.visible = true
	tutorial_label_anim.play("sallanma")
	await get_tree().create_timer(5.0).timeout
	tutorial_label.hide()
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
		
	if not game_won:
		if Inventory.has_item("potion3"):
			game_won = true
			win_label.visible = true
			win_label_anim.play("sallanma")
			print("Oyun bitti!")
			
