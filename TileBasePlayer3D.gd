extends Area3D

var TileSize = 2
var inputs = {"right": Vector3.RIGHT,
			"left": Vector3.LEFT,
			"up": Vector3.FORWARD,
			"down": Vector3.BACK}
var CanMove = true
@onready var ray = $RayCast3D
var AnimationSpeed = 4.0
var InPauseMenu = false
var SaveData = SaveScript.GameData


func _ready():
	position = position.snapped(Vector3.ONE * TileSize)
	position += Vector3.ONE * TileSize/2
func _process(delta):
	for dir in inputs.keys():
		$RayCast3D.force_raycast_update()
		if !ray.is_colliding():
			if CanMove == true:
				if Input.is_action_pressed(dir):
					var tween = create_tween()
					tween.tween_property(self, "position",
						position + inputs[dir] * TileSize, 1.0/AnimationSpeed).set_trans(Tween.TRANS_LINEAR)
					CanMove = false
					$MoveTimer.start()
			else:
				ray.force_raycast_update()
	if ray.is_colliding():
		if ray.get_collider().has_method("Stairs"):
			var Collider = ray.get_collider()
			if Collider.UpDown == true:
				position.y += 1.5
				position.x += 1
				print("yeyey")
				Collider.UpDown = false
			if Collider.UpDown == false:
				position.y -= 0
				Collider.UpDown = true
				print("nono")
	if Input.is_action_just_pressed("down"):
		$AnimationPlayer.play("WalkDown")
	if Input.is_action_just_pressed("left"):
		$AnimationPlayer.play("WalkLeft")
	if Input.is_action_just_pressed("up"):
		$AnimationPlayer.play("WalkUp")
	if Input.is_action_just_pressed("right"):
		$AnimationPlayer.play("WalkRight")
		
func _on_move_timer_timeout():
	CanMove = true
