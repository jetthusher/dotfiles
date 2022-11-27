# Job Control

## Stopped jobs that are removed from the job table with the
## disown builtin command are automatically sent a CONT signal
## to make them running
setopt AUTO_CONTINUE

## Treat single word simple commands without redirection
## as candidates for resumption of an existing job
setopt AUTO_RESUME

## Print job notifications in the long format by default
setopt LONG_LIST_JOBS
