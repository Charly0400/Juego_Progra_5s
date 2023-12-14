extends Node

@export var user: String
var ServerPlayerID : int
var PlayerConnected : bool 
var button : Button
# Called when the node enters the scene tree for the first time.
func _process(delta):
	if PlayerConnected == true:
		$HTTPRequest.request("https://silicon-exuberant-cantaloupe.glitch.me/joinRoom?id=" + str(ServerPlayerID))

func _ready():
	$HTTPRequest.request_completed.connect(_onComplete)
	$HTTPRequest.request("https://silicon-exuberant-cantaloupe.glitch.me/joinServer?name="+user)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _onComplete (result, response_code, headers, body):
	print(body.get_string_from_utf8())
	var JSONRes = JSON.parse_string(body.get_string_from_utf8())
	print(JSONRes.id)
	PlayerConnected = true
	$HTTPRequest.request_completed.disconnected(_onComplete)
	$HTTPRequest.request_completed.connect(_OnCompJoinRoom)
	
func _OnCompJoinRoom (result, response_code, headers, body):
	print(body.get_string_from_utf8())

func _GetToID(String):
	pass

