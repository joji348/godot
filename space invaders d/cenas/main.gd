extends Node2D

var pontos = 0
@onready var label_pontos = $VBoxContainer/LabelPontos


func Somar_pontos_alien(a):
	pontos += 100
	label_pontos.text = str(pontos)

func somar_bonus():
	pontos += 500
	label_pontos.text = str(pontos)

