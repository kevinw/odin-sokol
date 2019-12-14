package sokol_gl

import sg "../sokol_gfx"
import "core:c"

Desc :: struct {
    max_vertices: i32,       /* size for vertex buffer */
    max_commands: i32,       /* size of uniform- and command-buffers */
    pipeline_pool_size: i32, /* size of the internal pipeline pool, default is 64 */
    color_format: sg.Pixel_Format,
    depth_format: sg.Pixel_Format,
    sample_count: i32,
    face_winding: sg.Face_Winding, /* default front face winding is CCW */
}

Error :: enum c.int {
    NO_ERROR = 0,
    VERTICES_FULL,
    UNIFORMS_FULL,
    COMMANDS_FULL,
    STACK_OVERFLOW,
    STACK_UNDERFLOW,
}
