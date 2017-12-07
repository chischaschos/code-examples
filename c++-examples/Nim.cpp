#include <iostream>

using namespace std;

int main() {
  int goal;

  cout << "Let's nim: ";
  cin >> goal;

  cout << "NIMing to " << goal << endl;

  while (true) {

    int human_choice;
    cout << "Human, pick 1 or 2: ";
    cin >> human_choice;
    cout << endl;

    if (human_choice < 1 || human_choice > 2) {
      cout << "You could only choose 1 or 2 only, I'll make it a 2" << endl;
      human_choice = 2;
    }

    if (goal - human_choice <= 0) {
      cout << "Cool! you'be won" << endl;
      break;
    }

    goal = goal - human_choice;

    if (goal < 3) {
      cout << "I've won at "<< goal << ", take that human!" << endl;
      return 0;
    }

    cout << "OK, we are at " << goal << endl;
  }

  return 0;
}
