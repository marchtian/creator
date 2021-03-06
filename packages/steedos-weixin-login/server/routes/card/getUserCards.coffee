
# 获取用户所有card
JsonRoutes.add 'get', '/api/steedos/weixin/cards', (req, res, next) ->
	userId = Steedos.getUserIdFromAuthToken(req, res);

	#获取用户所有工作区
#	space_users = Creator.getCollection("space_users").find({user: userId}, {fields: {space: 1}}).fetch()
#
#	user_spaces = _.pluck(space_users, "space")

	#获取用户会员卡信息
	user_cards = Creator.getCollection("vip_card").find({user: userId}, {fields: {_id: 1, card_number: 1, user: 1, grade: 1, space: 1, balance: 1}})

	data = {cards: []}

	allBalance = 0.00
	user_cards.forEach (card)->
		allBalance += card.balance
		space = Creator.getCollection("spaces").findOne({_id: card.space})
		data.cards.push {_id: card._id, card_number: card.card_number, grade: card.grade, name: space?.name}
	data.allBalance = allBalance

	JsonRoutes.sendResult res, {
		code: 200,
		data: data
	}