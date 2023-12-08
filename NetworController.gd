extends Node

@export var user: String
# Called when the node enters the scene tree for the first time.
func _ready():
	$HTTPRequest.request_completed.connect(_onComplete)
	$HTTPRequest.request("https://silicon-exuberant-cantaloupe.glitch.me/joinServer?name="+user)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _onComplete (result, response_code, headers, body):
	print(body.get_string_from_utf8())

func _GetToID(String):
	pass

