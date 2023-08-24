print:

IN_TEST=/Users/apple/workspace/go/src/github.com/gedw99/deck-all/.bin

IN_TEST=$(PWD)/example/.bin

IN=$(PWD)/.bin/in
#IN=/Users/apple/workspace/go/src/github.com/gedw99/deck-all/.bin

OUT=$(PWD)/.bin/out
#OUT=/Users/apple/workspace/go/src/github.com/gedw99/deck-all/.release

# pick on for logging
#export ENV=production
export ENV=

### EXAMPLE 

ex-all:
	cd example && $(MAKE) all

### THIS

run:
	# works :)
	go run .

### Just helpers for when devling on this.

clean:
	rm -rf $(IN)
	rm -rf $(OUT)
in-prime:
	# copy test data in.
	rm -rf $(IN)
	mkdir -p $(IN)
	
	#cp -r $(IN_TEST)/darwin_amd64 $(IN)
	#cp -r $(IN_TEST)/web_wasm $(IN)

	cp -r $(IN_TEST)/* $(IN)
	
out-prime:
	rm -rf $(OUT)
	mkdir -p $(OUT)

	
run: in-prime out-prime
	
	# MUST use gotip, becaue go messes up the zip
	gotip run . --in $(IN) --out $(OUT)

test-exe:
	#chmod +x $(OUT)/deckd
	$(OUT)/darwin_amd64_deckd -h

test-unzip-web:
	unzip $(OUT)/web_wasm_gcdeck.web.zip
	#open $(OUT)/darwin_amd64_gcdeck.app
test-unzip-app:
	unzip $(OUT)/darwin_amd64_gcdeck.app.zip
	open $(OUT)/darwin_amd64_gcdeck.app
	 
	
