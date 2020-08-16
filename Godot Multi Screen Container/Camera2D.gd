extends Camera2D

export var tween_dur = 1

onready var tween = $Tween

var ui_rect

var slot_x = 0
var slot_y = 0


func _ready():
	Events.connect('container_rect_updated', self, '_container_rect_updated')


func _process(_delta):
	if Input.is_action_just_pressed('ui_right'):
		slot_x += 1
		tween.interpolate_property(self, 'position',
			Vector2((slot_x-1) * ui_rect.size.x, slot_y * ui_rect.size.y),  # current pos
			Vector2(slot_x * ui_rect.size.x, slot_y * ui_rect.size.y),  # new pos
			tween_dur, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		tween.start()
	if Input.is_action_just_pressed('ui_left'):
		slot_x -= 1
		tween.interpolate_property(self, 'position',
			Vector2((slot_x+1) * ui_rect.size.x, slot_y * ui_rect.size.y),  # current pos
			Vector2(slot_x * ui_rect.size.x, slot_y * ui_rect.size.y),  # new pos
			tween_dur, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		tween.start()
	if Input.is_action_just_pressed('ui_up'):
		slot_y -= 1
		tween.interpolate_property(self, 'position',
			Vector2(slot_x * ui_rect.size.x, (slot_y+1) * ui_rect.size.y),  # current pos
			Vector2(slot_x * ui_rect.size.x, slot_y * ui_rect.size.y),  # new pos
			tween_dur, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		tween.start()
	if Input.is_action_just_pressed('ui_down'):
		slot_y += 1
		tween.interpolate_property(self, 'position',
			Vector2(slot_x * ui_rect.size.x, (slot_y-1) * ui_rect.size.y),  # current pos
			Vector2(slot_x * ui_rect.size.x, slot_y * ui_rect.size.y),  # new pos
			tween_dur, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		tween.start()

func _container_rect_updated(rect):
	ui_rect = rect
	position = Vector2(slot_x * ui_rect.size.x, slot_y * ui_rect.size.y)
