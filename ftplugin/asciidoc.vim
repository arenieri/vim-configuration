" Only do these settings when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't do other file type settings for this buffer
let b:did_ftplugin = 1

" Run asciidoc to compile asciidoc file
setlocal makeprg=asciidoc\ %
"setlocal makeprg=asciidoc\ -a\ icons\ %

