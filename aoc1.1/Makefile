HSC=ghc -dynamic
TARGET=aoc1.1

.PHONY: clean

all: $(TARGET) clean

$(TARGET): $(TARGET).hs
	$(HSC) $(TARGET).hs

clean:
	rm -f *.hi *.o
