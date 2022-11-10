extends KinematicBody2D

var scene
var currentScene
var player
var PlayerPos

var Self
var selfPosition

func _ready():
	scene = get_tree().root
	currentScene = scene.get_child(scene.get_child_count() - 1)
	player = currentScene.find_node("Player").get_child(0)
	PlayerPos = player.position
	Self = currentScene.find_node("Enemy").get_child(0)
	
	if Self.position - PlayerPos > Self.position:
		self.get_child(1).flip_h = true
	else:
		self.get_child(1).flip_h = false
	
func _process(delta):
	player = currentScene.find_node("Player").get_child(0)
	PlayerPos = player.position
	
func _physics_process(delta):
	print_debug(PlayerPos, Self.position)
	if Self.position - PlayerPos > Self.position:
		self.get_child(1).flip_h = true
	else:
		self.get_child(1).flip_h = false
