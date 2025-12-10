extends Node2D

var Tile = preload("res://tile.tscn")

var gameboard: Array[Array] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	_createGameboard(8, 8)
	_displayGameboard()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _createGameboard(length: int, height: int) -> void:
	for row in range(length):
		var tileRow = []
		for col in range(height):
			var tile = Tile.instantiate()
			tileRow.append(tile)
		gameboard.append(tileRow)
	

func _displayGameboard() -> void:
	var tile_size = 32 # tiles are 32x32
	var rows = gameboard.size()
	var cols = gameboard[0].size()

	var board_px = Vector2(cols * tile_size, rows * tile_size)

	# 2. Center this Board node in the viewport
	position = get_viewport_rect().size * 0.5 - board_px * 0.5

	# 3. Add and position tiles relative to the board's top-left
	for row in rows:
		for col in cols:
			var tile = gameboard[row][col]
			tile.position = Vector2(col * tile_size, row * tile_size)
			add_child(tile)
		

	
	
	
