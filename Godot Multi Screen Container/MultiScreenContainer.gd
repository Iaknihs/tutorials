extends Container

export var columns = 1


func _ready():
	# update rect_information in camera on ready call
	Events.emit_signal('container_rect_updated', get_rect())
	# make sure layout updates on window size change
	get_tree().get_root().connect('size_changed', self, 'set_some_setting')


func _notification(what):
	if (what==NOTIFICATION_SORT_CHILDREN):
		var children = get_children()
		for i in range(len(children)):
			fit_child_in_rect(
				children[i],
				Rect2(
					Vector2(
						(i%columns) * rect_size.x,  # mod columns to align hori
						floor(i/columns) * rect_size.y  # floor to account for mod
					),  # offset for each child
					rect_size  # each child should be the size of its parent
				)
			)
		Events.emit_signal('container_rect_updated', get_rect())

func set_some_setting():
	# Some setting changed, ask for children re-sort
	queue_sort()
