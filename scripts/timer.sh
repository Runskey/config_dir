setalarm() {
    sleep $(echo "$1 * 60" | bc)
    for x in $(seq 1000); do say "Beep boop"; sleep 0.5; done
}
setalarm 12
