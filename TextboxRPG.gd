extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (String) var text ="test"
onready var length =0
# Called when the node enters the scene tree for the first time.
func _ready():
	$Tween.interpolate_property(self,"length",0,text.length(),text.length()*0.04)
	$Tween.start()
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$MarginContainer/ColorRect/MarginContainer/ColorRect/RichTextLabel.text=text.left(length)
