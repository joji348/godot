extends CharacterBody2D

var missil = preload("res://cenas/missil.tscn")

@onready var time_movimento = $Timer
@onready var animation_alien = $AnimationPlayer
@onready var spawn_point = $spawnpoint

var origin = 0
var distancia = 10
var passo = 7
var direction = 1

signal alien_eliminado

func _ready():
	time_movimento.start()
	origin = self.position.x



func _on_timer_timeout():
	#print(self.position.x)
	self.position.x += direction * passo
	if self.position.x >= origin + distancia or self.position.x <= origin - distancia:
		direction *= -1

func explosion():
	animation_alien.play("destroyed")
	

func elimination():
	emit_signal("alien_eliminado", self)
	get_parent().remove_child(self)
	queue_free()

func disparar():
	var missil = missil.instantiate()
	missil.global_position = spawn_point.global_position
	get_parent().add_child(missil)



