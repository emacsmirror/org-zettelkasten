;;; org-zettelkasten-test.el --- Tests for org-zettelkasten  -*- lexical-binding: t; -*-

;; Copyright (C) 2021-2023  Yann Herklotz

;; Author: Yann Herklotz <git@yannherklotz.com>
;; Maintainer: Yann Herklotz <git@yannherklotz.com>

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

;; Work-in-progress tests.

;;; Code:

(require 'org-zettelkasten)
(require 'ert)

(ert-deftest org-zettelkasten-test-incr-id-numeric ()
  "Test increment of purely numeric IDs."
  (should (string= (org-zettelkasten--incr-id "1") "2"))
  (should (string= (org-zettelkasten--incr-id "9") "10"))
  (should (string= (org-zettelkasten--incr-id "1023") "1024"))
  (should (string= (org-zettelkasten--incr-id "939") "940"))
  (should (string= (org-zettelkasten--incr-id "39999") "40000")))

(ert-deftest org-zettelkasten-test-incr-id-alpha ()
  "Test increment of purely alpha IDs."
  (should (string= (org-zettelkasten--incr-id "a") "b"))
  (should (string= (org-zettelkasten--incr-id "z") "aa"))
  (should (string= (org-zettelkasten--incr-id "roina") "roinb"))
  (should (string= (org-zettelkasten--incr-id "zzzzzzzzz") "aaaaaaaaaa"))
  (should (string= (org-zettelkasten--incr-id "bhz") "bia")))

(ert-deftest org-zettelkasten-test-incr-id-mixed ()
  "Test increment of mixed realistic IDs."
  (should (string= (org-zettelkasten--incr-id "1a1a1a") "1a1a1b"))
  (should (string= (org-zettelkasten--incr-id "1a1a1a1") "1a1a1a2")))
