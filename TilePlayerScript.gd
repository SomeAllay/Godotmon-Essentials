extends Area2D

var TileSize = 16
var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}
var CanMove = false
@onready var ray = $RayCast2D
var AnimationSpeed = 4.0
var InPauseMenu = false
var SaveData = SaveScript.GameData
var CanPM = false


func _ready():
	position = position.snapped(Vector2.ONE * TileSize)
	position += Vector2.ONE * TileSize/2

func _on_timer_timeout():
	CanMove = true
func _process(delta):
	if $PauseMenu.visible == false and Input.is_action_just_pressed("ui_cancel"):
		InPauseMenu = true
		$PauseMenu.visible = true
		$Timer2.start()
	if $PauseMenu.visible == true and Input.is_action_just_pressed("ui_text_backspace"):
		InPauseMenu = false
		$PauseMenu.visible = false
		$Timer2.start()
	for dir in inputs.keys():
		if !ray.is_colliding():
			if CanMove == true:
				if Input.is_action_pressed(dir):
					var tween = create_tween()
					tween.tween_property(self, "position",
						position + inputs[dir] * TileSize, 1.0/AnimationSpeed).set_trans(Tween.TRANS_LINEAR)
					CanMove = false
					$Timer.start()
			


func _on_button_3_pressed():
	SaveData.GLOBAL_POSITION = global_position
	SaveData.POKEMON1 = GlobalVars.PkmnRes1
	


func _on_button_4_pressed():
	global_position = SaveData.GLOBAL_POSITION
	GlobalVars.PkmnRes1 = SaveData.POKEMON1


func _on_timer_2_timeout():
	CanPM = true
