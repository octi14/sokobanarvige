extends TileMap
class_name Level

func _ready():
	for children in get_children():
		if children is GridCoin:
			children._initialize(self)
