extends Node

@export var sfx: Array[AudioStream]
var step_player: AudioStreamPlayer = null
var steps_should_play: bool = false

func _ready() -> void:
	step_player = AudioStreamPlayer.new()
	add_child(step_player)
	if sfx.size() > 0:
		step_player.stream = sfx[0]

func _process(_delta):
	# Verifica constantemente si debería estar sonando
	if steps_should_play and not step_player.playing:
		step_player.play()

func play_sfx(index: int):
	var player = AudioStreamPlayer.new()
	add_child(player)
	player.stream = sfx[index]
	player.play()
	await player.finished
	player.queue_free()

func play_steps():
	steps_should_play = true

func stop_steps():
	steps_should_play = false
	step_player.stop()
