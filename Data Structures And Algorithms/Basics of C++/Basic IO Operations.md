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
	cin >> x >> y; // This will take input if given in the same line OR different      lines.
	cout << "Value of x: " << x << " and y: " << y;
	return 0;
}

```

### Taking whole line as one string input(including spaces)

```c++
#include<bits/stdc++.h>
using namespace std;

int main() {
	string str;
	getline(cin, str); // This will take whole line as input including spaces.
	// But if you press ENTER(after already giving an input), it will not pick         that up. 
	cout << str;
	string s1, s2;
	cin >> s1 >> s2; // Input till the first space will go inside s1, and after        the space will go inside s2
	cout << s1 << s2;
}
```


>[!Note]
>You can include `#include<bits/stdc++.h>` instead of just `#include<iostream>` in your program and that will include every needed library you want to use, for example `string`, `vector` etc.

