extends CanvasLayer

# Notificacion a main de que el boton se presiono.
signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	print(text)
	

func show_game_over():
	show_message("Game Over")
	await $MessageTimer.timeout
	
	$Message.text = "Juego chico"
	$Message.show()
	
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()
	
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_score(score):
	$ScoreLabel.text = str(score)

func _on_start_button_pressed() -> void:
	print("Presionado")
	$StartButton.hide()
	start_game.emit() 

func _on_message_timer_timeout():
	$Message.hide()
