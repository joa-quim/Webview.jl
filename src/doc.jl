function doc(fname::AbstractString; title::AbstractString="", width::Integer=0, height::Integer=0)

	if (width == 0)  width = 800  end
	if (height == 0) height = 600 end
	if (title == "") title, = splitext(basename(fname))  end
	MD = Markdown.parse_file(fname);
	webview(title, "data:text/html,<html>" * html(MD) * "</html>", width, height)
end
