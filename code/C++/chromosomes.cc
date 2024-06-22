#include <chrono>
#include <tr2/dynamic_bitset>
#include <iostream>
#include <random>

const unsigned ELEMENTS = 40000;

int main(int argc, char *argv[])
{
  std::minstd_rand engine;
  // read first command line argument into variable length with default value 512
  unsigned length = (argc > 1) ? std::atoi(argv[1]) : 512;
  std::cout << "Length: " << length << std::endl;
  std::tr2::dynamic_bitset<> *population = new std::tr2::dynamic_bitset<>[ELEMENTS];
  auto start = std::chrono::high_resolution_clock::now();
  for (unsigned i = 0; i < ELEMENTS; ++i)
  {
    std::tr2::dynamic_bitset<> bits(length);
    for (unsigned i = 0; i < length; ++i)
      bits[i] = engine() & 1;
    population[i] = bits;
  }

  std::cout << "Finished generation" << std::endl;
  int population_length = population->size();
  delete[] population;
  auto stop = std::chrono::high_resolution_clock::now();

  int the_time = std::chrono::nanoseconds(stop - start).count();
  std::cout << "Generated "
            << population_length
            << " chromosomes in "
            << the_time
            << std::endl;

  return the_time; // avoid code elision
}
