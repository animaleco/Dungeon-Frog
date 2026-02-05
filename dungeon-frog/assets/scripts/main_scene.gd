extends Node2D

@onready var level_manager: LevelManager = $level_manager

func _ready() -> void:
	level_manager.level_loaded.connect(_on_level_loaded)
	level_manager._create_level(0)
	
func _on_level_loaded(level: Level):
	level.player.player_died.connect(level_manager._reset_level)
	level.coin_container.all_coins_collected.connect(level_manager.next_level, CONNECT_ONE_SHOT)
