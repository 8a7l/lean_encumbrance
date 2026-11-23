-- SPDX-License-Identifier: GPL-3.0-only
-- Copyright (C) 2026 8a7l

return {
    limits = {
        normal = 1000,
        heavy = 1500,
    },

    penalties = {
        heavy = { speed = 0.7, jump = 1.0 },
        overloaded = { speed = 0.4, jump = 0.0 }
    },

    weights = {
        groups = {
            -- Базові групи (для інших модів)
            ["stone"] = 1.0, ["cobble"] = 1.0, ["sand"] = 1.0, ["dirt"] = 1.0,
            ["gravel"] = 1.0, ["tree"] = 2.0, ["wood"] = 0.5, ["leaves"] = 0.1,
            ["sapling"] = 0.1, ["plant"] = 0.1, ["metal"] = 1.5, ["ore"] = 1.0,
            ["tool"] = 0.5, ["armor"] = 0.5, ["wool"] = 0.1,
        },
        items = {
            -- ==========================================
            -- ДЕРЕВО (Дошки, колоди, листя, палички)
            -- ==========================================
            ["default:tree"] = 2.0,
            ["default:jungletree"] = 2.0,
            ["default:pine_tree"] = 2.0,
            ["default:acacia_tree"] = 2.0,
            ["default:aspen_tree"] = 2.0,
            ["default:wood"] = 0.5,
            ["default:junglewood"] = 0.5,
            ["default:pine_wood"] = 0.5,
            ["default:acacia_wood"] = 0.5,
            ["default:aspen_wood"] = 0.5,
            ["default:stick"] = 0.25,
            ["default:leaves"] = 0.1,
            ["default:sapling"] = 0.1,
            ["default:junglesapling"] = 0.1,
            ["default:pine_sapling"] = 0.1,
            ["default:acacia_sapling"] = 0.1,
            ["default:aspen_sapling"] = 0.1,

            -- ==========================================
            -- КАМІНЬ ТА ҐРУНТ
            -- ==========================================
            ["default:stone"] = 1.0,
            ["default:cobble"] = 1.0,
            ["default:mossycobble"] = 1.0,
            ["default:desert_stone"] = 1.0,
            ["default:desert_cobble"] = 1.0,
            ["default:stonebrick"] = 1.0,
            ["default:stone_block"] = 1.0,
            ["default:desert_stonebrick"] = 1.0,
            ["default:desert_stone_block"] = 1.0,
            ["default:sandstone"] = 4.0,
            ["default:sandstonebrick"] = 4.0,
            ["default:sandstone_block"] = 4.0,
            ["default:desert_sandstone"] = 4.0,
            ["default:desert_sandstone_brick"] = 4.0,
            ["default:desert_sandstone_block"] = 4.0,
            ["default:silver_sandstone"] = 4.0,
            ["default:silver_sandstone_brick"] = 4.0,
            ["default:silver_sandstone_block"] = 4.0,
            ["default:dirt"] = 1.0,
            ["default:dirt_with_grass"] = 1.0,
            ["default:dirt_with_grass_footsteps"] = 1.0,
            ["default:dirt_with_snow"] = 1.0,
            ["default:dirt_with_dry_grass"] = 1.0,
            ["default:dirt_with_rainforest_litter"] = 1.0,
            ["default:dirt_with_coniferous_litter"] = 1.0,
            ["default:dry_dirt"] = 1.0,
            ["default:dry_dirt_with_dry_grass"] = 1.0,
            ["default:permafrost"] = 1.0,
            ["default:permafrost_with_stones"] = 1.0,
            ["default:permafrost_with_moss"] = 1.0,
            ["default:sand"] = 1.0,
            ["default:desert_sand"] = 1.0,
            ["default:silver_sand"] = 1.0,
            ["default:gravel"] = 1.0,
            ["default:clay"] = 2.0,
            ["default:clay_lump"] = 0.5,
            ["default:clay_brick"] = 0.5,
            ["default:brick"] = 2.0,
            ["default:snow"] = 0.1,
            ["default:snowblock"] = 0.4,
            ["default:ice"] = 2.0,

            -- ==========================================
            -- МЕТАЛИ ТА РУДИ
            -- ==========================================
            ["default:coal_lump"] = 0.5,
            ["default:coalblock"] = 4.5,
            ["default:iron_lump"] = 1.5,
            ["default:steel_ingot"] = 1.5,
            ["default:steelblock"] = 13.5,
            ["default:copper_lump"] = 1.5,
            ["default:copper_ingot"] = 1.5,
            ["default:copperblock"] = 13.5,
            ["default:tin_lump"] = 1.5,
            ["default:tin_ingot"] = 1.5,
            ["default:tinblock"] = 13.5,
            ["default:bronze_ingot"] = 1.5,
            ["default:bronzeblock"] = 13.5,
            ["default:gold_lump"] = 1.5,
            ["default:gold_ingot"] = 1.5,
            ["default:goldblock"] = 13.5,
            ["default:mese_crystal"] = 1.0,
            ["default:mese_crystal_fragment"] = 0.2,
            ["default:mese"] = 9.0,
            ["default:diamond"] = 1.0,
            ["default:diamondblock"] = 9.0,

            -- ==========================================
            -- СКЛО ТА ІНШІ БЛОКИ
            -- ==========================================
            ["default:glass"] = 1.0,
            ["default:obsidian_glass"] = 3.0,
            ["default:obsidian"] = 2.0,
            ["default:obsidianbrick"] = 2.0,
            ["default:obsidian_block"] = 2.0,

            -- ==========================================
            -- ІНСТРУМЕНТИ ТА ЗБРОЯ
            -- ==========================================
            ["default:pick_wood"] = 0.5, ["default:pick_stone"] = 1.0,
            ["default:pick_steel"] = 1.5, ["default:pick_bronze"] = 1.5,
            ["default:pick_mese"] = 1.5, ["default:pick_diamond"] = 1.5,
            ["default:axe_wood"] = 0.5, ["default:axe_stone"] = 1.0,
            ["default:axe_steel"] = 1.5, ["default:axe_bronze"] = 1.5,
            ["default:axe_mese"] = 1.5, ["default:axe_diamond"] = 1.5,
            ["default:shovel_wood"] = 0.5, ["default:shovel_stone"] = 1.0,
            ["default:shovel_steel"] = 1.5, ["default:shovel_bronze"] = 1.5,
            ["default:shovel_mese"] = 1.5, ["default:shovel_diamond"] = 1.5,
            ["default:sword_wood"] = 0.5, ["default:sword_stone"] = 1.0,
            ["default:sword_steel"] = 1.5, ["default:sword_bronze"] = 1.5,
            ["default:sword_mese"] = 1.5, ["default:sword_diamond"] = 1.5,

            -- ==========================================
            -- ЇЖА ТА РОСЛИНИ
            -- ==========================================
            ["default:apple"] = 0.2,
            ["default:paper"] = 0.1,
            ["default:book"] = 0.3,
            ["default:bookshelf"] = 2.0,
            ["default:torch"] = 0.2,
            ["default:cactus"] = 1.0,
            ["default:large_cactus_seedling"] = 0.5,
            ["default:papyrus"] = 0.1,
            ["default:dry_shrub"] = 0.1,
            ["default:junglegrass"] = 0.1,
            ["default:grass_1"] = 0.1, ["default:grass_2"] = 0.1,
            ["default:grass_3"] = 0.1, ["default:grass_4"] = 0.1,
            ["default:grass_5"] = 0.1,
            ["default:dry_grass_1"] = 0.1, ["default:dry_grass_2"] = 0.1,
            ["default:dry_grass_3"] = 0.1, ["default:dry_grass_4"] = 0.1,
            ["default:dry_grass_5"] = 0.1,
            ["default:marram_grass_1"] = 0.1, ["default:marram_grass_2"] = 0.1,
            ["default:marram_grass_3"] = 0.1,
            ["default:bush_stem"] = 1.0,
            ["default:bush_leaves"] = 0.1,
            ["default:acacia_bush_stem"] = 1.0,
            ["default:acacia_bush_leaves"] = 0.1,
            ["default:pine_bush_stem"] = 1.0,
            ["default:pine_bush_needles"] = 0.1,
            ["default:blueberry_bush_leaves"] = 0.1,
            ["default:blueberry_bush_leaves_with_berries"] = 0.1,
            ["default:blueberries"] = 0.1,
            ["default:fence_wood"] = 1.0, ["default:fence_acacia_wood"] = 1.0,
            ["default:fence_junglewood"] = 1.0, ["default:fence_pine_wood"] = 1.0,
            ["default:fence_aspen_wood"] = 1.0,
            ["default:ladder_wood"] = 1.0, ["default:ladder_steel"] = 2.0,
            ["default:sign_wall_wood"] = 0.5, ["default:sign_wall_steel"] = 1.0,
            ["default:chest"] = 5.0, ["default:chest_locked"] = 5.5,
            ["default:furnace"] = 8.0, ["default:furnace_active"] = 8.0,
        },
        default_weight = 0.2 -- Для всього іншого (квіти тощо)
    },

    hud_pos = { x = 0.5, y = 0.8 },
    hud_colors = {
        normal = 0x00FF00,
        heavy = 0xFFA500,
        overloaded = 0xFF0000
    }
}