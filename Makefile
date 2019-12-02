HSC=ghc -dynamic
TARGET := $(shell ls | grep *.hs | sed -e 's/\.hs//')

.PHONY: clean

all: $(TARGET) clean

$(TARGET): $(TARGET).hs
	$(HSC) $(TARGET).hs

clean:
	rm -f *.hi *.o