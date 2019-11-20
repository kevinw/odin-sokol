package sokol_fetch

when ODIN_OS == "windows" do foreign import sfetch_lib "sokol_fetch_d3d11.lib"

@(default_calling_convention="c")
foreign sfetch_lib {
    sfetch_setup :: proc(desc: ^Desc) ---
    sfetch_shutdown :: proc() ---
    sfetch_send :: proc(request: ^Request) -> Handle ---
    sfetch_cancel :: proc(request: Handle) ---
    sfetch_pause :: proc(request: Handle) ---
    sfetch_resume :: proc(request: Handle) ---
    sfetch_dowork :: proc() ---
    sfetch_bind_buffer :: proc(request: Handle, buffer: ^u8, buffer_size: u64) ---
}

bind_buffer :: proc(request: Handle, buffer: []u8) {
    sfetch_bind_buffer(request, &buffer[0], cast(u64)len(buffer));
}

setup :: proc(desc: Desc) {
    d := desc;
    sfetch_setup(&d);
}

send :: proc(request: Request) -> Handle {
    r := request;
    return sfetch_send(&r);
}

shutdown :: sfetch_shutdown;
dowork :: sfetch_dowork;
cancel :: sfetch_cancel;
pause :: sfetch_pause;
resume :: sfetch_resume;
