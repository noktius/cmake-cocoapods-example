#include "ibar.h"
#include "foo.h"
#include <iostream>

Foo::Foo(IBar& bar)
    :m_bar(bar) {};

bool Foo::baz(bool useQux) {
    std::cout << "DEBUG HERE is: " << useQux << std::endl;
    if (useQux) {
        return m_bar.qux();
    } else {
        return m_bar.norf();
    }
}
