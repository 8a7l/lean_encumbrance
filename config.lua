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
            ["stone"] = 1.0,
            ["cobble"] = 1.0,
            ["sand"] = 1.0,
            ["dirt"] = 1.0,
            ["gravel"] = 1.0,
            ["tree"] = 2.0,
            ["wood"] = 0.5,
            ["leaves"] = 0.1,
            ["sapling"] = 0.1,
            ["plant"] = 0.1,
            ["metal"] = 1.5,
            ["ore"] = 1.0,
            ["tool"] = 0.5,
            ["armor"] = 0.5,
            ["wool"] = 0.1,
        },
        items = {
            -- ==========================================
            -- LOGS
            -- ==========================================
            ["default:tree"] = 2.0,
            ["default:jungletree"] = 2.0,
            ["default:pine_tree"] = 2.0,
            ["default:acacia_tree"] = 2.0,
            ["default:aspen_tree"] = 2.0,
            
            -- ==========================================
            -- WOOD ITEMS
            -- ==========================================
            ["default:stick"] = 0.25,

            -- ==========================================
            -- SAND & STONE
            -- ==========================================
            ["default:sandstone"] = 4.0,
            ["default:sandstonebrick"] = 4.0,
            
            -- ==========================================
            -- GLASS
            -- ==========================================
            ["default:glass"] = 1.0,
            ["default:obsidian"] = 2.0,
            ["default:obsidian_glass"] = 3.0,
            
            -- ==========================================
            -- CLAY & BRICKS
            -- ==========================================
            ["default:clay_lump"] = 0.5,
            ["default:clay"] = 2.0,
            ["default:clay_brick"] = 0.5,
            ["default:brick"] = 2.0,

            -- ==========================================
            -- LUMPS & INGOTS (Explicit overrides)
            -- ==========================================
            ["default:coal_lump"] = 0.5,
            ["default:iron_lump"] = 1.5,
            ["default:copper_lump"] = 1.5,
            ["default:tin_lump"] = 1.5,
            ["default:gold_lump"] = 1.5,
            
            ["default:steel_ingot"] = 1.5,
            ["default:copper_ingot"] = 1.5,
            ["default:tin_ingot"] = 1.5,
            ["default:bronze_ingot"] = 1.5,
            ["default:gold_ingot"] = 1.5,

            -- ==========================================
            -- METAL BLOCKS
            -- ==========================================
            ["default:steelblock"] = 13.5,
            ["default:copperblock"] = 13.5,
            ["default:tinblock"] = 13.5,
            ["default:bronzeblock"] = 13.5,
            ["default:goldblock"] = 13.5,
            
            -- ==========================================
            -- COAL & MESE BLOCKS
            -- ==========================================
            ["default:coalblock"] = 4.5,
            ["default:mese_crystal"] = 1.0,
            ["default:mese"] = 9.0,
            ["default:diamond"] = 1.0,
            ["default:diamondblock"] = 9.0,

            -- ==========================================
            -- MISC ITEMS
            -- ==========================================
            ["default:paper"] = 0.1,
            ["default:book"] = 0.3,
            ["default:torch"] = 0.2,
            ["default:snow"] = 0.1,
            ["default:snowblock"] = 0.4,
            ["default:ice"] = 2.0,
            ["default:apple"] = 0.2,
        },
        default_weight = 0.1
    },

    hud_pos = { x = 0.5, y = 0.8 },
    hud_colors = {
        normal = 0x00FF00,
        heavy = 0xFFA500,
        overloaded = 0xFF0000
    }
}