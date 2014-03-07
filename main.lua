-- iphone 4 is 640x960 
-----I used alegebra to get bldg's heighth/width values that met the assigned pixel measuremnts (180x400)

local screenWidth = display.contentWidth
local screenHeight = display.contentHeight
local screenCenterX = display.contentCenterX
local screenCenterY = display.contentCenterY

local bldgHeight = screenHeight * 0.4166666666666667 -- I took 400/960 (height of iPhone) to get .4166666666666667. Multiplying screen height times this will get 400 pixels
local bldgWidth = screenWidth * 0.28125 -- I took 180 (required width of building) and divided it by width of screen (640)
print( "Bldg: " .. bldgWidth .. " x " .. bldgHeight ) -- how do I print the x,y coordinates of the building? My attemps below in full "NOTES"

local starsAtNight = audio.loadStream("18 Deep In the Heart of Texas.m4a")
-- chose this song b/c it looks like the lights are blinnking to the beat 
-- plus the Star looks like the Dallas Cowboys star and the blinking lights reminded me of Reunion Tower/Jolly Green Giant in Dallas

local background = display.newRect( 0, 0, screenWidth, screenHeight ) -- sky
background:setFillColor(0,0,1,.5) -- dark blue
background.x = screenCenterX -- center background
background.y = screenCenterY -- center background

local myStar = display.newLine( 200, 90, 227, 165 ) -- from Corona display library: http://docs.coronalabs.com/api/library/display/newLine.html
myStar:append( 305,165, 243,216, 265,290, 200,245, 135,290, 157,215, 95,165, 173,165, 200,90 )
myStar:setStrokeColor(math.random(0,1), math.random(.5,1), math.random(.8,1), math.random(1,1)) -- each time app launched, star will be a different color
myStar.strokeWidth = 8

local myGrass = display.newRect( 0, 0, screenWidth, 100) -- grass under/behind building
myGrass.x = display.contentCenterX 
myGrass.y = display.contentCenterY * 2
myGrass:setFillColor( 0, .9, .1, .5) -- green 

local myBldg = display.newRect( 0, 0, bldgWidth, bldgHeight)
myBldg.x = display.contentCenterX -- center my building
myBldg.y =  display.contentCenterY * 1.576 --  place bldg at bottom of screen (trial and error, see notes at bottom)
myBldg:setFillColor(.5,1) -- gray, appears overtop of sky (bldg in forefront)

myWindows = {} -- code obtained from LeMasters tutorial online and lesson in class
local function windowValueXY (windowValueX,windowValueY)
	local arrayPosition = (windowValueY*bldgWidth) + windowValueX 
	return arrayPosition
end 

local playMyMusic = audio.play(starsAtNight) -- play "The Stars at Night..."

local myWindowColumns = 9 -- windows columns and rows
local myWindowRows = 20
local myTotalWindows = {1,180}
local startX=display.contentCenterX -100
local startY=display.contentCenterY + 65

-- windows will randomly be filled with different colors. All will be lit up at first. 
-- some windows fade and then all lights are off (around 10 seconds after launching)
-- lights come back on and blink, fading in and out depending on the x,y coordinates assigned to transition
-- to a blink or fade effect below. When they light back up, most come in a different color
--it takes about 15 seconds for the ripple effect to start 

