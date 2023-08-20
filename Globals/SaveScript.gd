extends Node

var SaveGame = "user://Savegame.txt"
var GameData = {"GLOBAL_POSITION": Vector2.ZERO, "POKEMON1": GlobalVars.CurrentPokemon}

func _ready():
	SaveData(GameData)
	
func SaveData(content):
	var SaveFile = FileAccess.open(SaveGame, FileAccess.WRITE)
	SaveFile.store_var(content)
	SaveFile = null
	
func LoadData():
	var SaveFile = FileAccess.open(SaveGame, FileAccess.READ)
	var content = SaveFile.get_var()
	return content
