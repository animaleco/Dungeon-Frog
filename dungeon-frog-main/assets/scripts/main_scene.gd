extends Node2D

@onready var level_manager: LevelManager = $level_manager
@onready var game_controller: GameController = $GameController

func _ready() -> void:
	level_manager.level_loaded.connect(_on_level_loaded)
	level_manager._load_level()
	
func _on_level_loaded(level: Level):
	# Player died
	if not level.player.player_died.is_connected(level_manager._reset_level):
		level.player.player_died.connect(level_manager._reset_level)
	
	# All coins - SIEMPRE reconectar porque ONE_SHOT se auto-desconecta
	if level.coin_container.all_coins_collected.is_connected(level_manager.next_level):
		level.coin_container.all_coins_collected.disconnect(level_manager.next_level)
	
	level.coin_container.all_coins_collected.connect(level_manager.next_level, CONNECT_ONE_SHOT)
