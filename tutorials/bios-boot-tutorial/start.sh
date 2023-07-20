#!/bin/bash
DATADIR="./blockchain"

if [ ! -d $DATADIR ]; then
  mkdir -p $DATADIR;
fi

nodeos \
--plugin eosio::chain_plugin --disable-replay-opts \
--plugin eosio::chain_api_plugin \
--plugin eosio::http_plugin \
--plugin eosio::history_api_plugin \
--plugin eosio::history_plugin \
--plugin eosio::state_history_plugin \
--plugin eosio::net_plugin \
--plugin eosio::net_api_plugin \
--data-dir $DATADIR"/data" \
--blocks-dir $DATADIR"/blocks" \
--config-dir $DATADIR"/config" \
--chain-state-history --trace-history \
--http-server-address 0.0.0.0:8888 \
--p2p-listen-endpoint 0.0.0.0:4444 \
--access-control-allow-origin=* \
--contracts-console \
--http-validate-host=false \
--verbose-http-errors \
--chain-state-db-size-mb 512000 \
--http-max-response-time-ms=100 \
--max-transaction-time 1000 \
--enable-stale-production \
--filter-on=* \
--p2p-peer-address 173.230.136.69:4444 \
--p2p-peer-address 178.79.173.193:4444 \
--p2p-peer-address 172.105.178.235:4444 \
--allowed-connection=any \
>> $DATADIR"/nodeos.log" 2>&1 & \
echo $! > $DATADIR"/eosd.pid"
