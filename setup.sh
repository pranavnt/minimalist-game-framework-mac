if [ ! -d "./SDL2/SDL2.framework" ]; then
    echo "SDL2.framework not found. You are in the wrong folder (run this within \"minimalist-game-engine-mac\")."
    exit 1
fi

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root – you can do this by typing \"sudo su\" into terminal"
    exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ "${DIR: -1}" != "/" ]; then
    DIR="$DIR/"
fi

ln -sf $DIR/SDL2/SDL2.framework/SDL2 /usr/local/lib/libSDL2
ln -sf $DIR/SDL2_ttf/SDL2_ttf.framework/SDL2_ttf /usr/local/lib/SDL2_ttf
ln -sf $DIR/SDL2_mixer/SDL2_mixer.framework/SDL2_mixer /usr/local/lib/libSDL2_mixer
ln -sf $DIR/SDL2_image/SDL2_image.framework/SDL2_image /usr/local/lib/libSDL2_image