extends Node

@export var user: String
var ServerPlayerID : int
var PlayerConnected : bool 
var request_in_progress: bool

# Called when the node enters the scene tree for the first time.
func _process(delta):
	if PlayerConnected and not request_in_progress:
		request_in_progress = true
		$HTTPRequest.request("https://silicon-exuberant-cantaloupe.glitch.me/joinRoom?id=" + str(ServerPlayerID))


func _ready():
	PlayerConnected = false
	request_in_progress = false
	$HTTPRequest.request_completed.connect(_onComplete)
	$HTTPRequest.request("https://silicon-exuberant-cantaloupe.glitch.me/joinServer?name="+user)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _onComplete (result, response_code, headers, body):
	print(body.get_string_from_utf8())
	var JSONRes = JSON.parse_string(body.get_string_from_utf8())
	print(JSONRes.id)
	ServerPlayerID = JSONRes.id
	PlayerConnected = true
	request_in_progress = false  # Marcar la solicitud como completada
	$HTTPRequest.request_completed.disconnect(_onComplete)
	$HTTPRequest.request_completed.connect(_OnCompJoinPlayRoom)
	
func _OnCompJoinPlayRoom (result, response_code, headers, body):
	print(body.get_string_from_utf8())

func _GetToID(String):
	pass
