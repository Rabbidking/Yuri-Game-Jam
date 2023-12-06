class_name PlayerKeybindResource
extends Resource

const LEFT : String = "left"
const RIGHT : String = "right"
const UP : String = "up"
const DOWN : String = "down"
const INTERACT : String = "interact"
const PAUSE : String = "pause"

@export var DEFAULT_LEFT_KEY = InputEventKey.new()
@export var DEFAULT_RIGHT_KEY = InputEventKey.new()
@export var DEFAULT_UP_KEY = InputEventKey.new()
@export var DEFAULT_DOWN_KEY = InputEventKey.new()
@export var DEFAULT_INTERACT_KEY = InputEventKey.new()
@export var DEFAULT_PAUSE_KEY = InputEventKey.new()

var left_key = InputEventKey.new()
var right_key = InputEventKey.new()
var up_key = InputEventKey.new()
var down_key = InputEventKey.new()
var interact_key = InputEventKey.new()
var pause_key = InputEventKey.new()
