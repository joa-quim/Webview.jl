# Webview.jl
Julia wrapper for the [Webview](https://github.com/zserge/webview) toolkit

Install
=======

    ] add https://github.com/joa-quim/Webview.jl

For Windows you can download the Webview DLL from [here](http://w3.ualg.pt/~jluis/ftp/webview_w64.dll)
and make sure that the lib *webview_w64.dll* is found by Julia (that is, put it in a directory listed
under your Windows path). For unix, I'm afraid the user will to have to build the Webview shared library
from source ([see](https://github.com/zserge/webview#getting-started-1)).

Using
=====

You can call Markdown files or URLs but for now the Markdown files must be provided with the full
file name (or files in current dir). The function name to use is ``doc``. Example, to display this
README file, do:

    doc("README.md")

and this displays the Julia main page

    doc("https://julialang.org/")

one can also display the contents of files located in the ``docs/src`` directory of a package.
As an example, this shows the contents of the ``GMT`` *examples.md* file

    doc(GMT, "examples.md")
