extends Label

func _process(delta):
    var texts := PoolStringArray()

    texts.append("OS:")
    texts.append("-----------")
    texts.append("Name: %s" % [OS.get_name()])
    texts.append("Locale: %s" % [OS.get_locale()])
    texts.append("Has Touchscreen: %s" % [OS.has_touchscreen_ui_hint()])
    texts.append("Virtual Keyboard Height: %s" % [OS.get_virtual_keyboard_height()])
    texts.append("")

    texts.append("Audio Drivers:")
    texts.append("-----------")
    for idx in OS.get_audio_driver_count():
        texts.append("#%d - %s" % [idx, OS.get_audio_driver_name(idx)])
    texts.append("")

    texts.append("Video Drivers:")
    texts.append("-----------")
    for idx in OS.get_video_driver_count():
        var is_current = OS.get_current_video_driver() == idx
        texts.append("#%d - %s%s" % [idx, OS.get_video_driver_name(idx), "" if !is_current else " (Current)"])
    texts.append("")

    texts.append("Performance:")
    texts.append("-----------")
    texts.append("Processor Count: %s" % [OS.get_processor_count()])
    texts.append("Memory Used (Static): %s" % [OS.get_static_memory_usage()])
    texts.append("Memory Used (Peak): %s" % [OS.get_static_memory_peak_usage()])
    texts.append("Memory Used (Dynamic): %s" % [OS.get_dynamic_memory_usage()])
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
