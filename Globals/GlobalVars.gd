extends Node

@export var PlayerScene = preload("res://null_scene.tscn")
@export var LastMap = preload("res://null_scene.tscn")
@export var PokemonData = {
	"CURRENTPOKEMON1": Resource
}
var CurrentPokemon: Resource
var CurrentPokemonHP = 1
var CurrentPokemon2HP = 1
var CurrentPokemon3HP = 1
var CurrentPokemon4HP = 1
var CurrentPokemon5HP = 1
var CurrentPokemon6HP = 1
var CurrentPokemonLevel = 1
var CurrentPokemon2Level = 1
var CurrentPokemon3Level = 1
var CurrentPokemon4Level = 1
var CurrentPokemon5Level = 1
var CurrentPokemon6Level = 1
var CurrentPokemon2: Resource
var CurrentPokemon3: Resource
var CurrentPokemon4: Resource
var CurrentPokemon5: Resource
var CurrentPokemon6: Resource
var PokemonAmount = 1
var TrainerInStorage: Resource
var PkmnRes1 = null

func _ChangeScene():
	var LastMapInst = LastMap.instantiate()
	var PlayerSceneInst = PlayerScene.instantiate()
	LastMap.add_child(PlayerSceneInst)
func _UpdatePokemon():
	CurrentPokemon = PokemonData.find_key(1)
	CurrentPokemon2 = PokemonData.find_key(2)
	CurrentPokemon3 = PokemonData.find_key(3)
	CurrentPokemon4 = PokemonData.find_key(4)
	CurrentPokemon5 = PokemonData.find_key(5)
	PkmnRes1 = Resource.new()
	PkmnRes1.set_script("res://Globals/PokemonBase.gd")
	PkmnRes1.set("HP", CurrentPokemonHP)
	PkmnRes1.set("Name", CurrentPokemon.get("Name"))
	CurrentPokemonHP = CurrentPokemon.get("HP")
	CurrentPokemon2HP = CurrentPokemon2.get("HP")
	CurrentPokemon3HP = CurrentPokemon3.get("HP")
	CurrentPokemon4HP = CurrentPokemon4.get("HP")
	CurrentPokemon5HP = CurrentPokemon5.get("HP")
	CurrentPokemon6HP = CurrentPokemon6.get("HP")
