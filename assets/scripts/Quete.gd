extends HBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (String) var nom = "default_value"
export (String) var lvl = "default_value"
export (bool) var is_first=false
export (bool) var is_second=false
export (bool) var is_third=false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text=nom
	$Label2.text=lvl
	if is_third:
		$TextureRect.texture=load("res://assets/img/bronze_trophy_32x32_2.png")
	elif is_second:
		$TextureRect.texture=load("res://assets/img/silver_trophy_32x32_2.png")
	elif is_first:
		$TextureRect.texture=load("res://assets/img/gold_trophy_32x32_2.png")
	else:
		$TextureRect.texture=null
	pass # Replace with function body.

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
