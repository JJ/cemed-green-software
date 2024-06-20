#include <chrono>
#include <tr2/dynamic_bitset>
#include <iostream>
#include <random>

const unsigned ELEMENTS = 40000;
const unsigned LENGTH	 =  2048;

int main() {
	std::minstd_rand engine;
  // declare a population of ELEMENTS chromosomes
  std::tr2::dynamic_bitset<> * population = new std::tr2::dynamic_bitset<>[ ELEMENTS ];
  auto start = std::chrono::high_resolution_clock::now();
  for (unsigned i = 0; i < ELEMENTS; ++i) {
    for (unsigned length = 16; length <= LENGTH; length <<= 1) {
		  std::tr2::dynamic_bitset<> bits(length);

		  for (unsigned i = 0; i < length; ++i)
			  bits[i] = engine() & 1;
      population[i] = bits;
    }
  }
  std::cout << "Finished generation" << std::endl;
  delete [] population;
        auto stop = std::chrono::high_resolution_clock::now();

        int the_time = std::chrono::nanoseconds(stop - start).count();
        std::cout << "C++-dynamic_bitset, "
                  << the_time
                  << std::endl;

	return the_time; // avoid code elision
}
