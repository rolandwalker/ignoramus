
;;; requires and setup

(require 'ignoramus)

;;; ignoramus-boring-p

(ert-deftest ignoramus-boring-p-01 nil
  (should
   (ignoramus-boring-p "filename~")))


;;; ignoramus-compute-common-regexps

(ert-deftest ignoramus-compute-common-regexps-01 nil
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

(ert-deftest ignoramus-compute-common-regexps-02 nil
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


;;; ignoramus--string-or-symbol

(ert-deftest ignoramus--string-or-symbol-01 nil
  (let ((symbol "string"))
    (should
     (equal "string"
            (ignoramus--string-or-symbol symbol)))))

(ert-deftest ignoramus--string-or-symbol-02 nil
  (should-not
   (ignoramus--string-or-symbol (gensym))))

(ert-deftest ignoramus--string-or-symbol-03 nil
  (should
   (equal "string"
          (ignoramus--string-or-symbol "string"))))

(ert-deftest ignoramus--string-or-symbol-04 nil
  (let ((symbol '("string1" "string 2")))
    (should
     (equal '("string1" "string 2")
            (ignoramus--string-or-symbol symbol)))))

(ert-deftest ignoramus--string-or-symbol-05 nil
  (let ((symbol1 "string1")
        (symbol2 "string2")
        (symbol '(symbol1 symbol2)))
    (should
     (equal '("string1" "string2")
            (ignoramus--string-or-symbol symbol)))))


;;; ignoramus--extract-strings -- todo

(ert-deftest ignoramus--extract-strings-01 nil
  (let ((symbol "string"))
    (should
     (equal '("string")
            (ignoramus--extract-strings symbol)))))

(ert-deftest ignoramus--extract-strings-02 nil
  (should-not
   (ignoramus--extract-strings (gensym))))

(ert-deftest ignoramus--extract-strings-03 nil
  (should
   (equal '("string")
          (ignoramus--extract-strings "string"))))

(ert-deftest ignoramus--extract-strings-04 nil
  (let ((symbol '("string1" "string 2")))
    (should
     (equal '("string1" "string 2")
            (ignoramus--extract-strings symbol)))))

(ert-deftest ignoramus--extract-strings-05 nil
  (let ((symbol1 "string1")
        (symbol2 "string2")
        (symbol '(symbol1 symbol2)))
    (should
     (equal '("string1" "string2")
            (ignoramus--extract-strings symbol)))))

(ert-deftest ignoramus--extract-strings-06 nil
  (let ((symbol1 '("string1" "string2"))
        (symbol2 '("string3" "string4"))
        (symbol '(symbol1 "stringz" symbol2)))
    (should
     (equal '("string1" "string2" "stringz" "string3" "string4")
            (ignoramus--extract-strings symbol)))))


;;; ignoramus-list-flatten

(ert-deftest ignoramus-list-flatten-01 nil
  (let ((value '((1 2) 3 4 (5 6 (7 8)))))
    (should
     (equal '(1 2 3 4 5 6 7 8)
            (ignoramus-list-flatten value)))))


;;; ignoramus-strip-trailing-slash

(ert-deftest ignoramus-strip-trailing-slash-01 nil
  (let ((value "~/.emacs.d"))
    (should
     (equal value
            (ignoramus-strip-trailing-slash value)))))

(ert-deftest ignoramus-strip-trailing-slash-02 nil
  (let ((value "~/.emacs.d/"))
    (should
     (equal "~/.emacs.d"
            (ignoramus-strip-trailing-slash value)))))

(ert-deftest ignoramus-strip-trailing-slash-03 nil
  (let ((value "~/.emacs.d//"))
    (should
     (equal "~/.emacs.d"
            (ignoramus-strip-trailing-slash value)))))


;;; ignoramus-ensure-trailing-slash

(ert-deftest ignoramus-ensure-trailing-slash-01 nil
  (let ((value "~/.emacs.d"))
    (should
     (equal "~/.emacs.d/"
            (ignoramus-ensure-trailing-slash value)))))

(ert-deftest ignoramus-ensure-trailing-slash-02 nil
  (let ((value "~/.emacs.d/"))
    (should
     (equal value
            (ignoramus-ensure-trailing-slash value)))))

(ert-deftest ignoramus-ensure-trailing-slash-03 nil
  (let ((value "~/.emacs.d//"))
    (should
     (equal "~/.emacs.d/"
            (ignoramus-ensure-trailing-slash value)))))


;;; ignoramus-matches-datafile - todo test every TYPE

(ert-deftest ignoramus-matches-datafile-01 nil
  (require 'recentf)
  (should
   (ignoramus-matches-datafile recentf-save-file)))


;;; ignoramus-register-datafile - todo test every TYPE

(ert-deftest ignoramus-register-datafile-01 nil
  (let ((value "/full/path/to/nonexistent/file.txt"))
    (should-not
     (ignoramus-matches-datafile value))
    (ignoramus-register-datafile value 'completepath)
    (should
     (ignoramus-matches-datafile value))))

(ert-deftest ignoramus-register-datafile-02 nil
  (let ((value "/full/path/to/nonexistent/file_2.txt")
        (sym (gensym "--ignoramus-testing--")))
    (set sym value)
    (should-not
     (ignoramus-matches-datafile value))
    (ignoramus-register-datafile sym 'completepath)
    (should
     (ignoramus-matches-datafile value))))


;;; ignoramus-setup

(ert-deftest ignoramus-setup-01 nil
  (should
   (let ((ignoramus-file-exact-names '("g" "h" "i"))
         (vc-directory-exclusion-list nil))
     (ignoramus-setup 'vc)
     vc-directory-exclusion-list
     )))


;;; ignoramus-known-actions

(ert-deftest ignoramus-known-actions-01 nil
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
