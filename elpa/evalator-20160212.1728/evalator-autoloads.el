;;; evalator-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "evalator" "evalator.el" (22254 44498 0 0))
;;; Generated autoloads from evalator.el

(autoload 'evalator-insert-equiv-expr "evalator" "\
Insert the equivalent expression of the previous evalator session into the current buffer.

\(fn)" t nil)

(autoload 'evalator-resume "evalator" "\
Resume last evalator session.

\(fn)" t nil)

(autoload 'evalator "evalator" "\
Start an evalator session.

Function accepts an optional MODE keyword and a CONTEXT symbol.

If MODE is non-nil and a currently supported mode value then that mode
will be used for the session.

Below are currently supported values for MODE:

`:explicit'

If MODE is nil evalator will start in normal mode.

If CONTEXT is non-nil, then the result of calling CONTEXT's function
definition will be used as the session's evaluation context.

If CONTEXT is nil, then the current buffer's major mode will be
searched for in `evalator-config-mode-context-alist'.  If a match is
found, the context associated with that major mode is used in the
evalator session.  If no match is found, an elisp evaluation context
is used instead.

\(fn &optional MODE CONTEXT)" t nil)

(autoload 'evalator-explicit "evalator" "\
Helper function to start an evalator-session in explicit mode.

In explicit mode the data generated will always be represented as a
single candidate.  This is the only mode that allows an equivalent
expression of the session to be generated through
`evalator-insert-equiv-expr'.

\(fn &optional CONTEXT)" t nil)

;;;***

;;;### (autoloads nil "evalator-elisp" "evalator-elisp.el" (22254
;;;;;;  44499 0 0))
;;; Generated autoloads from evalator-elisp.el

(autoload 'evalator-elisp-context "evalator-elisp" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil nil ("evalator-config.el" "evalator-context.el"
;;;;;;  "evalator-faces.el" "evalator-history.el" "evalator-key-map.el"
;;;;;;  "evalator-pkg.el" "evalator-state.el" "evalator-utils.el")
;;;;;;  (22254 44499 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; evalator-autoloads.el ends here
