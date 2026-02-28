extends Node2D
@onready var empty_boss_battle: TextureRect = $"empty boss battle"
@onready var attack: TextureRect = $attack
@onready var player_ar: TextureRect = $"player + ar"
@onready var run_success_fail: Label = $"run success_fail"
@onready var health: Label = $"player + ar/health"
@onready var stamina: Label = $"player + ar/stamina"
@onready var attacks_used: Label = $"attacks used"
var number = 0
var attack_no = 0


func _ready() -> void:
	attack.visible = false
	run_success_fail.visble = false
	attacks_used.visible = false

func _process(delta: float) -> void:
	health.text += Globals.health
	stamina.text += Globals.stamina
	if Globals.health < 0 or Globals.stamina < 0:
		run_success_fail.text = "ran out of health/stamina. you loose"
		run_success_fail.visble = true
		await get_tree().create_timer(3.0).timeout
		run_success_fail.visible = false
		get_tree().quit()
	if Globals.enemy_health < 0:
		run_success_fail.text = "boss battle completed!"
		run_success_fail.visble = true
		await get_tree().create_timer(3.0).timeout
		run_success_fail.visible = false
		get_tree().quit() #FIX THIS

func _on_attack_button_pressed() -> void:
	attack.visible = true
	

func _on_run_button_pressed() -> void:
	if attack.visible != true:
		number = randi_range(0, 100)
		if number > 50:
			run_success_fail.text = "run success!"
			run_success_fail.visble = true
		else:
			run_success_fail.text = "run fail!"
			run_success_fail.visble = true
		await get_tree().create_timer(3.0).timeout
		run_success_fail.visible = false
	else:
		run_success_fail.text = "cannot run mid match!"
		run_success_fail.visble = true
		await get_tree().create_timer(3.0).timeout
		run_success_fail.visible = false


func _on_attack_1_button_3_pressed() -> void:
	attacks_used.text = "aschen chains used: blinds the enemy. dealth 20 damage"
	Globals.stamina -= 20
	Globals.enemy_health -= 20
	attacks_used.visble = true
	await get_tree().create_timer(3.0).timeout
	attacks_used.visible = false
	enemy_attack()
	Globals.stamina += 5

func _on_attack_2_button_4_pressed() -> void:
	attacks_used.text = "eternal sentence used: shadows engulf the enemy. dealth 30 damage"
	Globals.stamina -= 20
	Globals.enemy_health -= 20
	attacks_used.visble = true
	await get_tree().create_timer(3.0).timeout
	attacks_used.visible = false
	enemy_attack()
	Globals.stamina += 5


func _on_attack_3_button_5_pressed() -> void:
	attacks_used.text = "soul verdict used: you slam your scythe into the ground. dealth 50 damage"
	Globals.stamina -= 40
	Globals.enemy_health -= 50
	attacks_used.visble = true
	await get_tree().create_timer(3.0).timeout
	attacks_used.visible = false
	enemy_attack()
	Globals.stamina += 5


func _on_attack_4_button_6_pressed() -> void:
	attacks_used.text = "infernal harvest used: you reap their soul. dealth 40 damage"
	Globals.stamina -= 30
	Globals.enemy_health -= 40
	attacks_used.visble = true
	await get_tree().create_timer(3.0).timeout
	attacks_used.visible = false
	enemy_attack()
	Globals.stamina += 5

func enemy_attack():
	attack_no = randi_range(0,4)
	attacks_used.text = str(Globals.enemy_attacks[attack_no][0]) + " used: " + str(Globals.enemy_attacks[attack_no][1]) + "deals " + str(Globals.enemy_attacks[attack_no][2]) + "damage"
	attacks_used.visble = true
	await get_tree().create_timer(3.0).timeout
	attacks_used.visible = false
	Globals.health -= int(Globals.enemy_attacks[attack_no][2])
