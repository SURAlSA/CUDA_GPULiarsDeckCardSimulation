#ifndef SIMULATE_H
#define SIMULATE_H

#include "util.h"

// structs

// classes

// variables

extern const int POSSIBLE_OUTCOMES;

extern const int HAND_SIZE;

extern const int TOTAL_VALID_CARDS;

extern const int DECK_SIZE;

// functions

__global__ void simulateCardDraws(unsigned int seed, int* results, int numOfSimulations);

#endif
