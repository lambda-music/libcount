(import (lamu lang))
(use "libnewp")

(define-if-not-defined count-instance #f)

(define (count-start)
  (open-output "count")
  (set! count-instance (newp dir: #!current-dir 
                             "fluidsynth" "--gain=4" 
                             "--midi-driver=jack"
                             "-o" "audio.jack.id=count" 
                             "--connect-jack-outputs"
                             "Numbers3.20170913.sf2" ))
  (newp-add count-instance)
  (connect 
   (string-concatenate (list (pu:get-client-name) ":count"))
   "count:midi"))
(define (count-stop)
  (kilp count-instance)
  (close-output "count"))


