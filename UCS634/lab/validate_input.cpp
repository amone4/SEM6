#include "iostream"
using namespace std;

int main() {
	int num;
	cout<<"\nenter a number: ";
	cin>>num;
	if (cin.fail()) {
		cout<<"invalid input";
	} else {
		for (int i = 0; i < 10; ++i) {
			cout<<"\n"<<num<<"x"<<i+1<<"="<<num*(i+1);
		}
	}
	return 0;
}