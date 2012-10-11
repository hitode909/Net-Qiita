package Net::Qiita::Client;
use strict;
use warnings;
use utf8;

use base qw(
    Net::Qiita::Client::Users
    Net::Qiita::Client::Tags
    Net::Qiita::Client::Items
);

sub new {
    my ($class, $options) = @_;

    $options ||= {};
    my $self = bless $options, ref($class) || $class;
    if (! $options->{token} && $options->{url_name} && $options->{password}) {
        $self->_login($options);
    }
    $self;
}

sub _login {
    my ($self, $args) = @_;

    my $json = $self->post('/auth', {
        url_name => $args->{url_name},
        password => $args->{password},
    });
    $self->token($json->{token});
}

1;
