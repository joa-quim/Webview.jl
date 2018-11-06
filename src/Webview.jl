module Webview

using Markdown

export
	webview, webview_init, doc

include("libwebview.jl")
include("doc.jl")

try
	webview_print_log("")
	global foundit = true
catch
	global foundit = false
end

if (!foundit)
	println("\n\nYou don't seem to have the Webview library installed and I don't currently")
	println("install it automatically, so you will have to do it yourself.")
	if (Sys.iswindows() && Sys.WORD_SIZE == 64)
		println("\nDownload from and install in a dir that is on your system's path")
		println("\t https://gmt.soest.hawaii.edu/projects/gmt/wiki/Download")
	elseif (Sys.iswindows() && Sys.WORD_SIZE == 32)
		println("I have not yet build a 32 bits version. Ping me if you do want one.")
	else
		println("For the time being you need to look at https://github.com/zserge/webview")
		println("for instructions on how to build it on *nix.")
	end
end

end # module
