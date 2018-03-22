#include "iostream"
#include "cstdlib"
using namespace std;

// method takes in the set of all environment variables, prints all of them, and returns their count
int main(int argc, char **argv, char **env) {
	int num_env_vars;
	for (num_env_vars=0 ; env[num_env_vars] ; num_env_vars++) {
		cout << env[num_env_vars] << endl;
	}
	num_env_vars++;
	cout << "number of variables: " << num_env_vars << endl;

	cout << argc << endl;

	for (int i = 0; i < argc; i++)
		cout << argv[i] << endl;

	return 0;
}
/*
// method prints the value of the required environment variable
int main(int argc, char **argv) {
	char* value = getenv(argv[2]);
	if (value) cout << value << endl;
	else cout << "variable not found" << endl;
	getchar();
	return 0;
}

int main(int argc, char **argv) {
	char* value = getenv(argv[2]);
	if (value) cout << value << endl;
	else cout << "variable not found" << endl;
	getchar();
	return 0;
}*/