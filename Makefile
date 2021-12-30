# Output sizes
SIZES := 32 64 128 256 512 1024
SIZES += 50 100 150 200 300 400 500 1000

# Output files
OUT := $(foreach size,$(SIZES),logo-$(size).png)
OUT += $(foreach size,$(SIZES),logo-text-$(size).png)

# Dimensions
DIM = $(patsubst logo-%.png,%,$(patsubst logo-text-%,logo-%,$@))

.PHONY: all clean
all: $(OUT)

clean: 
	rm -f $(OUT)

logo-text-%.png: logo-text.svg
	convert -background none $< \
		-gravity center -resize $(DIM)x$(DIM) -extent $(DIM)x$(DIM) \
		$@

logo-%.png: logo.svg
	convert -background none $< \
		-gravity center -resize $(DIM)x$(DIM) -extent $(DIM)x$(DIM) \
		$@
