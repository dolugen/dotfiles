;;need emacs24 for these configs:
(require 'package)
(package-initialize)
(add-to-list 'package-archives
            '("marmalade" . "http://marmalade-repo.org/packages/") t)

(elpy-enable)
