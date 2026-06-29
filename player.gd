extends CharacterBody2D

const STRENGTH = 300.0
const BULLET_SPEED = 300.0
const BULLET = preload("uid://cntyjgpwceu45")

var mouse_pos: Vector2
var dir: Vector2

@onready var player: CharacterBody2D = $"."
@onready var world: Node2D = $".."

func _physics_process(delta: float) -> void:
	mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)

	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_just_pressed("ui_accept"):
		velocity = STRENGTH * -Vector2.from_angle(player.rotation)
		var bullet = BULLET.instantiate()
		add_child(bullet)
		bullet.position = Vector2(14,1)
		bullet.velocity = BULLET_SPEED * Vector2.from_angle(player.rotation)
		bullet.reparent(world)
		

	move_and_slide()
