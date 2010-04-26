;; -*- lisp -*-

; My LaTeX Wizard
(defun latex-wizard ()
  "Insert all the basic code required to create a usable LaTeX document which can be compiled into a PDF file."
  (interactive)
  (insert "\\documentclass[12pt,a4paper]{article}\n")
  (insert "\\pagestyle{headings}\n\n")
  (insert "\\usepackage[utf8x]{inputenc}\n")
  (insert "\\usepackage{amsmath}\n")
  (insert "\\usepackage{amsfonts}\n")
  (insert "\\usepackage{amssymb}\n")
  (insert "\\usepackage{amsthm}\n")
  (insert "\\usepackage{graphicx}\n")
  (insert "\\usepackage[margin=0.9in]{geometry}\n")
  (insert "\\usepackage{ucs}\n")
  (insert "\\usepackage[british]{babel}\n")
  (insert "\\usepackage[nodayofweek]{datetime}\n")
  (insert "\\usepackage{enumitem}\n")
  (insert "\\usepackage{multirow}\n\n")
  (insert "\\newcommand{\\superscript}[1]{\\ensuremath{^{\\textrm{#1}}}}\n")
  (insert "\\newcommand{\\subscript}[1]{\\ensuremath{_{\\textrm{#1}}}}\n\n")
  (insert "\\author{Michael Walker}\n")
  (insert "\\title{}\n\n")
  (insert "\\begin{document}\n\n")
  (insert "\\maketitle{}\n\n\n\n")
  (insert "\\end{document}"))

; Compile a LaTeX source file into a PDF.
(defun latex-compile-pdf () 
  "Compile a LaTeX file into a PDF document."
  (interactive)
  (save-excursion
	(let ((cb (current-buffer)))
	  (set-buffer (get-buffer-create "*TEMP*"))
	  (call-process "pdflatexemacs" nil nil nil (buffer-file-name cb)))))

; View a PDF file generated from the current LaTeX file
(defun latex-view-pdf ()
  "View the compiled PDF form of the LaTeX file generated by latex-compile-pdf"
  (interactive)
  (save-excursion
	(let ((cb (current-buffer)))
	  (call-process "epdfview" nil nil nil (concat (substring (buffer-file-name cb) 0 -4) ".pdf" )))))

; Insert a table
(defun latex-insert-table ()
  "Insert a table into the current LaTeX document"
  (interactive)
  (insert "\\begin{center}\n")
  (insert "  \\begin{tabular}{|c|c|}\n")
  (insert "    \\hline & \\\\\n")
  (insert "    \\hline \n")
  (insert "  \\end{tabular}\n")
  (insert "\\end{center}"))

; Insert a formula block
(defun latex-insert-formula ()
  "Insert a formula block into the current LaTeX document"
  (interactive)
  (insert "\\begin{equation}\n")
  (insert "\\begin{array}{rl}\n")
  (insert "  &= \\\\\n")
  (insert "\\end{array}\n")
  (insert "\\end{equation}"))

; Insert an algorithm block
(defun latex-insert-algorithm ()
  "Insert an algorithm block into the current LaTeX document"
  (interactive)
  (insert "\\begin{algorithm}\n")
  (insert "  \\caption{}\n")
  (insert "  \\label{alg}\n")
  (insert "  \\begin{algorithmic}\n")
  (insert "  \\end{algorithmic}\n")
  (insert "\\end{algorithm}"))

; Insert a figure
(defun latex-insert-figure ()
  "Insert a figure into the current document"
  (interactive)
  (insert "\\begin{figure}[here]\n")
  (insert "  \\begin{center}\n")
  (insert "    \\includegraphics[scale=0.6]{images/.png}\n")
  (insert "    \\caption{}\n")
  (insert "    \\label{fig:}\n")
  (insert "  \\end{center}\n")
  (insert "\\end{figure}"))

; Insert an enumerated list
(defun latex-insert-enumerated ()
  "Insert an enumerated list into the current document"
  (interactive)
  (insert "\\begin{enumerate}\n")
  (insert "  \\item \n")
  (insert "\\end{enumerate}"))

; Insert a bulleted list
(defun latex-insert-itemize ()
  "Insert a bulleted list into the current document"
  (interactive)
  (insert "\\begin{itemize}\n")
  (insert "  \\item \n")
  (insert "\\end{itemize}"))

; Insert an enumerated list
(defun latex-insert-description ()
  "Insert a description list into the current document"
  (interactive)
  (insert "\\begin{description}\n")
  (insert "  \\item[] \n")
  (insert "\\end{description}"))

(provide 'latex-wizard)
(provide 'latex-compile-pdf)
(provide 'latex-view-pdf)
(provide 'latex-insert-table)
(provide 'latex-insert-formula)
(provide 'latex-insert-figure)
(provide 'latex-insert-enumerated)
(provide 'latex-insert-itemize)
(provide 'latex-insert-description)
