import pytest
from sacrypt import process_text_v0, process_text_v1

@pytest.fixture
def file_path():
    return "../data/malavoglia.txt"

def test_process_text_v0(file_path):
    result = process_text_v0(file_path)
    assert all(vowel in result for vowel in 'aeiou')
    assert all(result[vowel] > 0 for vowel in 'aeiou')

def test_process_text_v1(file_path):
    result = process_text_v1(file_path)
    assert all(vowel in result for vowel in 'aeiou')
    assert all(result[vowel] > 0 for vowel in 'aeiou')