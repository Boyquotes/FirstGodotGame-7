extends CharacterBody2D

@export var speed: float = 32.0

# referência a objetos
@export var sprite: Sprite2D = null
@export var animation: AnimationPlayer = null

func _physics_process(_delta):
	var direction: Vector2 = Vector2(
		Input.get_axis("ui_left", "ui_right"), # movimentação no eixo X
		Input.get_axis("ui_up", "ui_down"), # movimentação no eixo Y
	).normalized() # equiparar a movimentação no eixo X e Y com a movimentação na diagonal
	
	
	velocity = speed * direction # para move_and_slide reconhecer a varíavel tem que ter nome 'velocity' ((LOUCURA))
	move_and_slide() # recebe velocity por parâmetro automaticamente ((LOUCURA))
	animate()
	
	
## end _physics_process

func animate():
	if (velocity.x > 0):
		sprite.flip_h = false
		
	if (velocity.x < 0):
		sprite.flip_h = true
	
	if (velocity != Vector2.ZERO):
		animation.play("running(RIGHT)")
		return
	
	animation.play("idle")
## end animate
