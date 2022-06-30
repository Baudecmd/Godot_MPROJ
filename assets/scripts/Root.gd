extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var isQuestVisible=false
onready var isLeaderboardVisible=false
onready var isShopVisible=false
onready var isTextOver=false
onready var UI=preload("res://assets/scenes/UI.tscn")
onready var ShopUI=preload("res://assets/scenes/ShopUI.tscn")
onready var LeaderboardUI=preload("res://assets/scenes/LeaderboardUI.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	$Game.connect("quest_gui_open_from_game",self,"toggleQuest")
	pass # Replace with function body.


func _process(delta):
	if Input.is_action_pressed("mouse_left"):
		$Node.remove_child($Node/TextboxRPG)

func toggleQuest():
	if !isQuestVisible:
		$Node.add_child(UI.instance())
	isQuestVisible=true




func _on_Game_leaderboard_gui_open_from_game():
	if !isLeaderboardVisible:
		$Node.add_child(LeaderboardUI.instance())
	isLeaderboardVisible=true

func _on_Game_shop_gui_open_from_game():
	var instance=ShopUI.instance()
	instance.connect("item_buy",self,"item_buy")
	if !isShopVisible:
		$Node.add_child(instance)
	isShopVisible=true

func item_buy(price):
	var coin_amount=$Node/VBoxContainer/HBoxContainer2/Label.coin_amount
	$Node/VBoxContainer/HBoxContainer2/Tween.interpolate_property($Node/VBoxContainer/HBoxContainer2/Label, "coin_amount",
		coin_amount,coin_amount-price, 1,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Node/VBoxContainer/HBoxContainer2/Tween.start()

	$Node/VBoxContainer/HBoxContainer2/Label.text

