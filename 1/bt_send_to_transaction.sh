#!/usr/bin/env bash
echo $@
#bitcoin-cli -datadir=. $@
bitcoin-cli -datadir=.  -rpcwallet=benefactor sendrawtransaction


