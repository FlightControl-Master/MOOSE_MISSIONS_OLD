
TestMenus = {}

Menu = MENU_MISSION:New( "Generate Menus" )

do
  -- This demo creates a menu structure for the planes within the red coalition.
  -- To test, join the planes, then look at the other radio menus (Option F10).
  -- Then switch planes and check if the menu is still there.

  local Plane1 = GROUP:FindByName( "Red Plane 1" )
  local Plane2 = GROUP:FindByName( "Red Plane 2" )
  local Plane3 = GROUP:FindByName( "Red Plane 3" )
  local Plane4 = GROUP:FindByName( "Red Plane 4" )

  local CoalitionText = {
    [coalition.side.BLUE] = "BLUE",
    [coalition.side.RED] = "RED",
    }

  local function MenuMessage( Text, Parameter )
    MESSAGE:NewType( Text .. Parameter, MESSAGE.Type.Information ):ToAll()
  end

  local function MenuRemove(m)
    TestMenus[m]:Remove()
  end

  local function GenerateMissionMenu()
    local m = #TestMenus+1
    TestMenus[m] = MENU_MISSION:New( "Menu Mission "..m  )
    for n = 1, 8 do
      local MenuMissionCommand = MENU_MISSION_COMMAND:New( "Show Mission "..m.."."..n, TestMenus[m], MenuMessage, "Mission ", m.."."..n)
    end
    local MenuMissionRemoveCommand = MENU_MISSION_COMMAND:New( "Remove Mission "..m, TestMenus[m], MenuRemove, m)
  end

  local function GenerateCoalitionMenu( Coalition )
    local m = #TestMenus+1
    TestMenus[m] = MENU_COALITION:New( Coalition, "Menu Coalition "..CoalitionText[Coalition].." ".. m  )
    for n = 1, 8 do
      local MenuMissionCommand = MENU_COALITION_COMMAND:New( Coalition, "Show Coalition "..CoalitionText[Coalition].." "..m.."."..n, TestMenus[m], MenuMessage, "Coalition ", CoalitionText[Coalition].." "..m.."."..n)
    end
    local MenuMissionRemoveCommand = MENU_COALITION_COMMAND:New( Coalition, "Remove Coalition "..CoalitionText[Coalition].." "..m, TestMenus[m], MenuRemove, m)
  end

  -- Create a mission menu to generate the menus.
  local MenuMission = MENU_MISSION_COMMAND:New( "Generate Mission Menus", Menu, GenerateMissionMenu )
  local MenuCoalitionBlue = MENU_MISSION_COMMAND:New( "Generate Blue Coalition Menus", Menu, GenerateCoalitionMenu, coalition.side.BLUE )
  local MenucoalitionRed = MENU_MISSION_COMMAND:New( "Generate Red Coalition Menus", Menu, GenerateCoalitionMenu, coalition.side.RED )

end




