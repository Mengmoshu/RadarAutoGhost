-- Radar Auto Ghost by Mengmoshu

-- Desync friendly calculation of radar area/spacing
-- Register for on_built events:
-- * on_built_entity
-- * on_robot_built_entity

-- Other events of note:
-- * on_runtime_mod_setting_changed


chunk_size = 32
north = defines.direction.north
east  = defines.direction.east
south = defines.direction.south
west  = defines.direction.west

-- Processes the on_built events
function incoming_construction_event(event)
    e = event
    newBuild = event.created_entity
    if newBuild.type == "radar" then
        range = newBuild.max_distance_of_nearby_sector_revealed
        spacing = (range * chunk_size) * 2

        place_radar_cardinal{origin = newBuild.location, distance = spacing, direction = north}
        place_radar_cardinal{origin = newBuild.location, distance = spacing, direction = east}
        place_radar_cardinal{origin = newBuild.location, distance = spacing, direction = south}
        place_radar_cardinal{origin = newBuild.location, distance = spacing, direction = west}

    end
end

-- Helpers:
function place_radar_cardinal({origin, distance, direction})
    local location = {}
    if direction = north then
        location = {x = origin.x, y = origin.y - distance}
    elseif direction = east then
        location = {x = origin.x + distance, y = origin.y}
    elseif direction = south then
        location = {x = origin.x, y = origin.y + distance}
    elseif direction = west then
        location = {x = origin.x - distance, y = origin.y}
    else
        -- Fail!
        -- Provide debug output.
    end

    -- Search snippet:
    -- newBuild.surface.find_entities_filtered{area = {left_top = {-, -}, right_bottom = {+, +}},force = newBuild.force, type ="radar"}
    -- check in the cardinal directions at radar range for placed/ghost radars
    -- check an overlap radius based on radar range


    -- place a radar ghost in the center of the correctly spaced chunk (Use the placed radar name)
        -- shift position if water is in the way
        -- mark trees/rocks in the way for deconstruction
    -- optionally mark trees in a radius for deconstruction (configurable when I do config menu)
end
