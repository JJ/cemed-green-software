#include <tr2/dynamic_bitset>
#include <random>

std::vector<std::tr2::dynamic_bitset<>>& generate_chromosomes(unsigned int number_of_elements, unsigned int length)
{
  std::minstd_rand engine;
  static std::vector<std::tr2::dynamic_bitset<>> population;
  population.resize(number_of_elements);
  for (unsigned i = 0; i < number_of_elements; ++i)
  {
    std::tr2::dynamic_bitset<> bits(length);
    for (unsigned i = 0; i < length; ++i)
      bits[i] = engine() & 1;
    population[i] = bits;
  }

  return population;
}
