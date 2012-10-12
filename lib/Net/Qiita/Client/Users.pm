package Net::Qiita::Client::Users;
use strict;
use warnings;
use utf8;

use base qw(Net::Qiita::Client::Base);

sub user_items {
    my ($self, $url_name, $params) = @_;

    my $path = defined $url_name ? "/users/$url_name/items" : '/items';
    $self->get($path, $params);
}

sub user_stocks {
    my ($self, $url_name, $params) = @_;

    my $path = defined $url_name ? "/users/$url_name/stocks" : '/stocks';
    $self->get($path, $params);
}

sub user {
    my ($self, $url_name) = @_;
    $self->get("/users/$url_name");
}

1;
