#include "utilities.cpp"

class Div {
private:
    int outerLeftPaddingSize;
    string outerLeftEdge;
    string leftArm;
    string innerLeftEdge;
    int innerLeftPaddingSize;
    string text;
    int innerRightPaddingSize;
    string innerRightEdge;
    string rightArm;
    string outerRightEdge;
    int outerRightPaddingSize;
    int width;
    int newLine;

    pair<int, int> halve(int sum, string remainderMode = "no_remainder");
    pair<int, int> calcArmSizes();
public:
    Div(const int outerLeftPaddingSize,
        const string outerLeftEdge,
        const string leftArm,
        const string innerLeftEdge,
        const int innerLeftPaddingSize,
        const string text,
        const int innerRightPaddingSize,
        const string innerRightEdge,
        const string rightArm,
        const string outerRightEdge,
        const int outerRightPaddingSize,
        const int width,
        const int newLine = 1);

    string to_string();
};

Div::Div(   const int outerLeftPaddingSize,
            const string outerLeftEdge,
            const string leftArm,
            const string innerLeftEdge,
            const int innerLeftPaddingSize,
            const string text,
            const int innerRightPaddingSize,
            const string innerRightEdge,
            const string rightArm,
            const string outerRightEdge,
            const int outerRightPaddingSize,
            const int width,
            const int newLine) {
    this->outerLeftPaddingSize = outerLeftPaddingSize;
    this->outerLeftEdge = outerLeftEdge;
    this->leftArm = leftArm;
    this->innerLeftEdge = innerLeftEdge;
    this->innerLeftPaddingSize = innerLeftPaddingSize;
    this->text = text;
    this->innerRightPaddingSize = innerRightPaddingSize;
    this->innerRightEdge = innerRightEdge;
    this->rightArm = rightArm;
    this->outerRightEdge = outerRightEdge;
    this->outerRightPaddingSize = outerRightPaddingSize;
    this->width = width;
    this->newLine = newLine;
}

pair<int, int> Div::halve(int sum, string remainderMode) {
    int first = sum / 2;
    int second = sum / 2;
    pair<int, int> out;

    if (remainderMode == "first") {
        int remainder = sum % 2;

        first += remainder;
    } else if (remainderMode == "second") {
        int remainder = sum % 2;

        second += remainder;
    }

    out.first = first;
    out.second = second;

    return out;
}

pair<int, int> Div::calcArmSizes() {
    int armSizesSum = this->width - (this->outerLeftPaddingSize +
                                     this->outerLeftEdge.length() +
                                     this->innerLeftEdge.length() +
                                     this->innerLeftPaddingSize +
                                     this->text.length() +
                                     this->innerRightPaddingSize +
                                     this->innerRightEdge.length() +
                                     this->outerRightEdge.length() +
                                     this->outerRightPaddingSize);
    

    return halve(armSizesSum, "second");
}

string Div::to_string() {
    pair<int, int> armSizes = calcArmSizes();
    string out = "";

    out.append(repeat(" ", this->outerLeftPaddingSize));
    out.append(outerLeftEdge);
    out.append(repeat(this->leftArm, armSizes.first));
    out.append(innerRightEdge);
    out.append(repeat(" ", this->innerLeftPaddingSize));
    out.append(this->text);
    out.append(repeat(" ", this->innerRightPaddingSize));
    out.append(this->innerRightEdge);
    out.append(repeat(this->rightArm, armSizes.second));
    out.append(this->outerRightEdge);
    out.append(repeat(" ", this->outerRightPaddingSize));

    return out;
}