Creator.Objects.contacts = 
	name: "contacts"
	label: "Contacts"
	icon: "ion-ios-people-outline"
	fields:
		name: 
			label: "Name"
			type: "text"
			defaultValue: ""
			description: ""
			inlineHelpText: ""
			required: true
		description: 
			label: "Description"
			type: "textarea"
	list_views:
		default:
			columns: ["name", "description", "modified"]
	permissions:
		default:
			allowCreate: true
			allowDelete: true
			allowEdit: true
			allowRead: true
			modifyAllRecords: false
			viewAllRecords: false 