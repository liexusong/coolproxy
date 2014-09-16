function err(msg) {
    status=1
    print FILENAME ":" FNR ": " msg
}

FNR==1 && !/^\/\/ vi/ {
    err("missing vi modeline")
}

/\s$/ {
    err("whitespace at end")
}

/^\t/ {
    err("tab at beginning")
}

/^.{81}/ {
    err("line too long")
}

END {
    exit status
}
