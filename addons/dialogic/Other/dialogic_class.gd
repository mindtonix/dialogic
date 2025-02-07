extends Node
class_name Dialogic


static func start(timeline: String):
	var dialog = load("res://addons/dialogic/Dialog.tscn")
	var d = dialog.instance()
	for t in DialogicUtil.get_timeline_list():
		if t['name'] == timeline:
			d.timeline = t['file'].replace('.json', '')
			return d
	d.dialog_script = {
		"events":[{"character":"","portrait":"",
		"text":"[Dialogic Error] Loading dialog [color=red]" + timeline + "[/color]. It seems like the timeline doesn't exists. Maybe the name is wrong?"}]
	}
	return d


static func get_var(variable: String):
	var glossary = DialogicUtil.load_glossary()
	for g in glossary:
		if glossary[g]['name'] == variable:
			return glossary[g]
	
	return {}


static func set_var(variable: String):
	pass
