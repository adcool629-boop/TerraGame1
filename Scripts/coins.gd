extends Area2D
@onready var CoinLabel = $CoinLabel
var collected: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CoinLabel.visible = false
	CoinLabel.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if collected:
		return
	collected = true
	$CoinSound.play()
	CoinLabel.visible = true
	$CoinTimer.start()
	CoinLabel.show()
	var CoinNumber = get_parent()
	CoinNumber.CoinAmount += 1
	CoinNumber.CoinCounter.text = "Coin Counter:" + str(CoinNumber.CoinAmount)
	CoinNumber.FinishText.text = "You Collected " +str(CoinNumber.CoinAmount) + "/36\nCoins Total"
func _on_coin_timer_timeout() -> void:
	queue_free()
