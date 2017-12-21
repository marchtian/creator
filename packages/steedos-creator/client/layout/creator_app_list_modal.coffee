Template.creator_app_list_modal.helpers
	apps: ()->
		apps = []
		_.each Creator.Apps, (v, k)->
			apps.push v
		return apps

	app_objects: ()->
		objects = []
		_.each Creator.Objects, (v, k)->
			objects.push v
		return objects

	object_url: ()->
		return Creator.getObjectUrl(this.name, null)


Template.creator_app_list_modal.events
	'click .control-app-list': (event) ->
		$(event.currentTarget).closest(".app-sction-part-1").toggleClass("slds-is-open")

	'click .control-project-list': (event) ->
		$(event.currentTarget).closest(".app-sction-part-2").toggleClass("slds-is-open")

	'click .object-launcher-link,.app-launcher-link': (event, template) ->
		Modal.hide(template)