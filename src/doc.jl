"""
	doc(fname, title="", width=800, height=600)

	
Display the contents of file name `fname` in a browser (webview) window.
Alternatively, `fname` can be a URL address.

Example, display the contents of the README.md file located in current dir.

   doc("README.md")

to display the contents of the `examples.md` file located in the docs/src dir of the module GMT, do

   doc(GMT, "examples.md")

To display the doc strings of any documented function, just do (i.e to show the *sin* docs)

   doc(sin)
"""
function doc(fname::AbstractString; title::AbstractString="", width::Integer=0, height::Integer=0)

	if (width == 0)  width  = 800  end
	if (height == 0) height = 600  end
	if (title == "") title, = splitext(basename(fname))  end
	if (startswith(fname, "http") || startswith(fname, "ftp") || startswith(fname, "file"))
		webview(title, fname, width, height)
	else
		MD = Markdown.parse_file(fname);
		webview(title, "data:text/html,<html>" * html(MD) * "</html>", width, height)
	end
end

function doc(mod::Module, fname::AbstractString; title::AbstractString="", width::Integer=0, height::Integer=0)
	if (fname == "README" || fname == "README.md")
		fn = joinpath(dirname(pathof(mod)), "..", "README.md")
	else
		fn = joinpath(dirname(pathof(mod)), "..", joinpath("docs/src", fname))
	end
	doc(fn, title=title, width=width, height=height)
end

function doc(fun; width::Integer=0, height::Integer=0)
	# Method to show the @doc string of a function
	if (width == 0)  width  = 800  end
	if (height == 0) height = 600  end
	webview(string(fun), "data:text/html,<html>" * html(Base.Docs.doc(fun)) * "</html>", width, height)
end