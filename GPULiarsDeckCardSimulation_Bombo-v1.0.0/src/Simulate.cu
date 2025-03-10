#include "Simulate.h"

// variables

const int DECK_SIZE = 20;

const int TOTAL_VALID_CARDS = 8;

const int HAND_SIZE = 5;

const int POSSIBLE_OUTCOMES = HAND_SIZE + 1;

// functions

__global__ void simulateCardDraws(unsigned int seed, int* results, int numOfSimulations)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid >= numOfSimulations) return;

    // Initialize random state
    curandState_t state;
    curand_init(seed + tid, 0, 0, &state);

    // Bitmask representation for deck (20 bits)
    unsigned int deck = 0;

    // Efficient placement of valid cards using Fisher-Yates Shuffle
    for (int i = 0; i < TOTAL_VALID_CARDS; i++) 
    {
        int pos = curand(&state) % (DECK_SIZE - i);
        for (int j = 0, count = 0; j < DECK_SIZE; j++) 
        {
            if (!(deck & (1 << j))) 
            {
                if (count == pos) 
                {
                    deck |= (1 << j);
                    break;
                }
                count++;
            }
        }
    }

    // Draw HAND_SIZE cards
    int validCount = 0;
    for (int i = 0, count = 0; count < HAND_SIZE; i++) 
    {
        if (curand(&state) % (DECK_SIZE - i) < HAND_SIZE - count) 
        {
            validCount += (deck & (1 << i)) ? 1 : 0;
            count++;
        }
    }

    // Store result
    atomicAdd(&results[validCount], 1);
}