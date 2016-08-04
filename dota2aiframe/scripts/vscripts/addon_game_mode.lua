-- Generated from template
-- Thanks for helping out Perry,  #dota2mods on gamesurge IRC
-- Thanks for testing VicFrank,  #dota2mods on gamesurge IRC

if CAddonTemplateGameMode == nil then
	CAddonTemplateGameMode = class({})
end

function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]
end

-- Create the game mode when we activate
function Activate()
	GameRules.AddonTemplate = CAddonTemplateGameMode()
	GameRules.AddonTemplate:InitGameMode()
end

function CAddonTemplateGameMode:InitGameMode()
	print( "Template addon is loaded." )
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
	--GameRules:GetGameModeEntity():SetThink( "OnAIStuff", "ai stuff", 2 )
end


function CAddonTemplateGameMode:OnAIStuff()

    print( "test2" )
    local cmdPlayer = Convars:GetCommandClient()
    if cmdPlayer then
      if cmdPlayer:GetAssignedHero() ~= nil then
        cmdPlayer:GetAssignedHero():MoveToPosition( cmdPlayer:GetAssignedHero().spawnPos ) 
      end
    end

    return 1
end

-- Evaluate the state of the game
function CAddonTemplateGameMode:OnThink()


    -- LANE_CENTER = Vector( -647, -287, 17 )
    print( "test1" )
	--if not self.unit == nil then
	  -- self.unit:MoveToPosition( self.spawnPos )
	--end
    --if CDOTAPlayer:GetAssignedHero() ~= nil then
      --CDOTAPlayer:GetAssignedHero():MoveToPosition( CDOTAPlayer.GetAssignedHero.spawnPos ) 
    --end
    --[[ 
    local cmdPlayer = Convars:GetCommandClient()
    if cmdPlayer then
      if cmdPlayer:GetAssignedHero() ~= nil then
      	if cmdPlayer:GetAssignedHero():GetTeamNumber() == DOTA_TEAM_GOODGUYS then
          cmdPlayer:GetAssignedHero():MoveToPosition( Vector( -6817, -6347, 385 ) ) 
        else
           cmdPlayer:GetAssignedHero():MoveToPosition(  Vector( 6733, 6116, 385 )  ) 
         end
      end
    end
    --]]

  --if hero:GetPlayerOwnerID() == -1 then

    --SetBotThinkingEnabled(true);
    --SetBotThinkingEnabled( USE_STANDARD_DOTA_BOT_THINKING )
    --mode = GameRules:GetGameModeEntity() 

    --  if not (hero:IsOwnedByAnyPlayer())  then

    --request = CreateHTTPRequest( "POST",  "localhost/test.php")

    --request:Send( function( result ) )
    --print ( result['Body'] )
--[[
    CreateHTTPRequest( "GET", "http://192.168.1.189/test.php" ):Send( function( result )
print( "GET response:\n" )
	for k,v in pairs( result ) do
		print( string.format( "%s : %s\n", k, v ) )
	end
	print( "Done." )
end )
--]]
    --  for hero in HeroList:GetAllHeroes() do
    for key, hero in pairs(HeroList:GetAllHeroes()) do
      if (hero:GetTeamNumber() == DOTA_TEAM_BADGUYS) and (GetFrameCount() > 1900) then
        if hero:GetHealth() == hero:GetMaxHealth() then
        	--print( hero:GetEntityIndex() )
          if not (hero:IsAttacking()) then
          hero:MoveToPositionAggressive(  Vector( -6817, -6347, 385 ) )
          end
        else 

    CreateHTTPRequest( "GET", "http://192.168.1.189/test.php?hpvalue=" .. hero:GetHealth() .. "&unitid=" .. hero:GetEntityIndex() ):Send( function( result )
    
    print( "GET response:\n" )
	for k,v in pairs( result ) do
		print( string.format( "%s : %s\n", k, v ) )
	end
    
	if result['Body'] == "RETREAT" then
		hero:MoveToPosition(  Vector( 6733, 6116, 385 )  )
	end
	--print( "Done." )
end )

           --hero:MoveToPosition(  Vector( 6733, 6116, 385 )  )
        end

          --hero:MoveToPositionAggressive(  Vector( -647, -287, 17 ) ) 
      end
    end



	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		--print( "Template addon script is running." )
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end