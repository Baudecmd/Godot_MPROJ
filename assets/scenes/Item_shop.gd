extends HBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (String) var nom = "default_value"
export (String) var prix = "prix"
export (bool) var is_open = false
signal item_buy(price)
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text=nom
	$Prix.text=prix

func _on_Tween_tween_all_completed():
	queue_free()
	pass # Replace with function body.


func _on_Button_button_down():
	var final_pos=self.rect_position
	final_pos.x=final_pos.x+500
	$Tween.interpolate_property(self,"rect_position",self.rect_position,final_pos, 0.4,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	emit_signal("item_buy",int($Prix.text))
	pass # Replace with function body.
