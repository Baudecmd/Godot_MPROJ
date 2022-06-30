extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


signal item_buy(price)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_button_down():
	queue_free()
	pass # Replace with function body.


func _on_HBoxContainer_item_buy(price):
	emit_signal("item_buy",price)
	pass # Replace with function body.


func _on_HBoxContainer2_item_buy(price):
	emit_signal("item_buy",price)
	pass # Replace with function body.


func _on_HBoxContainer3_item_buy(price):
	emit_signal("item_buy",price)
	pass # Replace with function body.


func _on_HBoxContainer4_item_buy(price):
	emit_signal("item_buy",price)
	pass # Replace with function body.
