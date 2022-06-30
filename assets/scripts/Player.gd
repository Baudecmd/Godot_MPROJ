extends KinematicBody2D



export (int) var speed = 200

var velocity = Vector2()
var is_running_top=false
var is_running_bottom=false
var is_running_left=false
var is_running_right=false
var near_computer=false
var near_shop=false
var near_leaderboard=false
signal quest_gui_open
signal shop_gui_open
signal leaderboard_gui_open

func _ready():
	$ButtonPressedAnimation.visible=false
	$AnimatedSprite.play("idle")
func get_input():
	is_running_bottom=false
	is_running_top=false
	is_running_right=false
	is_running_left=false
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		is_running_right=true
		velocity.x += 1
	if Input.is_action_pressed("left"):
		is_running_left=true
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		is_running_bottom=true
		velocity.y += 1
	if Input.is_action_pressed("up"):
		is_running_top=true
		velocity.y -= 1
		
	if is_running_top:
		$AnimatedSprite.play("walk_top")
	elif is_running_bottom:
		$AnimatedSprite.play("walk_bottom")
	elif is_running_left:
		$AnimatedSprite.play("walk_left")
	elif is_running_right:
		$AnimatedSprite.play("walk_right")
	else:
		$AnimatedSprite.play("idle")

	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	if near_computer and Input.is_action_pressed("use"):
		emit_signal("quest_gui_open")
	if near_shop and Input.is_action_pressed("use"):
		emit_signal("shop_gui_open")
	if near_leaderboard and Input.is_action_pressed("use"):
		emit_signal("leaderboard_gui_open")

func _on_Bureau_body_entered(body):

	near_computer=true
	toggle_key_animation()
	pass # Replace with function body.


func _on_Bureau_body_exited(body):
	near_computer=false
	turn_off_key_animation()
	pass # Replace with function body.

func toggle_key_animation():

	$ButtonPressedAnimation.visible=true
	$ButtonPressedAnimation.play("toggled")

func turn_off_key_animation():
	$ButtonPressedAnimation.visible=false
	$ButtonPressedAnimation.stop()
	
func _on_Shop_body_entered(body):
	near_shop=true
	toggle_key_animation()	
	pass # Replace with function body.


func _on_Shop_body_exited(body):
	near_shop=false
	turn_off_key_animation()
	pass # Replace with function body.


func _on_Leaderboard_body_entered(body):
	near_leaderboard=true
	toggle_key_animation()
	pass # Replace with function body.


func _on_Leaderboard_body_exited(body):
	near_leaderboard=false
	turn_off_key_animation()
	pass # Replace with function body.
