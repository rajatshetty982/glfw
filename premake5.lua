project("GLFW")
kind("StaticLib")
language("C")
staticruntime("on")

targetdir("../../bin/" .. outputdir .. "/%{prj.name}")
objdir("../../bin-int/" .. outputdir .. "/%{prj.name}")

files({
	"include/GLFW/*.h",
	"src/internal.h",
	"src/mappings.h",
	"src/context.c",
	"src/init.c",
	"src/input.c",
	"src/monitor.c",
	"src/vulkan.c",
	"src/window.c",
	"src/platform.c",
	"src/null_init.c",
	"src/null_monitor.c",
	"src/null_window.c",
	"src/null_joystick.c",
})

filter("system:windows")
systemversion("latest")
defines({ "_GLFW_WIN32" })
files({ "src/win32_*.c", "src/wgl_context.c", "src/directm_joystick.c" })

filter("system:linux")
defines({
	"_GLFW_X11",
	-- "_GLFW_WAYLAND"
})
files({
	"src/x11_*.c",
	"src/wl_*.c",
	"src/posix_*.c",
	"src/linux_joystick.c",
	"src/xkb_unicode.c",
	"src/glx_context.c",
	"src/egl_context.c",
	"src/osmesa_context.c",
	"src/xdg-shell-protocol.c",
	"src/xdg-decoration-unstable-v1-protocol.c",
})

filter("system:macosx")
defines({ "_GLFW_COCOA" })
files({ "src/cocoa_*.c", "src/nsgl_context.c", "src/apple_joystick.c" })
