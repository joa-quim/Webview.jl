@static Sys.iswindows() ? (const thelib = "C:/programs/compa_libs/webview/compiled/VC12_64/webview_w64") : (const thelib = "libgmt")  # Name of GMT shared lib.
#@static Sys.iswindows() ? (Sys.WORD_SIZE == 64 ? (const thelib = "webview_w64") : (const thelib = "webview_w32")) : (const thelib = "libgmt")  # Name of GMT shared lib.

const Void = Cvoid
const NULL = C_NULL

mutable struct RECT
	left::Int32
	top::Int32
	right::Int32
	bottom::Int32
end

mutable struct webview_priv
	hwnd::Ptr{Cvoid}
#	IOleObject **browser;
	browser::Ptr{Ptr{Cvoid}};
	is_fullscreen::Int32
	saved_style::UInt32
	saved_ex_style::UInt32
	saved_rect::RECT
end

mutable struct webview
	url::Ptr{UInt8};
	title::Ptr{UInt8};
	width::Int32
	height::Int32
	resizable::Int32
	debug::Int32
#	external_invoke_cb::webview_external_invoke_cb_t
	external_invoke_cb::Ptr{Cvoid}
	priv::webview_priv
	userdata::Ptr{Cvoid}
end

function webview(title::Ptr{UInt8}, url::Ptr{UInt8}, width::Integer=800, height::Integer=600, resizable::Integer=1)
	ccall((:webview, thelib), Cint, (Ptr{UInt8}, Ptr{UInt8}, Cint, Cint, Cint),
	                                 title, url, width, height, resizable)
end
function webview(title::String, url::String, width::Integer=800, height::Integer=600, resizable::Integer=1)
	ccall((:webview, thelib), Cint, (Ptr{UInt8}, Ptr{UInt8}, Cint, Cint, Cint),
	                                 title, url, width, height, resizable)
end

function webview_init(wv::Ptr{webview})
	ccall((:webview_init, thelib), Cint, (Ptr{webview},), wv)
end
