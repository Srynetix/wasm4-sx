/// A 2D vector.
#[derive(Clone, Copy, PartialEq, PartialOrd)]
pub struct Vec2 {
    /// X coordinate.
    pub x: f32,
    /// Y coordinate.
    pub y: f32,
}

impl Vec2 {
    /// Vector zero.
    pub const ZERO: Self = Self::new(0.0, 0.0);

    /// Build a new 2D vector.
    pub const fn new(x: f32, y: f32) -> Self {
        Self { x, y }
    }
}

impl From<(f32, f32)> for Vec2 {
    fn from((x, y): (f32, f32)) -> Self {
        Vec2::new(x, y)
    }
}

impl From<Vec2> for (f32, f32) {
    fn from(value: Vec2) -> Self {
        (value.x, value.y)
    }
}
