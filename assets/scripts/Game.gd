extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


signal quest_gui_open_from_game
signal leaderboard_gui_open_from_game
signal shop_gui_open_from_game
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_quest_gui_open():
	emit_signal("quest_gui_open_from_game")
	pass # Replace with function body.


func _on_Player_shop_gui_open():
	emit_signal("shop_gui_open_from_game")
	pass # Replace with function body.


func _on_Player_leaderboard_gui_open():
	emit_signal("leaderboard_gui_open_from_game")
	pass # Replace with function body.
