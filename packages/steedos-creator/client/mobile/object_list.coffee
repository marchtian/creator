
Template.object_list_modal.helpers 
	apps: ()->
		apps = []
		_.each Creator.Apps, (v, k)->
			if v.visible != false
				if v._id
					v.url = Steedos.absoluteUrl("/app/#{v._id}/");
				
				apps.push v
		
		return apps
		 

Template.object_list_modal.events 
	"click .object-item": (event, template) ->
		# Session.set("app_id", this.app_id)
		Modal.hide(template)
		 