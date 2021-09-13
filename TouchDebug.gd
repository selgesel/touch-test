extends Control

export(Color) var begin_color := Color.firebrick
export(Color) var current_color := Color.aquamarine
export(Color) var text_color := Color.gold
export(Color) var line_color := Color.aquamarine
export(float) var circle_radius := 10.0
export(float) var line_width := 1.0
export(Font) var text_font := get_font("font")

var _touches = {}

func _draw():
    var canvas_xform := get_canvas_transform()

    for idx in _touches.keys():
        var touch = _touches[idx]
        var begin = canvas_xform.xform_inv(touch.begin)
        var current = canvas_xform.xform_inv(touch.current)

        draw_set_transform(-get_global_rect().position, 0, Vector2.ONE)

        draw_circle(begin, circle_radius, begin_color)
        draw_string(text_font, begin + Vector2.UP * circle_radius, "#%d (%.2f, %.2f)" % [idx, begin.x, begin.y], text_color)

        draw_circle(current, circle_radius, current_color)
        draw_string(text_font, current + Vector2.UP * circle_radius, "#%d (%.2f, %.2f)" % [idx, current.x, current.y], text_color)

        draw_line(begin, current, line_color, line_width, true)
        draw_string(text_font, begin + (current - begin) / 2, "%.2f" % [current.distance_to(begin)], text_color)

func _input(event):
    if event is InputEventScreenTouch && event.is_pressed():
        if !get_global_rect().has_point(event.position):
            return
        _touches[event.index] = {"begin": event.position, "current": event.position}
    if event is InputEventScreenDrag && _touches.has(event.index):
        _touches[event.index].current = event.position
    if event is InputEventScreenTouch && !event.is_pressed() && _touches.has(event.index):
        _touches.erase(event.index)

func _process(delta):
    update()
