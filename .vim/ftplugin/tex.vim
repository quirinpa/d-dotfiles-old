function! MakeTex()
	w
	let fname = expand("%:t:r")
	let result = system("pdflatex " . expand("%") . " && mupdf " . fname . ".pdf")
	execute system("rm " . fname . ".aux " . fname . ".log")
	echo result
endfunction
