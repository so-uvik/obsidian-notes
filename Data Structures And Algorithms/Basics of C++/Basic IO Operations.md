## Hello World

```c++
#include<iostream> // Package for IO Operations

int main() {
	std::cout << "Hello World!" << std::endl; // This line will print "Hello           World" and after the hello world the next output will be in the next line          thanks to "std::endl".
	
	std::cout << "Hello World with an escape" << "\n"; // You can also write "\n"      instead of "std::endl"
	return 0;
}
```

If you want to get rid of the `std::` you can include `using namespace std`

```c++
#include<iostream> // Package for IO Operations
using namespace std;

int main() {
	cout << "Hello World!" << endl; // This line will print "Hello                     World" and after the hello world the next output will be in the next line          thanks to "std::endl".
	
	cout << "Hello World with an escape" << "\n"; // You can also write "\n"           instead of "std::endl"
	return 0;
}
```

## Taking Inputs

```c++
#include<iostream>
using namespace std;

int main() {
	int x, y; // Variable declaration
}

```