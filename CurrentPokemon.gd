extends Node2D

@export var CPResource: Resource
func _UpdateSprite():
	$Sprite2D.texture = CPResource.get("Sprite")
func _ready():
	_UpdateSprite()
	GlobalVars._UpdatePokemon()
