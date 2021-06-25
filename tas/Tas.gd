extends KinematicBody2D

export var move_speed : = 350.0
export var push_speed : = 64.0
var accel = 40
var speed = 350
var walk_speed = 330

var velocity = Vector2()


func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	var motion : = Vector2()
	motion.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	motion.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	move_and_slide(motion.normalized() * move_speed, Vector2())
	if get_slide_count() > 0:
		check_box_collision(motion)
		
	if Input.is_action_pressed("left"):
		$AnimatedSprite.flip_h = true
	if Input.is_action_pressed("right"):
		$AnimatedSprite.flip_h = false
	
	
func check_box_collision(motion: Vector2):
	if(abs(motion.x) + abs(motion.y)) > 1:
		return
	var coin : = get_slide_collision(0).collider as Coin
	if coin:
		coin.push(push_speed * motion)
