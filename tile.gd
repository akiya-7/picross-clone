extends Area2D

@export var filled = false
@export var isCrossed = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.animation = "unselected"
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed(&"click") and InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			isCrossed = true;
		_button_click();
		isCrossed = false;
	
		

func _button_click() -> void:
	filled = !filled
	
	if filled && !isCrossed:
		$AnimatedSprite2D.animation = "selected"
	elif filled && isCrossed:
		$AnimatedSprite2D.animation = "x_selected"	
	else:
		$AnimatedSprite2D.animation = "unselected"
