extends PanelContainer

@export var fade_in_seconds: float = 0.5
@export var fade_out_seconds: float = 4
@onready var tooltip_richtext: RichTextLabel = $VBoxContainer/TooltipText
var tween: Tween

func _ready() -> void:
	modulate = Color.TRANSPARENT

func show_tooltip(text: String) -> void:
	if tween:
		tween.kill()
		
	tooltip_richtext.text = text
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_callback(show)
	tween.tween_property(self, "modulate", Color.WHITE, fade_in_seconds)
	tween.connect("finished", hide_tooltip)

func hide_tooltip() -> void:
	if tween:
		tween.kill()
		
	tween = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "modulate", Color.TRANSPARENT, fade_out_seconds)
	tween.tween_callback(hide)
