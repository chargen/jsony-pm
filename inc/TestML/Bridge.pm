#line 1
package TestML::Bridge;
use TestML::Base;

sub runtime {
    $TestML::Runtime::Singleton;
}

1;
