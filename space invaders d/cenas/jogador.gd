extends CharacterBody2D

@export var laser = preload("res://cenas/area_2d.tscn")

@onready var ptoLaser = $pontodoLaser
@onready var timer_disparo = $TimerDisparo
@onready var animation_player = $AnimationPlayer

var direction = Vector2()
const SPEED = 100.0
var pode_disparar = true


func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if Input.is_action_just_pressed("shoot") and pode_disparar == true:
		var l = laser.instantiate()
		l.global_position = ptoLaser.global_position
		get_parent().add_child(l)
		pode_disparar = false
		timer_disparo.start() 

	move_and_slide()



func _on_timer_disparo_timeout():
	pode_disparar = true

func destruir():
	animation_player.play("Destruido")

func eleminado():
	if !self.is_queued_for_deletion():
		get_parent().remove_child(self)
		queue_free()

