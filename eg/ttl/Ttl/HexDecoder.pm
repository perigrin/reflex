# Four-input binary to hexadecimal digit decoder.
# Cheats by not simulating all the inner circuitry.

package Ttl::HexDecoder;
use Moose;
extends 'Reflex::Base';

has ones => (
	isa     => 'Bool',
	is      => 'rw',
	traits  => ['Reflex::Trait::EmitsOnChange'],
	event   => 'change',
);

has twos => (
	isa     => 'Bool',
	is      => 'rw',
	traits  => ['Reflex::Trait::EmitsOnChange'],
	event   => 'change',
);

has fours => (
	isa     => 'Bool',
	is      => 'rw',
	traits  => ['Reflex::Trait::EmitsOnChange'],
	event   => 'change',
);

has eights => (
	isa     => 'Bool',
	is      => 'rw',
	traits  => ['Reflex::Trait::EmitsOnChange'],
	event   => 'change',
);

has out => (
	isa     => 'Str',
	is      => 'rw',
	traits  => ['Reflex::Trait::EmitsOnChange'],
);

sub on_my_change {
	my $self = shift;

	my $decimal = (
    ($self->ones()   || 0) * 1 +
    ($self->twos()   || 0) * 2 +
    ($self->fours()  || 0) * 4 +
    ($self->eights() || 0) * 8
	);

  $self->out( ("0".."9","a".."f")[$decimal] );
}

1;
