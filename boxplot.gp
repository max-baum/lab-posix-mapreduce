set terminal png size 800,400
set output ARG1
set style data histogram
set style fill solid border -1
plot '/dev/stdin' using 1:xtic(2) notitle
