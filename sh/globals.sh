getOS() {
    local os="unrecognized"

    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        os="linux"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        os="macOS"
    fi
    
    echo "$os"
}

os="$(getOS)"