extends Control

var PlayerCanAct = false
var OpponentCanAct = false
var PlayerActing = false
var OpponentActing = false
var MoveRes: Resource
var TrainerKeys = 1

func _ready():
	$BattleButtons.visible = false
	$OptionLayer.visible = true
	$OptionLayer/Attack.grab_focus()
	#if GlobalVars.CurrentPokemon != null:
		#$PokemonLayer/CurrentPokemon.CPResource = GlobalVars.CurrentPokemon
		#print($PokemonLayer/CurrentPokemon.CPResource)
	if GlobalVars.TrainerInStorage != null:
		$AnimationPlayer.play("TrainerTransition")
		await $AnimationPlayer.animation_finished
		$AnimationPlayer.play_backwards("TrainerTransition")
		var TrainerRes = GlobalVars.TrainerInStorage
		$PokemonLayer/OpponentPokemon.OPResource = TrainerRes.PokemonDict.find_key(TrainerKeys)
		PlayerCanAct = true
	else:
		PlayerCanAct = true
	$HpLayer/ProgressBar.max_value = GlobalVars.CurrentPokemonHP
	$HpLayer/ProgressBar2.max_value = $PokemonLayer/OpponentPokemon.OPResource["HP"]
		
func _process(delta):
	if $BattleButtons.visible == true and Input.is_action_just_pressed("ui_text_backspace"):
		$BattleButtons.visible = false
		$OptionLayer.visible = true
	if PlayerCanAct == true and PlayerActing == false:
		_PlayerAct()
	if OpponentCanAct == true and OpponentActing == false:
		_EnemyAct()
	if $OptionLayer.visibility_changed:
		$OptionLayer/Attack.grab_focus()
	if $BattleButtons.visibility_changed:
		$BattleButtons/Move1.grab_focus()
		
func _PlayerAct():
#	$BattleButtons/Move1.text = $PokemonLayer/CurrentPokemon.CPResource["Move1"]
#	$BattleButtons/Move2.text = $PokemonLayer/CurrentPokemon.CPResource["Move2"]
#	$BattleButtons/Move3.text = $PokemonLayer/CurrentPokemon.CPResource["Move3"]
#	$BattleButtons/Move4.text = $PokemonLayer/CurrentPokemon.CPResource["Move4"]
	if $BattleButtons/Move1.pressed:
		MoveRes = $PokemonLayer/CurrentPokemon.CPResource["Move1"]
		PlayerActing = true
		$HpLayer/ProgressBar2.value -= MoveRes.get("MoveDamage")
		PlayerActing = false
		PlayerCanAct = false
		OpponentCanAct = true
	if $BattleButtons/Move2.pressed:
		MoveRes = $PokemonLayer/CurrentPokemon.CPResource["Move2"]
		PlayerActing = true
		$HpLayer/ProgressBar2.value -= MoveRes.get("MoveDamage")
		PlayerActing = false
		PlayerCanAct = false
		OpponentCanAct = true
	if $BattleButtons/Move3.pressed:
		MoveRes = $PokemonLayer/CurrentPokemon.CPResource["Move3"]
		PlayerActing = true
		$HpLayer/ProgressBar2.value -= MoveRes.get("MoveDamage")
		PlayerActing = false
		PlayerCanAct = false
		OpponentCanAct = true
	if $BattleButtons/Move4.pressed:
		MoveRes = $PokemonLayer/CurrentPokemon.CPResource["Move4"]
		PlayerActing = true
		$HpLayer/ProgressBar2.value -= MoveRes.get("MoveDamage")
		PlayerActing = false
		PlayerCanAct = false
		OpponentCanAct = true
		
func _EnemyAct():
	var random = RandomNumberGenerator.new()
	random.randf_range(1, 4)
	if random == 1:
		OpponentActing = true
		MoveRes = $PokemonLayer/OpponentPokemon.OPResource["Move1"]
		$HpLayer/ProgressBar.value -= MoveRes.get("MoveDamage")
		OpponentActing = false
		OpponentCanAct = false
	if random == 2:
		OpponentActing = true
		MoveRes = $PokemonLayer/OpponentPokemon.OPResource["Move2"]
		$HpLayer/ProgressBar.value -= MoveRes.get("MoveDamage")
		OpponentActing = false
		OpponentCanAct = false
	if random == 3:
		OpponentActing = true
		MoveRes = $PokemonLayer/OpponentPokemon.OPResource["Move3"]
		$HpLayer/ProgressBar.value -= MoveRes.get("MoveDamage")
		OpponentActing = false
		OpponentCanAct = false
	if random == 4:
		OpponentActing = true
		MoveRes = $PokemonLayer/OpponentPokemon.OPResource["Move4"]
		$HpLayer/ProgressBar.value -= MoveRes.get("MoveDamage")
		OpponentActing = false
		OpponentCanAct = false

func _on_attack_pressed():
	print("whoosos")
	$BattleButtons.visible = true
	$OptionLayer.visible = false

