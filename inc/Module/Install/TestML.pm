#line 1
# XXX This module should be deprecated or at least moved to a separate dist.
package Module::Install::TestML;
use strict;
use warnings;

use Module::Install::Base;

use vars qw($VERSION @ISA);
BEGIN {
    $VERSION = '0.26';
    @ISA     = 'Module::Install::Base';
}

sub use_testml_tap {
    my ($self) = @_;

    $self->use_testml;

    $self->include('Test::More');
    $self->include('Test::Builder');
    $self->include('Test::Builder::Module');
    $self->requires('Filter::Util::Call');
}

sub use_testml {
    my ($self) = @_;

    $self->include('Pegex::Grammar');
    $self->include('Pegex::Input');
    $self->include('Pegex::Parser');
    $self->include('Pegex::Tree');
    $self->include('Pegex::Receiver');

    $self->include('TestML');
    $self->include('TestML::Base');
    $self->include('TestML::AST');
    $self->include('TestML::Bridge');
    $self->include('TestML::Compiler');
    $self->include('TestML::Compiler::Pegex');
    $self->include('TestML::Compiler::Pegex::AST');
    $self->include('TestML::Compiler::Pegex::Grammar');
    $self->include('TestML::Grammar');
    $self->include('TestML::Library::Debug');
    $self->include('TestML::Library::Standard');
    $self->include('TestML::Runtime');
    $self->include('TestML::Runtime::TAP');
    $self->include('TestML::Util');
}

sub testml_setup {
    my ($self, $config) = @_;
    return unless $self->is_admin;
    die "setup_config requires a yaml file argument"
        unless $config;
    print "testml_setup\n";
    require TestML::Setup;
    TestML::Setup->new->setup($config);
}

1;

=encoding utf8

#line 106