for j=1,9 do
	for k=1,20 do 
		local z = windowValueXY(j,k)
		myWindows[z] = display.newRect(startX+j*20,startY+k*20,10,10) --if j*k > 100, myWindows[z] = true, then  
			 myWindows[z]:setFillColor(math.random(0,1), math.random(.5,1), math.random(.8,1), math.random(1,1)) 
			  transition.blink( myWindows[z], { time=3000 } )-- helpful source in randomizing the color of my window cells: http://thatssopanda.com/corona-sdk-tutorials/creating-several-images-with-corona-sdk/ 		 	
			 	for j=1,4 do 
			 		for k=1,10 do 
			 			myWindows[z] = display.newRect(startX+j*20,startY+k*20,10,10)
			 			myWindows[z]:setFillColor(math.random(0,1), math.random(.5,1), math.random(.8,1), math.random(1,1)) 
			 			transition.blink( myWindows[z], { time=2000 } )
			 			--transition.fadeOut( myWindows[z], { time=2000 } )
			 		end
			 	end
			 	for j=5,9 do 
			 		for k=11,20 do 
			 			myWindows[z] = display.newRect(startX+j*20,startY+k*20,10,10)
			 			myWindows[z]:setFillColor(math.random(0,1), math.random(.5,1), math.random(.8,1), math.random(1,1)) 
			 			transition.blink( myWindows[z], { time=1000 } )
			 			transition.fadeOut( myWindows[z], { time=1000 } )
			 		end
			 	end 
			 	for j=3,6 do 
			 		for k=8,11 do 
			 			myWindows[z] = display.newRect(startX+j*20,startY+k*20,10,10)
			 			myWindows[z]:setFillColor(math.random(0,1), math.random(.5,1), math.random(.8,1), math.random(1,1)) 
			 			transition.blink( myWindows[z], { time=3000 } )
			 			transition.fadeOut( myWindows[z], { time=2500 } )
			 		end
			 	end 
			 		for j=7,9 do 
			 			for k=12,14 do 
			 			myWindows[z] = display.newRect(startX+j*20,startY+k*20,10,10)
			 			myWindows[z]:setFillColor(math.random(0,1), math.random(.5,1), math.random(.8,1), math.random(1,1)) 
			 			transition.blink( myWindows[z], { time=3000 } )
			 			transition.fadeOut( myWindows[z], { time=1500 } )
			 		end
			 	end 
			 		for j=1,4 do 
			 			for k=15,18 do 
			 			myWindows[z] = display.newRect(startX+j*20,startY+k*20,10,10)
			 			myWindows[z]:setFillColor(math.random(0,1), math.random(.5,1), math.random(.8,1), math.random(1,1)) 
			 			transition.blink( myWindows[z], { time=3000 } )
			 			transition.fadeOut( myWindows[z], { time=1000 } )
			 		end
			 	end 
		end
	end 

--NOTES

--print ("Rect X,Y,Width,Height: ", myBldg.xMin, myBldg.yMin, bldgWidth, bldgHeight) -- attempt to get x/y values
--print( display.topStatusBarContentHeight ) -- attempt to get x/y values

--PREVIOUS LIGHT EFFECT TRIALS 
--myWindows[z] = newRect(startX+j*20,startY+k*20,10,10)[]--randomImage = images[math.random(1,6)]
 --transition.moveBy( myWindows[z], { x=100, y=100, time=2000 } )
			 		--transition.blink( myWindows[z], { time=4000 } )
			 	--for j=5,9 do
			 	--	for k=11,20 do
			 		--	myWindows[z] = display.newRect(startX+j*20,startY+k*20,10,10)
			 --transition.scaleBy( myWindows[z], { xScale=.5, yScale=.75, time=2000 } )
			 		--transition.fadeOut( myWindows[z], { time=3000 } )	

--[[local a = 5
local b = 9
local c = answers(a,b)

print (c)

local function lightsOnOff(true,false)
	local a = true if x*y>([100] or <[20])
	return alpha + beta 
end ]]
--randomImage = images[math.random(1,6)


--PREVIOUS WINDOW ALIGNMENT AND COLORTRIALS
--myWindows[z]:setFillColor(math.random(0,0), math.random(.5,1), math.random(.8,1), math.random(1,1))
			--tile:setFillColor(math.random(0, 255), math.random(0, 255), math.random(0, 255), 255)--math.random(0,0,.5), (.25,.25, 0, .5))
			--myWindows[z].x = myBldg.x -- display.contentCenterX -- center my building
			--myWindows[z].y =  myBldg.y -- display.contentCenterY  -- 
			--myWindows[z].x = display.contentCenterX
			--myWindows[z].y =  display.contentCenterY--return myWindows[z]
	----(0,.8,.10,.8)(0,0,0,.5))

-- PREVIOUS FOR LOOP AND WINDOW ALIGNMENT TRIALS
--[[for tempX=1,9, 1 do
	for tempY=1,20, 1 do 
		local z = linearXY(tempX,tempY)
		myWindows[z] = display.newRect(tempX,tempY,10,10) 
			myWindows[z]:setFillColor(0,0,.2,.5)
			myWindows[z].x = display.contentCenterX
			myWindows[z].y =  display.contentCenterY--return myWindows[z]
		end
	end ]]


--ATTEMPTS TO ALIGN BUILDING WITH THE BOTTOM OF Y AXIS 
-- solution, trial and error (dividing and multiplying) until building appeared at the bottom of screen
-- helpful source in notes at the end

--myBldg.yAlign = bottom (this did not work)
-- This was semi helpful --http://stackoverflow.com/questions/17218815/scale-image-to-display-contentwidth-display-contentheight--local bldgCenterX = display.contentCenterX
--local bldgCenterY = display.contentCenterY
--local bldgCenterX = bldgWidth  * 0.5
--local bldgCenterY = bldgHeight * 0.5

-- Color Resource: http://www.pdflib.com/pdflib-cookbook/color/starter-color/php-starter-color/

