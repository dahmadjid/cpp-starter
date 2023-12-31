set -e
set -x

[ -d "./venv" ] && source venv/bin/activate || python -m venv venv && source venv/bin/activate && pip install conan &&\
[ -d "./build" ] || mkdir build &&\
conan install . --output=build --build=missing

cmake -Bbuild -S.\
    -GNinja -DCMAKE_CXX_COMPILER=g++\
    -DCMAKE_EXPORT_COMPILE_COMMANDS=On\
    -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake\
    -DCMAKE_BUILD_TYPE=Release