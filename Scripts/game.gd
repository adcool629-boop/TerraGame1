extends Node2D
@onready var CoinCounter = $CanvasLayer/CoinCounter
@onready var FinishText = $FinishText
var CoinAmount: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$Music.play(GlobVars.MusicProgress)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
