-- SPDX-License-Identifier: GPL-3.0-only
-- Copyright (C) 2026 8a7l

local modname = minetest.get_current_modname()
local config = dofile(minetest.get_modpath(modname) .. "/config.lua")

local player_huds = {}

-- ============================================================
-- WEIGHT CALCULATION / РОЗРАХУНОК ВАГИ
-- ============================================================
local function get_item_weight(itemstack)
    if itemstack:is_empty() then return 0 end
    local name = itemstack:get_name()
    local count = itemstack:get_count()

    -- 1. Specific items (highest priority) / Конкретні предмети (найвищий пріоритет)
    if config.weights.items[name] then
        return config.weights.items[name] * count
    end

    -- 2. Item groups / Групи предметів
    for group, weight in pairs(config.weights.groups) do
        if minetest.get_item_group(name, group) > 0 then
            return weight * count
        end
    end

    -- 3. Default weight / Вага за замовчуванням
    return config.weights.default_weight * count
end

local function calculate_total_weight(player)
    local total_weight = 0
    local inv = player:get_inventory()

    -- Main inventory / Основний інвентар
    if inv then
        for i = 1, inv:get_size("main") do
            total_weight = total_weight + get_item_weight(inv:get_stack("main", i))
        end
    end

    -- Armor inventory (3d_armor support) / Інвентар броні (підтримка 3d_armor)
    if minetest.get_modpath("3d_armor") then
        local armor_inv = minetest.get_inventory({type = "detached", name = player:get_player_name() .. "_armor"})
        if armor_inv then
            for _, list in ipairs({"armor"}) do
                if armor_inv:get_size(list) > 0 then
                    for i = 1, armor_inv:get_size(list) do
                        total_weight = total_weight + get_item_weight(armor_inv:get_stack(list, i))
                    end
                end
            end
        end
    end

    return total_weight
end

-- ============================================================
-- UPDATE LOOP / ЦИКЛ ОНОВЛЕННЯ
-- ============================================================
local function update_player_weight(player)
    if not player or not player:is_player() then return end
    local name = player:get_player_name()
    local weight = calculate_total_weight(player)

    local state = "normal"
    local hud_color = config.hud_colors.normal
    local hud_text = string.format("Weight: %.1f / %d", weight, config.limits.normal)

    if weight > config.limits.heavy then
        state = "overloaded"
        hud_color = config.hud_colors.overloaded
        hud_text = string.format("Weight: %.1f (OVERLOADED)", weight)
    elseif weight > config.limits.normal then
        state = "heavy"
        hud_color = config.hud_colors.heavy
        hud_text = string.format("Weight: %.1f (Heavy)", weight)
    end

    -- Use playerphysics API / Використовуємо API playerphysics
    if state == "heavy" then
        playerphysics.add_physics_factor(player, "speed", "weight_penalty", config.penalties.heavy.speed)
        playerphysics.add_physics_factor(player, "jump", "weight_penalty", config.penalties.heavy.jump)
    elseif state == "overloaded" then
        playerphysics.add_physics_factor(player, "speed", "weight_penalty", config.penalties.overloaded.speed)
        playerphysics.add_physics_factor(player, "jump", "weight_penalty", config.penalties.overloaded.jump)
    else
        playerphysics.remove_physics_factor(player, "speed", "weight_penalty")
        playerphysics.remove_physics_factor(player, "jump", "weight_penalty")
    end

    -- Update HUD / Оновлюємо HUD
    if player_huds[name] then
        player:hud_change(player_huds[name], "text", hud_text)
        player:hud_change(player_huds[name], "number", hud_color)
    else
        player_huds[name] = player:hud_add({
            hud_elem_type = "text",
            position = config.hud_pos,
            alignment = { x = 0, y = 1 },
            text = hud_text,
            number = hud_color,
            scale = { x = 100, y = 100 },
        })
    end
end

local function background_update(player)
    update_player_weight(player)
    minetest.after(2, background_update, player)
end

-- ============================================================
-- EVENTS / ПОДІЇ
-- ============================================================
minetest.register_on_joinplayer(function(player)
    local name = player:get_player_name()
    player_huds[name] = nil
    minetest.after(1, background_update, player)
end)

minetest.register_on_leaveplayer(function(player)
    local name = player:get_player_name()
    if player_huds[name] then
        player:hud_remove(player_huds[name])
    end
    player_huds[name] = nil
    
    -- Clean up physics factors / Очищаємо фізичні фактори
    if player and player:is_player() then
        playerphysics.remove_physics_factor(player, "speed", "weight_penalty")
        playerphysics.remove_physics_factor(player, "jump", "weight_penalty")
    end
end)

minetest.register_on_player_inventory_action(function(player, action, inventory, inventory_info)
    minetest.after(0.1, update_player_weight, player)
end)

if minetest.get_modpath("3d_armor") then
    armor:register_on_equip(function(player, index, stack)
        minetest.after(0.1, update_player_weight, player)
    end)
    
    armor:register_on_unequip(function(player, index, stack)
        minetest.after(0.1, update_player_weight, player)
    end)
end

-- ============================================================
-- TOOLTIP WEIGHT INJECTION / ДОДАВАННЯ ВАГИ В ОПИС ПРЕДМЕТІВ
-- ============================================================
minetest.register_on_mods_loaded(function()
    for name, def in pairs(minetest.registered_items) do
        if def.description and def.description ~= "" then
            local stack = ItemStack(name)
            local base_weight = get_item_weight(stack)
            
            if base_weight > 0 then
                local weight_str = string.format("%.1f", base_weight):gsub("%.0$", "")
                
                -- Запобігаємо дублюванню ваги при перезавантаженні
                -- Prevent weight duplication on reload
                if not def.description:find("%[Weight:") then
                    minetest.override_item(name, {
                        description = def.description .. "\n" .. minetest.colorize("#FFA500", "[Weight: " .. weight_str .. "]")
                    })
                end
            end
        end
    end
end)