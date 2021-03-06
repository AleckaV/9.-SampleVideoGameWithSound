-----------------------------------------------------------------------------------------
--
-- splash_screen.lua
-- Created by: Alecka Victoria
--  Date: November 20, 2017
-- Description: This is the splash screen of the game. It displays the 
-- company logo that fades in the screen
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "splash_screen"

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

-- hides the status bar
display.setStatusBar(display.HiddenStatusBar)
----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
 
-- The local variables for this scene
local companyLogo

--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------

-- The function that moves the beetleship across the screen
local function fadeInCompanyLogo()
    
    companyLogo.alpha = companyLogo.alpha + 0.008
end

local function fadeOutCompanyLogo()
    
    companyLogo.alpha = companyLogo.alpha - 0.008
end

local function callFadeOut()
    Runtime:removeEventListener("enterFrame", fadeInCompanyLogo)
    Runtime:removeEventListener("enterFrame", fadeOutCompanyLogo)
end

-- The function that will go to the main menu 
local function gotoMainMenu()
    composer.gotoScene( "main_menu" )
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- set the background to be black
    display.setDefault("background", 0, 0, 0)

    -- Insert the beetleship image
    companyLogo = display.newImageRect("Images/CompanyLogo.png", 1024, 768)

    -- set the initial x and y position of the beetleship
    companyLogo.x = 513
    companyLogo.y = display.contentHeight/2

    -- sets the company logo to be transparent
    companyLogo.alpha = 0

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( companyLogo )

end -- function scene:create( event )

--------------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- Call the fadeinCompanyLogo function as soon as we enter the frame.
        Runtime:addEventListener("enterFrame", fadeInCompanyLogo)

        timer.performWithDelay ( 3000, callFadeOut)

        -- Go to the main menu screen after the given time.
        timer.performWithDelay ( 6000, gotoMainMenu)          
        
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is on screen (but is about to go off screen).
    -- Insert code here to "pause" the scene.
    -- Example: stop timers, stop animation, stop audio, etc.
    if ( phase == "will" ) then  

    -----------------------------------------------------------------------------------------

    -- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
        Runtime:addEventListener("enterFrame", fadeOutCompanyLogo)
        
        -- stop the jungle sounds channel for this screen
        
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
