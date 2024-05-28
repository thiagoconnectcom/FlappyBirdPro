extends RigidBody2D
class_name Player

signal died

export var FLAP_FORCE = -340

onready var animator = $AnimationPlayer

var started = false
var alive = true

func _physics_process(_delta):
	if Input.is_action_just_pressed("flap") && alive:
		if !started:
			start()
		flap()

func start():
	if started: return
	started = true
	gravity_scale = 10.0
	animator.play("flap")

func flap():
	linear_velocity.y = FLAP_FORCE

func die():
	if !alive: return
	alive = false
	animator.stop()
	emit_signal("died")
