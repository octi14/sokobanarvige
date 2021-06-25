extends Coin
class_name GridCoin

onready var tween : Tween = $Tween

export var sliding_time : = 0.5

var tilemap : TileMap
var sliding : = false

func _initialize(_tilemap: TileMap):
	tilemap = _tilemap
	position = calculate_destination(Vector2())

func _ready():
	pass


func push(velocity: Vector2):
	if sliding:
		return
	var move_to : Vector2 = calculate_destination(velocity.normalized())
	if can_move(move_to):
		tween.interpolate_property(self,
			"global_position",
			global_position,
			move_to,
			sliding_time,
			Tween.TRANS_CUBIC,
			Tween.EASE_OUT)
		tween.start()
		sliding = true
		yield(tween, "tween_completed")
		sliding = false
		
func can_move(move_to: Vector2):
	var future_transform : = Transform2D(transform)
	future_transform.origin = move_to
	return not test_move(future_transform, Vector2())
	
func calculate_destination(direction: Vector2):
	var tilemap_position = tilemap.world_to_map(global_position) + direction
	return tilemap.map_to_world(tilemap_position)
