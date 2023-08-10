# wasm4-sx - Opinionated wrapper around WASM-4

> Tired of accessing raw pointers and adding "unsafe" everywhere?  
> Use abstractions, now!

[WASM-4] is a great fantasy console, but each "hardware" access is unsafe and uses raw pointers.  
I wanted to explore how I could do something more ergonomic around these pointers and learn more about the `#![no_std]` world.  

**:book: [Read the documentation here!](https://srynetix.github.io/wasm4-sx/wasm4_sx/)**

## Sample

```rust
use wasm4_sx::*;

#[no_mangle]
fn start() {
    // Let's change the palette!
    Engine::palette().set(
        Palette::new([
            Color::new(0, 0, 0),
            Color::new(0, 0, 127),
            Color::new(0, 127, 127),
            Color::new(127, 127, 127),
        ])
    )
}

#[no_mangle]
fn update() {
    Engine::run_frame(|ctx| {
        // Let's change draw colors, safely!
        Engine::draw_colors().set_index(DrawColorsIndex::I1, PaletteColor::P1);
        Engine::draw_colors().set_index(DrawColorsIndex::I2, PaletteColor::Transparent);

        // Let's check if the X button is pressed on gamepad #1
        if ctx.gamepad(GamepadIndex::I1).is_button_pressed(GamepadButton::X) {
            Engine::draw_colors().set_index(DrawColorsIndex::I1, PaletteColor::P2);
        }

        // Let's check if the mouse left-click was just pressed
        if ctx.mouse().is_button_just_pressed(MouseButton::Left) {
            Engine::draw_colors().set_index(DrawColorsIndex::I1, PaletteColor::P3);
        }
    });
}
```

## What's included

This project contains three crates:

- [wasm4-sx]: My safe "framework" around WASM-4
- [wasm4-sys]: The base wasm4.rs script generated at project creation when using `w4 new`
- [wasm4-stubs]: Simple stubs for extern calls so you can compile and run tests using host target

[WASM-4]: https://wasm4.org/
[wasm4-sx]: ./wasm4-sx/
[wasm4-sys]: ./wasm4-sx/
[wasm4-stubs]: ./wasm4-sx/
