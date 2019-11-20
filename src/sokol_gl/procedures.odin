package sokol_gl

import sg "sokol:sokol_gfx"
import "core:c"

when ODIN_OS == "windows" do foreign import sgl_lib "sokol_gl_d3d11.lib"

@(default_calling_convention="c")
@(link_prefix="sgl_")
foreign sgl_lib {
    error :: proc() -> Error ---
    shutdown :: proc() ---
    defaults :: proc() ---
    texture :: proc(sg.Image) ---
    push_pipeline :: proc() ---
    load_pipeline :: proc(sg.Pipeline) ---
    pop_pipeline :: proc() ---
    enable_texture :: proc() ---
    push_matrix :: proc() ---
    pop_matrix :: proc() ---
    load_matrix :: proc(m: ^f32) ---
    load_transpose_matrix :: proc(m: ^f32) ---
    mult_matrix :: proc(m: ^f32) ---
    mult_transpose_matrix :: proc(m: ^f32) ---
    matrix_mode_projection :: proc() ---
    matrix_mode_modelview :: proc() ---
    matrix_mode_texture :: proc() ---
    perspective :: proc(fov_y, aspect, near, far: f32) ---
    ortho :: proc(l, r, b, t, n, f: f32) ---
    translate :: proc(x, y, z: f32) ---
    viewport :: proc(x, y, w, h: c.int, origin_top_left: c.bool) ---
    scissor_rect :: proc(x, y, w, h: i32, origin_top_left: bool) --- 
    end :: proc() ---
    draw :: proc() ---
    load_identity :: proc() ---

    /* these functions only set the internal 'current texcoord / color' (valid inside or outside begin/end) */
    t2f :: proc(u, v: f32) ---
    c3f :: proc(r, g, b: f32) ---
    c4f :: proc(r, g, b, a: f32) ---
    c3b :: proc(r, g, b: u8) ---
    c4b :: proc(r, g, b, a: u8) ---
    c1i :: proc(rgba: u32) ---

    /* define primitives, each begin/end is one draw command */
    begin_points :: proc() ---
    begin_lines :: proc() ---
    begin_line_strip :: proc() ---
    begin_triangles :: proc() ---
    begin_triangle_strip :: proc() ---
    begin_quads :: proc() ---
    v2f :: proc(x, y: f32) ---
    v3f :: proc(x, y, z: f32) ---
    v2f_t2f :: proc(x, y, u, v: f32) ---
    v3f_t2f :: proc(x, y, z, u, v: f32) ---
    v2f_c3f :: proc(x, y, r, g, b: f32) ---
    v2f_c3b :: proc(x, y: f32, r, g, b: u8) ---
    v2f_c4f :: proc(x, y, r, g, b, a: f32) ---
    v2f_c4b :: proc(x, y, r, g, b, a: u8) ---
    v2f_c1i :: proc(x, y, rgba: u32) ---
    v3f_c3f :: proc(x, y, z, r, g, b: f32) ---
    v3f_c3b :: proc(x, y, z: f32, r, g, b: u8) ---
    v3f_c4f :: proc(x, y, z, r, g, b, a: f32) ---
    v3f_c4b :: proc(x, y, z: f32, r, g, b, a: u8) ---
    v3f_c1i :: proc(x, y, z: f32, rgba: u32) ---
    v2f_t2f_c3f :: proc(x, y, u, v, r, g, b: f32) ---
    v2f_t2f_c3b :: proc(x, y, u, v: f32, r, g, b: u8) ---
    v2f_t2f_c4f :: proc(x, y, u, v, r, g, b, a: f32) ---
    v2f_t2f_c4b :: proc(x, y, u, v: f32, r, g, b, a: u8) ---
    v2f_t2f_c1i :: proc(x, y, u, v: f32, rgba: u32) ---
    v3f_t2f_c3f :: proc(x, y, z, u, v, r, g, b: f32) ---
    v3f_t2f_c3b :: proc(x, y, z, u, v: f32, r, g, b: u8) ---
    v3f_t2f_c4f :: proc(x, y, z, u, v, r, g, b, a: f32) ---
    v3f_t2f_c4b :: proc(x, y, z, u, v: f32, r, g, b, a: u8) ---
    v3f_t2f_c1i :: proc(x, y, z, u, v: f32, rgba: u32) ---
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
