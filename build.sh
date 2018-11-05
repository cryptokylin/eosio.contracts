#! /bin/bash

printf "\t=========== Building eosio.contracts ===========\n\n"

RED='\033[0;31m'
NC='\033[0m'

CORES=`getconf _NPROCESSORS_ONLN`
mkdir -p build
pushd build &> /dev/null
cmake ../
make -j${CORES}
popd &> /dev/null



## replace abi files

for c in bios msig system token; do \
    cp ./eosio.${c}/abi/eosio.${c}.abi      ./build/eosio.${c}/ ;done

