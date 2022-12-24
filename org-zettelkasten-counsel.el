;;; org-zettelkasten-counsel.el --- Counsel integration for org-zettelkasten  -*- lexical-binding: t; -*-

;; Copyright (C) 2022-2023  Yann Herklotz
;;
;; Author: Yann Herklotz <yann@ymhg.org>
;; Maintainer: Yann Herklotz <yann@ymhg.org>
;; Keywords: files, hypermedia, Org, notes
;; Homepage: https://git.sr.ht/~ymherklotz/org-zettelkasten
;; Package-Requires: ((emacs "24.3") (org "9.0") (counsel "0.13"))

;; Version: 0.1.0

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

;; An extension to org-zettelkasten for counsel.  This is mainly useful
;; for a nicer interface to searching for back-references to the current
;; identifier.

;;; Code:

(require 'org)
(require 'counsel)

(eval-when-compile (defvar org-zettelkasten-directory))

(defun org-zettelkasten-counsel-search-current-id ()
  "Use `counsel-rg' to search for the current ID in all files."
  (interactive)
  (let ((current-id (org-entry-get nil "CUSTOM_ID")))
    (counsel-rg (concat "#" current-id) org-zettelkasten-directory "-g *.org" "ID: ")))

(provide 'org-zettelkasten-counsel)

;;; org-zettelkasten-counsel.el ends here
