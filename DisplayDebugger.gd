extends Label

func _process(delta):
    var texts := PoolStringArray()

    var viewport := get_viewport()
    var visible_rect := viewport.get_visible_rect()
    texts.append("Viewport:")
    texts.append("-----------")
    texts.append("Size: %s" % [viewport.size])
    texts.append("Visible Size: %s" % [visible_rect.size])
    texts.append("Visible Position: %s" % [visible_rect.position])
    texts.append("")

    texts.append("Screen (Current):")
    texts.append("-----------")
    texts.append("DPI: %s" % [OS.get_screen_dpi()])
    texts.append("Size: %s" % [OS.get_screen_size()])
    texts.append("Position: %s" % [OS.get_screen_position()])
    texts.append("Scale: %s" % [OS.get_screen_scale()])
    texts.append("Max. Scale: %s" % [OS.get_screen_max_scale()])
    texts.append("")

    text = texts.join("\n")
