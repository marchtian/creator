Creator.Objects.OAuth2Clients = 
	name: "OAuth2Clients"
	icon: "entity"
	label: "OAuth2配置"
	enable_search: false
	fields: 
		clientName:
			type:"text"
			label:"名称"
			is_name:true
			required:true
		active:
			type:"boolean"
			label:"是否激活"
			defaultValue:true
		redirectUri:
			type:"text"
			label:"回调URL"
			is_wide:true
			required:true
		clientId:
			type:"text"
			label:"客户端ID"
			is_wide:true
			required:true
			readonly:true
			defaultValue: ()->
				return Random.id()
		clientSecret:
			type:"text"
			label:"Secret"
			is_wide:true
			required:true
			readonly:true
			defaultValue: ()->
				return Random.secret()
		
	list_views:
		default:
			columns:["clientName","active","redirectUri"]
		all:
			label:"所有"
	
	# triggers:
	# 	"before.insert.server.default":
	# 		on: "server"
	# 		when: "before.insert"
	# 		todo: (userId, doc)->
				
	# 		return true
					
	permission_set:
		user:
			allowCreate: false
			allowDelete: false
			allowEdit: false
			allowRead: false
			modifyAllRecords: false
			viewAllRecords: false 
		admin:
			allowCreate: true
			allowDelete: true
			allowEdit: true
			allowRead: true
			modifyAllRecords: true
			viewAllRecords: true 