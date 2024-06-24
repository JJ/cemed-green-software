#include <chrono>
#include <tr2/dynamic_bitset>
#include <iostream>
#include <random>

#include "generate_chromosomes.hh"

const unsigned ELEMENTS = 40000;

int main(int argc, char *argv[])
{
  std::minstd_rand engine;
  unsigned length = (argc > 1) ? std::atoi(argv[1]) : 512;
  std::cout << "Length: " << length << std::endl;
  auto start = std::chrono::high_resolution_clock::now();
  std::vector<std::tr2::dynamic_bitset<>> &population = generate_chromosomes(ELEMENTS, length);
  std::cout << "Finished generation" << std::endl;
  int population_length = std::size(population);
  auto stop = std::chrono::high_resolution_clock::now();

  int the_time = std::chrono::nanoseconds(stop - start).count();
  std::cout << "Generated "
            << population_length
            << " chromosomes in "
            << the_time
            << std::endl;

  return the_time; // avoid code elision
}
