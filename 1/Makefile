help: ## Display this help screen
	@grep -h \
		-E '^[a-zA-Z_0-9-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


BITCOIND=bitcoind
BITCOINGUI=bitcoin-qt
BITCOINCLI=bitcoin-cli
B1_FLAGS=
B2_FLAGS=
B1=-datadir=. $(B1_FLAGS)

BLOCKS=1
## Address param
ADDRESS=
## AMOUNT param
AMOUNT=
## ACCOUNT param
ACCOUNT=

CLI=


######### Start/Stop related
start: ## start node1
	$(BITCOIND) $(B1)  -daemon
start-gui: ## Start Node GUI
	$(BITCOINGUI)
stop: ## Stop the node
	$(BITCOINCLI) $(B1)  stop

clean:
	find regtest/* -not -name 'server.*' -delete

run:## support more sub-command, param:CLI
	$(BITCOINCLI)  $(B1)  $(CLI)

######## node status
getinfo: ## getinfo
	$(BITCOINCLI) $(B1) -getinfo
getblockchaininfo: ## getblockchaininfo
	$(BITCOINCLI) $(B1) getblockchaininfo
getmininginfo: ## getmininginfo node1
	$(BITCOINCLI) $(B1) getmininginfo
getblock: ## getblock
	$(BITCOINCLI) $(B1) getblock



######## wallet related
create_wallet: ## create wallet: make create_wallet1 ACCOUNT=wallet1
	$(BITCOINCLI) $(B1) createwallet $(ACCOUNT)

getWalletInfo: ## getwalletinfo, param: ACCOUNT=wallet1
	$(BITCOINCLI) $(B1)  -rpcwallet=$(ACCOUNT) getwalletinfo

listwallets: ## getaddressesbylabel
	$(BITCOINCLI) $(B1)  -rpcwallet=$(ACCOUNT) listaddressgroupings
	#$(BITCOINCLI) $(B1)   listaddressgroupings





####### Address related
getnewaddress: ## getnewaddress, param: ACCOUNT
	$(BITCOINCLI) $(B1)  -rpcwallet=$(ACCOUNT) getnewaddress  '' bech32m

getaddressesbylabel: ## getaddressinfo, param: ACCOUNT=wallet1
	$(BITCOINCLI) $(B1)  -rpcwallet=$(ACCOUNT) getaddressesbylabel ""

listaddressgroupings: ## listaddressgroupings, param: ACCOUNT=wallet1
	$(BITCOINCLI) $(B1)  -rpcwallet=$(ACCOUNT) listaddressgroupings



####### mine/gen block related
generate: ## generate blocks, param: BLOCKS
	$(BITCOINCLI) $(B1) -generate $(BLOCKS)

mine: ## miner for some address
	$(BITCOINCLI) $(B1)  generatetoaddress 1 $(ADDRESS)

sendfrom: ## send trx, param: ADDRESS, AMOUNT
	$(BITCOINCLI) $(B1) -rpcwallet=$(ACCOUNT) sendtoaddress $(ADDRESS) $(AMOUNT)


load_wallet: ##
	$(BITCOINCLI) $(B1) loadwallet $(ACCOUNT)

####### transactions related



###### mempool







.PHONY: clippy fmt test