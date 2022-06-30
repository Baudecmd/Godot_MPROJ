extends HBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (String) var nom = "default_value"
export (bool) var is_open = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text=nom

func _on_CheckBox_button_down():
	var final_pos=self.rect_position
	final_pos.x=final_pos.x+500
	$Tween.interpolate_property(self,"rect_position",self.rect_position,final_pos, 0.4,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	

	pass # Replace with function body.


func _on_Tween_tween_all_completed():
	queue_free()
	pass # Replace with function body.
