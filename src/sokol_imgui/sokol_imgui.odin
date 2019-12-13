package simgui

when ODIN_OS == "windows" do foreign import simgui_lib {
    "sokol_imgui_d3d11.lib",
}

import sg "../sokol_gfx"
import sapp "../sokol_app"

Desc :: struct {
    max_vertices: i32,
    color_format: sg.Pixel_Format,
    depth_format: sg.Pixel_Format,
    sample_count: i32,
    dpi_scale: f32,
    ini_filename: cstring,
    no_default_font: bool,
    disable_hotkeys: bool,
};

@(default_calling_convention="c")
@(link_prefix="simgui_")
foreign simgui_lib {
    new_frame :: proc(width, height: i32, delta_time: f64) ---
    render :: proc() ---
    shutdown :: proc() ---
    handle_event :: proc(event: ^sapp.Event) -> bool ---
}

@(default_calling_convention="c")
foreign simgui_lib {
	simgui_setup            :: proc(desc: ^Desc) ---
}

setup :: proc(desc_: Desc) {
    desc := desc_;
    simgui_setup(&desc);
}
