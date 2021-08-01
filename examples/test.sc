#include <stdio.h>
#include <pointer.h>

struct Node<T> {
    T value;
    pointer<Node<T>> left, right;
};

struct Node_int {
    int value;
    pointer<Node_int> left, right;
};

struct Node_long {
    long value;
    pointer<Node_long> left, right;
};

struct Node_char {
    char value;
    pointer<Node_char> left, right;
};

int main(void) {
    pointer<char> str = make_pointer('e');

    Node<int> a;
    Node<long> b;
    Node<char> c;

    *str = 'a';



    return 0;
}
