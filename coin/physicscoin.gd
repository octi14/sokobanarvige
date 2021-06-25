extends Coin
class_name PhysicsCoin



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func push(velocity: Vector2):
	move_and_slide(velocity, Vector2())
	

func _physics_process(delta):
	set_rotation(0)
