extends Node

@export var sfx: Array[AudioStream]
var step_player: AudioStreamPlayer = null
var steps_should_play: bool = false


func play_sfx(index: int, volume_db: float = 0.0):
	var player = AudioStreamPlayer.new()
	add_child(player)
	player.stream = sfx[index]
	player.volume_db = volume_db
	player.play()
	await player.finished
	player.queue_free()
