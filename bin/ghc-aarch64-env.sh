THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

env -i bash --rcfile "$THIS_DIR/ghc-aarch64-env.rc"
