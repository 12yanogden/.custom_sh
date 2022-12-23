#pragma once
#include <string>
using namespace std;

int divide(const int *dividend, const int *divisor, const int includeRemainder = 0) {
    int quotient = *dividend / *divisor;
    int remainder = *dividend % *divisor;
    int out = -1;

    if (includeRemainder) {
        out = quotient + remainder;
    } else {
        out = quotient;
    }

    return out;
}

string repeat(string substring, const int count) {
  string out = "";

  for (int i = 0; i < count; i++) {
      out.append(substring);
  }

  return out;
}