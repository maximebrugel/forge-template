-include .env

install: npm

npm :; yarn install

build 		:; forge build
clean		:; forge clean
test 		:; forge test --verbosity=3 --ffi
test-fork 	:; forge test --verbosity=3 --fork-url $(call network,mainnet) --ffi --force
snapshot 	:; forge snapshot
prettier	:; yarn prettier
lint		:; yarn lint



define network
https://eth-$1.alchemyapi.io/v2/${ALCHEMY_API_KEY}
endef