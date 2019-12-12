@setlocal
@echo off

set INCLUDE_DEBUG_INFO=/Z7
set CC=cl /nologo /O2 /I. %INCLUDE_DEBUG_INFO% /c
set LD=lib /nologo
set RM=del

%CC% sokol_gfx\sokol_gfx_d3d11.c && %LD% sokol_gfx_d3d11.obj /OUT:sokol_gfx\sokol_gfx_d3d11.lib && %RM% sokol_gfx_d3d11.obj
