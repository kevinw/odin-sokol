@setlocal
@echo off

set INCLUDE_DEBUG_INFO=/Z7
set CC=cl /nologo /O2 /I. %INCLUDE_DEBUG_INFO% /c
set LD=lib /nologo
set RM=del

%CC% sokol_app\sokol_app_d3d11.c && %LD% sokol_app_d3d11.obj /OUT:sokol_app\sokol_app_d3d11.lib && %RM% sokol_app_d3d11.obj
%CC% sokol_gl\sokol_gl_d3d11.c && %LD% sokol_gl_d3d11.obj /OUT:sokol_gl\sokol_gl_d3d11.lib && %RM% sokol_gl_d3d11.obj
%CC% sokol_time\sokol_time_d3d11.c && %LD% sokol_time_d3d11.obj /OUT:sokol_time\sokol_time_d3d11.lib && %RM% sokol_time_d3d11.obj
%CC% sokol_fetch\sokol_fetch_d3d11.c && %LD% sokol_fetch_d3d11.obj /OUT:sokol_fetch\sokol_fetch_d3d11.lib && %RM% sokol_fetch_d3d11.obj
%CC% sokol_gfx\sokol_gfx_d3d11.c && %LD% sokol_gfx_d3d11.obj /OUT:sokol_gfx\sokol_gfx_d3d11.lib && %RM% sokol_gfx_d3d11.obj

%CC% sokol_imgui\sokol_imgui_d3d11.c && %LD% sokol_imgui_d3d11.obj /OUT:sokol_imgui\sokol_imgui_d3d11.lib && %RM% sokol_imgui_d3d11.obj
