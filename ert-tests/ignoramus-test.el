
;;; requires and setup

(require 'ignoramus)


;;; working-directory

(ert-deftest ignoramus:a-ignoramus-working-directory-01 nil
  "Check that we are running from the ert-tests directory"
  (should
   (file-exists-p "ignoramus-test.el"))
  (should
   (string-match-p "/ert-tests/\\'" default-directory)))


;;; ignoramus-boring-p

(ert-deftest ignoramus:b-ignoramus-boring-p-01 nil
  (let ((file "filename~"))
    (should
     (ignoramus-boring-p (file-name-nondirectory file)))))

(ert-deftest ignoramus:b-ignoramus-boring-p-02 nil
  (let ((file "filename~")
        (case-fold-search ignoramus-case-insensitive))
    (should
     (ignoramus-boring-p (file-name-nondirectory file)))))

(ert-deftest ignoramus:b-ignoramus-boring-p-03 nil
  (let ((file "filename~")
        (ignoramus-use-known-datafiles nil))
    (should
     (ignoramus-boring-p (file-name-nondirectory file)))))

(ert-deftest ignoramus:b-ignoramus-boring-p-04 nil
  (let ((file "filename.el"))
    (should-not
     (ignoramus-boring-p (file-name-nondirectory file)))))

(ert-deftest ignoramus:b-ignoramus-boring-p-05 nil
  (let ((file "filename.el")
        (case-fold-search ignoramus-case-insensitive))
    (should-not
     (ignoramus-boring-p (file-name-nondirectory file)))))

(ert-deftest ignoramus:b-ignoramus-boring-p-06 nil
  (let ((file "filename.el")
        (ignoramus-use-known-datafiles nil))
    (should-not
     (ignoramus-boring-p (file-name-nondirectory file)))))

(ert-deftest ignoramus:b-ignoramus-boring-p-07 nil
  (let ((file "script.sh"))
    (should-not
     (ignoramus-boring-p (file-name-nondirectory file)))))

(ert-deftest ignoramus:b-ignoramus-boring-p-08 nil
  (let ((file "script.sh")
        (case-fold-search ignoramus-case-insensitive))
    (should-not
     (ignoramus-boring-p (file-name-nondirectory file)))))

(ert-deftest ignoramus:b-ignoramus-boring-p-09 nil
  (let ((file "script.sh")
        (ignoramus-use-known-datafiles nil))
    (should-not
     (ignoramus-boring-p (file-name-nondirectory file)))))

(ert-deftest ignoramus:b-ignoramus-boring-p-10 nil
  (let ((file "script.sh.bak"))
    (should
     (ignoramus-boring-p (file-name-nondirectory file)))))

(ert-deftest ignoramus:b-ignoramus-boring-p-11 nil
  (let ((file "script.sh.bak")
        (case-fold-search ignoramus-case-insensitive))
    (should
     (ignoramus-boring-p (file-name-nondirectory file)))))

(ert-deftest ignoramus:b-ignoramus-boring-p-12 nil
  (let ((file "script.sh.bak")
        (ignoramus-use-known-datafiles nil))
    (should
     (ignoramus-boring-p (file-name-nondirectory file)))))

(ert-deftest ignoramus:b-ignoramus-boring-p-13 nil
  (let ((file "ignoramus-test.el"))
    (should-not
     (ignoramus-boring-p (file-name-nondirectory file)))))

(ert-deftest ignoramus:b-ignoramus-boring-p-14 nil
  (let ((file "ignoramus-test.el")
        (case-fold-search ignoramus-case-insensitive))
    (should-not
     (ignoramus-boring-p (file-name-nondirectory file)))))

(ert-deftest ignoramus:b-ignoramus-boring-p-15 nil
  (let ((file "ignoramus-test.el")
        (ignoramus-use-known-datafiles nil))
    (should-not
     (ignoramus-boring-p (file-name-nondirectory file)))))


;;; variable ignoramus-boring-file-regexp

(ert-deftest ignoramus:b-ignoramus-boring-file-regexp-01 nil
  (unless ignoramus-boring-file-regexp
    (ignoramus-compute-common-regexps))
  (should
   (stringp ignoramus-boring-file-regexp))
  (should
   (> (length ignoramus-boring-file-regexp) 100)))

(ert-deftest ignoramus:b-ignoramus-boring-file-regexp-02 nil
  (let ((file "filename~"))
    (should
     (string-match-p ignoramus-boring-file-regexp (file-name-nondirectory file)))))

(ert-deftest ignoramus:b-ignoramus-boring-file-regexp-03 nil
  (let ((file "filename~")
        (case-fold-search ignoramus-case-insensitive))
    (should
     (string-match-p ignoramus-boring-file-regexp (file-name-nondirectory file)))))

(ert-deftest ignoramus:b-ignoramus-boring-file-regexp-04 nil
  (let ((file "filename.el"))
    (should-not
     (string-match-p ignoramus-boring-file-regexp (file-name-nondirectory file)))))

(ert-deftest ignoramus:b-ignoramus-boring-file-regexp-05 nil
  (let ((file "filename.el")
        (case-fold-search ignoramus-case-insensitive))
    (should-not
     (string-match-p ignoramus-boring-file-regexp (file-name-nondirectory file)))))

(ert-deftest ignoramus:b-ignoramus-boring-file-regexp-06 nil
  (let ((file "script.sh"))
    (should-not
     (string-match-p ignoramus-boring-file-regexp (file-name-nondirectory file)))))

(ert-deftest ignoramus:b-ignoramus-boring-file-regexp-07 nil
  (let ((file "script.sh")
        (case-fold-search ignoramus-case-insensitive))
    (should-not
     (string-match-p ignoramus-boring-file-regexp (file-name-nondirectory file)))))

(ert-deftest ignoramus:b-ignoramus-boring-file-regexp-08 nil
  (let ((file "script.sh.bak"))
    (should
     (string-match-p ignoramus-boring-file-regexp (file-name-nondirectory file)))))

(ert-deftest ignoramus:b-ignoramus-boring-file-regexp-09 nil
  (let ((file "script.sh.bak")
        (case-fold-search ignoramus-case-insensitive))
    (should
     (string-match-p ignoramus-boring-file-regexp (file-name-nondirectory file)))))

(ert-deftest ignoramus:b-ignoramus-boring-file-regexp-10 nil
  (let ((file "ignoramus-test.el"))
    (should-not
     (string-match-p ignoramus-boring-file-regexp (file-name-nondirectory file)))))

(ert-deftest ignoramus:b-ignoramus-boring-file-regexp-11 nil
  (let ((file "ignoramus-test.el")
        (case-fold-search ignoramus-case-insensitive))
    (should-not
     (string-match-p ignoramus-boring-file-regexp (file-name-nondirectory file)))))


;;; ignoramus--string-or-symbol

(ert-deftest ignoramus:b-ignoramus--string-or-symbol-01 nil
  (let ((symbol "string"))
    (should
     (equal "string"
            (ignoramus--string-or-symbol symbol)))))

(ert-deftest ignoramus:b-ignoramus--string-or-symbol-02 nil
  (should-not
   (ignoramus--string-or-symbol (gensym))))

(ert-deftest ignoramus:b-ignoramus--string-or-symbol-03 nil
  (should
   (equal "string"
          (ignoramus--string-or-symbol "string"))))

(ert-deftest ignoramus:b-ignoramus--string-or-symbol-04 nil
  (let ((symbol '("string1" "string 2")))
    (should
     (equal '("string1" "string 2")
            (ignoramus--string-or-symbol symbol)))))

(ert-deftest ignoramus:b-ignoramus--string-or-symbol-05 nil
  (let ((symbol1 "string1")
        (symbol2 "string2")
        (symbol '(symbol1 symbol2)))
    (should
     (equal '("string1" "string2")
            (ignoramus--string-or-symbol symbol)))))


;;; ignoramus--extract-strings

(ert-deftest ignoramus:b-ignoramus--extract-strings-01 nil
  (let ((symbol "string"))
    (should
     (equal '("string")
            (ignoramus--extract-strings symbol)))))

(ert-deftest ignoramus:b-ignoramus--extract-strings-02 nil
  (should-not
   (ignoramus--extract-strings (gensym))))

(ert-deftest ignoramus:b-ignoramus--extract-strings-03 nil
  (should
   (equal '("string")
          (ignoramus--extract-strings "string"))))

(ert-deftest ignoramus:b-ignoramus--extract-strings-04 nil
  (let ((symbol '("string1" "string 2")))
    (should
     (equal '("string1" "string 2")
            (ignoramus--extract-strings symbol)))))

(ert-deftest ignoramus:b-ignoramus--extract-strings-05 nil
  (let ((symbol1 "string1")
        (symbol2 "string2")
        (symbol '(symbol1 symbol2)))
    (should
     (equal '("string1" "string2")
            (ignoramus--extract-strings symbol)))))

(ert-deftest ignoramus:b-ignoramus--extract-strings-06 nil
  (let ((symbol1 '("string1" "string2"))
        (symbol2 '("string3" "string4"))
        (symbol '(symbol1 "stringz" symbol2)))
    (should
     (equal '("string1" "string2" "stringz" "string3" "string4")
            (ignoramus--extract-strings symbol)))))


;;; ignoramus--extract-pathstrings

(ert-deftest ignoramus:b-ignoramus--extract-pathstrings-01 nil
  (let ((value "nonexistent_file"))
    (should
     (equal (list (expand-file-name value default-directory))
            (ignoramus--extract-pathstrings value)))))

(ert-deftest ignoramus:b-ignoramus--extract-pathstrings-02 nil
  "Returns nil because the path is too inclusive"
  (let ((value "/"))
    (should-not
     (ignoramus--extract-pathstrings value))))

(ert-deftest ignoramus:b-ignoramus--extract-pathstrings-03 nil
  "Returns nil because the path is too inclusive"
  (let ((value "~/"))
    (should-not
     (ignoramus--extract-pathstrings value))))

(ert-deftest ignoramus:b-ignoramus--extract-pathstrings-04 nil
  (let ((value "/Volumes"))
    (should
     (equal (list value)
            (ignoramus--extract-pathstrings value)))))

(ert-deftest ignoramus:b-ignoramus--extract-pathstrings-05 nil
  (let ((value "~/.recentf"))
    (should
     (equal (list (file-truename (expand-file-name value)))
            (ignoramus--extract-pathstrings value)))))


;;; ignoramus-list-flatten

(ert-deftest ignoramus:b-ignoramus-list-flatten-01 nil
  (let ((value '((1 2) 3 4 (5 6 (7 8)))))
    (should
     (equal '(1 2 3 4 5 6 7 8)
            (ignoramus-list-flatten value)))))


;;; ignoramus-strip-trailing-slash

(ert-deftest ignoramus:b-ignoramus-strip-trailing-slash-01 nil
  (let ((value "~/.emacs.d"))
    (should
     (equal value
            (ignoramus-strip-trailing-slash value)))))

(ert-deftest ignoramus:b-ignoramus-strip-trailing-slash-02 nil
  (let ((value "~/.emacs.d/"))
    (should
     (equal "~/.emacs.d"
            (ignoramus-strip-trailing-slash value)))))

(ert-deftest ignoramus:b-ignoramus-strip-trailing-slash-03 nil
  (let ((value "~/.emacs.d//"))
    (should
     (equal "~/.emacs.d"
            (ignoramus-strip-trailing-slash value)))))


;;; ignoramus-ensure-trailing-slash

(ert-deftest ignoramus:b-ignoramus-ensure-trailing-slash-01 nil
  (let ((value "~/.emacs.d"))
    (should
     (equal "~/.emacs.d/"
            (ignoramus-ensure-trailing-slash value)))))

(ert-deftest ignoramus:b-ignoramus-ensure-trailing-slash-02 nil
  (let ((value "~/.emacs.d/"))
    (should
     (equal value
            (ignoramus-ensure-trailing-slash value)))))

(ert-deftest ignoramus:b-ignoramus-ensure-trailing-slash-03 nil
  (let ((value "~/.emacs.d//"))
    (should
     (equal "~/.emacs.d/"
            (ignoramus-ensure-trailing-slash value)))))


;;; ignoramus-matches-datafile - todo test every TYPE

(ert-deftest ignoramus:b-ignoramus-matches-datafile-01 nil
  (let ((file-cleanup nil)
        (recentf-save-file "~/.recentf"))
    (require 'recentf)
    (should
     (featurep 'recentf))
    (ignoramus-compute-common-regexps)
    (should
     (stringp recentf-save-file))
    (unless (file-exists-p recentf-save-file)
      (setq file-cleanup t)
      (with-temp-buffer
        (write-file recentf-save-file)))
    (should
     (file-exists-p recentf-save-file))
    (should
     (ignoramus-matches-datafile recentf-save-file))
    (when (and file-cleanup
               (eq 0 (nth 7 (file-attributes recentf-save-file))))
      (delete-file recentf-save-file))))

(ert-deftest ignoramus:b-ignoramus-matches-datafile-02 nil
  "should still match when file does not exist"
  (let ((recentf-save-file "~/.recentf-but-nonexistent-file"))
    (ignoramus-compute-common-regexps)
    (should-not
     (file-exists-p recentf-save-file))
    (should
     (ignoramus-matches-datafile recentf-save-file))))

(ert-deftest ignoramus:b-ignoramus-matches-datafile-03 nil
  (let ((file "filename~"))
    (should-not
     (ignoramus-matches-datafile file))))

(ert-deftest ignoramus:b-ignoramus-matches-datafile-04 nil
  (let ((file "filename.el"))
    (should-not
     (ignoramus-matches-datafile file))))

(ert-deftest ignoramus:b-ignoramus-matches-datafile-05 nil
  (let ((file "script.sh"))
    (should-not
     (ignoramus-matches-datafile file))))

(ert-deftest ignoramus:b-ignoramus-matches-datafile-06 nil
  (let ((file "script.sh.bak"))
    (should-not
     (ignoramus-matches-datafile file))))

(ert-deftest ignoramus:b-ignoramus-matches-datafile-07 nil
  (let ((file "ignoramus-test.el"))
    (should-not
     (ignoramus-matches-datafile file))))


;;; ignoramus-register-datafile - todo test every TYPE

(ert-deftest ignoramus:b-ignoramus-register-datafile-01 nil
  (let ((value "/full/path/to/nonexistent/file_1.txt"))
    (should-not
     (ignoramus-matches-datafile value))
    (ignoramus-register-datafile value 'completepath)
    (should
     (ignoramus-matches-datafile value))
    (ignoramus-register-datafile value 'completepath 'unregister)
    (should-not
     (ignoramus-matches-datafile value))))

(ert-deftest ignoramus:b-ignoramus-register-datafile-02 nil
  (let ((value "/full/path/to/nonexistent/file_2.txt")
        (sym (gensym "--ignoramus-testing--")))
    (set sym value)
    (should-not
     (ignoramus-matches-datafile value))
    (ignoramus-register-datafile sym 'completepath)
    (should
     (ignoramus-matches-datafile value))
    (ignoramus-register-datafile sym 'completepath 'unregister)
    (should-not
     (ignoramus-matches-datafile value))))

(ert-deftest ignoramus:b-ignoramus-register-datafile-03 nil
  "Test `ignoramus-case-insensitive'"
  (let ((value "/full/path/to/nonexistent/file_3.txt")
        (upcase-value "/full/path/to/nonexistent/file_3.TXT"))
    (should-not
     (ignoramus-matches-datafile value))
    (ignoramus-register-datafile value 'completepath)
    (should
     (ignoramus-matches-datafile value))
    (let ((ignoramus-case-insensitive nil))
      (should-not
       (ignoramus-matches-datafile upcase-value)))
    (let ((ignoramus-case-insensitive t))
      (should
       (ignoramus-matches-datafile upcase-value)))
    (ignoramus-register-datafile value 'completepath 'unregister)
    (should-not
     (ignoramus-matches-datafile value))))

(ert-deftest ignoramus:b-ignoramus-register-datafile-04 nil
  (let ((value "/full/path/to/nonexistent/file_1.txt"))
    (should-not
     (ignoramus-matches-datafile value))
    (ignoramus-register-datafile value 'completepath)
    (should
     (ignoramus-matches-datafile value))
    (ignoramus-register-datafile value 'completepath 'unregister)
    (should-not
     (ignoramus-matches-datafile value))))


;;; ignoramus-known-actions

(ert-deftest ignoramus:b-ignoramus-known-actions-01 nil
  (should
   (eq (length ignoramus-known-actions)
       (let ((count 1))         ; 'all counts for 1
         (save-match-data
           (mapatoms #'(lambda (sym)
                         (when (and (functionp sym)
                                    (string-match "\\`ignoramus-do-ignore-\\(.+\\)" (symbol-name sym))
                                    (memq (intern (match-string 1 (symbol-name sym))) ignoramus-known-actions))
                           (incf count)))))
         count))))


;;; ignoramus-compute-common-regexps

(ert-deftest ignoramus:z-ignoramus-compute-common-regexps-01 nil
  (let ((ignoramus-use-known-datafiles nil))
    (should
     (equal "\\`[abc]\\|\\`[ghi]\\'\\|j\\|k\\|l"
            (progn
              (let ((ignoramus-file-basename-beginnings  '("a" "b" "c"))
                    (ignoramus-file-basename-endings     '("d" "e" "f"))
                    (ignoramus-file-basename-exact-names '("g" "h" "i"))
                    (ignoramus-file-basename-regexps     '("j" "k" "l")))
                (ignoramus-compute-common-regexps))
              (prog1
                  ignoramus-boring-dir-regexp
                (ignoramus-compute-common-regexps)))))))

(ert-deftest ignoramus:z-ignoramus-compute-common-regexps-02 nil
  (let ((ignoramus-use-known-datafiles nil))
    (should
     (equal "\\`[abc]\\|[def]\\'\\|\\`[ghi]\\'\\|j\\|k\\|l"
            (progn
              (let ((ignoramus-file-basename-beginnings  '("a" "b" "c"))
                    (ignoramus-file-basename-endings     '("d" "e" "f"))
                    (ignoramus-file-basename-exact-names '("g" "h" "i"))
                    (ignoramus-file-basename-regexps     '("j" "k" "l")))
                (ignoramus-compute-common-regexps))
              (prog1
                  ignoramus-boring-file-regexp
                (ignoramus-compute-common-regexps)))))))


;;; ignoramus-setup

(ert-deftest ignoramus:z-ignoramus-setup-01 nil
  (let ((value '("g" "h" "i")))
    (should
     (equal value
            (let ((ignoramus-file-exact-names value)
                  (vc-directory-exclusion-list nil))
              (ignoramus-setup 'vc)
              vc-directory-exclusion-list)))
    (ignoramus-setup 'vc)))


;;
;; Emacs
;;
;; Local Variables:
;; indent-tabs-mode: nil
;; mangle-whitespace: t
;; require-final-newline: t
;; coding: utf-8
;; byte-compile-warnings: (not cl-functions)
;; End:
;;

;;; ignoramus-test.el ends here
