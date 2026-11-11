# Lean Encumbrance

A lightweight, performance-friendly weight system for Luanti servers.

**Lean Encumbrance** introduces a realistic inventory weight mechanic without causing server lag. Carrying too many heavy blocks (like stone or metal) will slow you down and eventually prevent you from jumping. 

## Features

- **Dynamic Weight Calculation:** Calculates the weight of all items in your main inventory.
- **3D Armor Support:** Automatically includes the weight of equipped armor if the `3d_armor` mod is installed.
- **Progressive Penalties:** 
  - **Normal:** No penalties.
  - **Heavy:** Movement speed is reduced.
  - **Overloaded:** Movement speed is severely reduced, and jumping is disabled.
- **Smart HUD:** A clean text indicator at the bottom of the screen shows your current weight and status. The text changes color (Green -> Orange -> Red).
- **Zero Lag:** Calculates weight once every 2 seconds using `minetest.after`, not every server tick. Physics are only updated when your status actually changes.

## Configuration

Edit `config.lua` to tweak weight limits, physics penalties, and item weights. Weights are assigned using `Item Groups` (e.g., `stone = 1.0`, `wood = 0.5`), making it highly compatible with other mods.

## License

- **Code:** GPL-3.0-only (Copyright (C) 2026 8a7l)