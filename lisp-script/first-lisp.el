;; learn lisp,first lisp script
;; Author: She Jie
;; data: 2017-6-3

(+ 2 2)

(+ 2 (+ 1 1))

(setq name "SheJie")


(insert "Hello")

(insert "Hello" " Word" "!")

(insert "Hi! I am " name ".")

(defun hi () (insert "Hi! I am " name "."))

(hi)

(defun hello (word) (insert "Hello " word "!"))

(hello "world")

(switch-to-buffer-other-window "*test*")

(progn
  (switch-to-buffer-other-window "*test*")
  (hello "world"))

(progn
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  (hello "there"))

(progn
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  (hello "world")
  (other-window 1))

(let ((local-variable "world"))
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  (hello local-variable)
  (other-window 1))

(format "Hello %s!" "visitor")

(defun hello (word) (format "Hello %s!" word))

(hello "world")

(defun greeting (word)
  (let ((my-name "SheJie"))
    (insert (format "Hello %s!\n\n My name is %s."
		    word
		    my-name
		    ))))

(greeting "world")

(read-from-minibuffer "Enter you name: ")

(defun greeting (name)
  (let ((you-name (read-from-minibuffer "Enter you name: ")))
    (insert (format "Hello!\n\n I am %s and you are %s."
		    name
		    you-name
		    ))))

(greeting "SheJie")

(setq list-of-names '("Wang" "Zhang" "Li"))

(car list-of-names)

(cdr list-of-names)

(push "Mao" list-of-names)

(mapcar 'hello list-of-names)

(defun greeting ()
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  (mapcar 'hello list-of-names)
  (other-window 1))

(greeting)

(defun replace-hello-by-hi ()
  (switch-to-buffer-other-window "*test*")
  (goto-char (point-min))
  (while (search-forward "Hello")
    (replace-match "Hi"))
  (other-window 1))

(replace-hello-by-hi)

(defun hello-to-hi ()
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  (mapcar 'hello list-of-names)
  (goto-char (point-min))
  (while (search-forward "Hello" nil 't)
    (replace-match "Hi"))
  (other-window 1))

(hello-to-hi)

