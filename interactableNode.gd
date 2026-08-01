extends Area2D
class_name InteractableNode

@export var target_body : Array[Node2D] ## The body or bodies that can interact with this object (should be the player usually)
@export var interaction_hint : Node2D ## An optional node that is shown when the body is in range, to show that you can interact with them
@export var trigger : String = "ui_accept" ## The input that will trigger the interaction
@export var auto_interact : bool = false ## If enabled, the interaction triggers automatically when the target enters the area, instead of waiting for the trigger input
@export var disappear_on_interact : bool = false ## If enabled, this object is removed from the scene after it has been interacted with

var interactable : bool = false;
var interacting_body : Node2D;

signal interacted_with(body : Node2D)
signal interaction_ended()

func _ready() -> void:
	if interaction_hint:
		var old_hint_position = interaction_hint.global_position;
		add_child(interaction_hint);
		interaction_hint.global_position = old_hint_position;
		interaction_hint.visible = false;
	self.connect("body_entered", _on_body_entered)
	self.connect("body_exited", _on_body_exited)
	pass

func _on_body_entered(body: Node2D) -> void:
	if body in target_body:
		interacting_body = body
		interactable = true;
		if auto_interact:
			_do_interact()
		elif interaction_hint:
			interaction_hint.visible = true;

func _on_body_exited(body: Node2D) -> void:
	if body in target_body:
		if interactable:
			emit_signal("interaction_ended")
		if interaction_hint:
			interaction_hint.visible = false;
		interacting_body = null
		interactable = false;

func _input(event: InputEvent) -> void:
	if auto_interact:
		return
	if event.is_action_pressed(trigger) and interactable:
		if interaction_hint:
			interaction_hint.visible = false;
		_do_interact()

func _do_interact() -> void:
	var body = interacting_body
	_interact()
	emit_signal("interacted_with", body)
	if disappear_on_interact:
		interactable = false;
		interacting_body = null
		queue_free()

func _interact(): ## Stub that you can override in child node
	pass
