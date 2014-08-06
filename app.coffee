myLayers = Framer.Importer.load "imported/test"

console.log("call_to_action y:" + myLayers.call_to_action.y);

startingHeight = 500
startingOpacity = 0

callToAction = myLayers.call_to_action
callToAction.y = startingHeight
callToAction.opacity = startingOpacity

callToAction2 = myLayers.call_to_action_2
callToAction2.y = startingHeight
callToAction2.opacity = startingOpacity

callToAction3 = myLayers.call_to_action_3
callToAction3.y = startingHeight
callToAction3.opacity = startingOpacity

#            0               1              2
array = [callToAction, callToAction2, callToAction3]
 

animation = (layer) ->
	theEnterAnimation = layer.animate
		properties: {y: 612, opacity: 1}
		time: .6
		
	theEnterAnimation.on 'end', ->
		utils.delay(2, exit)
	
	exit = ->
		theExitAnimation = layer.animate
		  properties: {y: startingHeight, opacity: startingOpacity}
			
		theExitAnimation.on 'end', ->
			repeat()

i = 0
repeat = () ->
	modulusI = i % array.length
	
	console.log("i = " + i)
	console.log("other thing = " + modulusI)
	
	animation(array[i % array.length])
	i++
	
repeat()
