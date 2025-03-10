CXX = nvcc

TARGET = GPULiarsDeckCardSimulation_Bombo-v1.0.0.exe

SRCS = src/main.cu src/util.cpp src/Simulate.cu

OBJS = obj/main.o obj/util.o obj/Simulate.o

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) -o $(TARGET) $(OBJS)

obj/%.o: src/%.cpp
	$(CXX) -c $< -o $@

obj/%.o: src/%.cu
	$(CXX) -c $< -o $@

clean:
	rm -f $(TARGET) obj/*.o
