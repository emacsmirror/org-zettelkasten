;;; org-zettelkasten-consult.el --- Helper functions to use Zettelkasten in org-mode  -*- lexical-binding: t; -*-

;; Author: Yann Herklotz <yann@ymhg.org>
;; Created: 2022
;; Version: 0.3.0
;; Package-Requires: ((emacs "24.3") (consult "0.20"))
;; Keywords: files, hypermedia, Org, notes
;; Homepage: https://github.com/ymherklotz/emacs-zettelkasten

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; These functions allow for the use of the zettelkasten method in org-mode.
;;
;; It uses the CUSTOM_ID property to store a permanent ID to the note,
;; which are organised in the same fashion as the notes by Luhmann.

;;; Code:

(require 'consult)

(defun org-zettelkasten-consult-search-current-id ()
  "Use `consult-ripgrep' to search for the current ID in all files."
  (interactive)
  (let ((current-id (org-entry-get nil "CUSTOM_ID")))
    (consult-ripgrep org-zettelkasten-directory (concat "[\\[:]." current-id "\\]#"))))

(provide 'org-zettelkasten-consult)

;;; org-zettelkasten-consult.el ends here
