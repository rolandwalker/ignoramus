
;;; requires and setup

(require 'ignoramus)

;;; ignoramus-boring-p

(ert-deftest ignoramus-boring-p-01 nil
  (should
   (ignoramus-boring-p "filename~")))


;;; ignoramus-compute-common-regexps

(ert-deftest ignoramus-compute-common-regexps-01 nil
  (should (equal "\\`[abc]\\|\\`[ghi]\\'\\|j\\|k\\|l"
                 (let ((ignoramus-file-beginnings  '("a" "b" "c"))
                       (ignoramus-file-endings     '("d" "e" "f"))
                       (ignoramus-file-exact-names '("g" "h" "i"))
                       (ignoramus-file-regexps     '("j" "k" "l")))
                   (ignoramus-compute-common-regexps)
                   (prog1
                       ignoramus-boring-dir-regexp
                     (ignoramus-compute-common-regexps))))))

(ert-deftest ignoramus-compute-common-regexps-02 nil
   (should (equal "\\`[abc]\\|[def]\\'\\|\\`[ghi]\\'\\|j\\|k\\|l"
                  (let ((ignoramus-file-beginnings  '("a" "b" "c"))
                        (ignoramus-file-endings     '("d" "e" "f"))
                        (ignoramus-file-exact-names '("g" "h" "i"))
                        (ignoramus-file-regexps     '("j" "k" "l")))
                    (ignoramus-compute-common-regexps)
                    (prog1
                        ignoramus-boring-file-regexp
                      (ignoramus-compute-common-regexps))))))

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
