#include "util.h"
#include "Simulate.h"

int main(int argc, char* argv[])
{
    if (argc != 2) { std::cerr << "Usage: " << argv[0] << " n\n"; return 1;}

    int numOfSimulations = atoi(argv[1]);

    if (numOfSimulations <= 0) {std::cerr << "Number of Simulations must be positive.\n"; return 1;}

    int* deviceResults, hostResults[POSSIBLE_OUTCOMES] = {0};
    cudaMalloc(&deviceResults, POSSIBLE_OUTCOMES * sizeof(int));
    cudaMemset(hostResults, 0, POSSIBLE_OUTCOMES * sizeof(int));

    int threadsPerBlock = 256;
    int numOfBlocks = (numOfSimulations + threadsPerBlock - 1) / threadsPerBlock;

    // start timing
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    cudaEventRecord(start);

    simulateCardDraws<<<numOfBlocks, threadsPerBlock>>>(time(NULL), deviceResults, numOfSimulations);

    cudaEventRecord(stop);

    cudaMemcpy(hostResults, deviceResults, POSSIBLE_OUTCOMES * sizeof(int), cudaMemcpyDeviceToHost);
    cudaFree(deviceResults);

    cudaEventSynchronize(stop);
    float milliseconds = 0;
    cudaEventElapsedTime(&milliseconds, start, stop);

    for (int i = 0; i < POSSIBLE_OUTCOMES; i++)
    {
        std::cout << i << " valid cards: " << hostResults[i] << std::endl;
    }

    std::cout << "Processing time: " << milliseconds << " ms" << std::endl;

    return 0;
}
