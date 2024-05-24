
#include "foo.hpp"
#include <zlib.h>


int Foo::howdy(int const incr)
{
    // Just to be sure
    z_stream zs;
    return incr + 1;
}
