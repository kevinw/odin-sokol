package sokol_gl

import sg "sokol:sokol_gfx"
import "core:c"

when ODIN_OS == "windows" do foreign import sgl_lib "sokol_gl_d3d11.lib"

@(default_calling_convention="c")
@(link_prefix="sgl_")
foreign sgl_lib {
    shutdown :: proc() ---
    defaults :: proc() ---
    texture :: proc(sg.Image) ---
    push_pipeline :: proc() ---
    load_pipeline :: proc(sg.Pipeline) ---
    pop_pipeline :: proc() ---
    enable_texture :: proc() ---
    push_matrix :: proc() ---
    pop_matrix :: proc() ---
    begin_quads :: proc() ---
    begin_lines :: proc() ---
    end :: proc() ---
    scissor_rect :: proc(x, y, w, h: i32, origin_top_left: bool) --- 

    draw :: proc() ---

    load_identity :: proc() ---

    c3f :: proc(r, g, b: f32) ---
    c4b :: proc(r, g, b, a: u8) ---
    v2f_t2f :: proc(x, y, u, v: f32) ---
    v2f :: proc(x, y: f32) ---

    matrix_mode_projection :: proc() ---
    matrix_mode_modelview :: proc() ---
    matrix_mode_texture :: proc() ---

    perspective :: proc(fov_y, aspect, near, far: f32) ---
    ortho :: proc(l, r, b, t, n, f: f32) ---
    translate :: proc(x, y, z: f32) ---
    viewport :: proc(x, y, w, h: c.int, origin_top_left: c.bool) ---

    error :: proc() -> Error ---

}

setup :: proc(desc: Desc) {
    d := desc;
    sgl_setup(&d);
}

make_pipeline :: proc(pipeline_desc: sg.Pipeline_Desc) -> sg.Pipeline {
    d := pipeline_desc;
    return sgl_make_pipeline(&d);
}

@(default_calling_convention="c")
foreign sgl_lib {
    sgl_setup :: proc(desc: ^Desc) ---
    sgl_make_pipeline :: proc(desc: ^sg.Pipeline_Desc) -> sg.Pipeline ---
}
