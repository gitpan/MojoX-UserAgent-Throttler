use 5.010001;
use strict;
use warnings;
use Module::Build;

my $class = Module::Build->subclass(
    class => 'Module::Build::Custom',
    code => <<'SUBCLASS' );

# Better compatibility with Gentoo ebuilds.
sub dist_version {
    my $self = shift;
    my $v = $self->SUPER::dist_version;
    $v =~ s/\Av//ms;
    return $v;
}
SUBCLASS

my $builder = $class->new(
    module_name         => 'MojoX::UserAgent::Throttler',
    license             => 'mit',
    dist_author         => 'Alex Efros <powerman@cpan.org>',
    dist_version_from   => 'lib/MojoX/UserAgent/Throttler.pm',
    release_status      => 'stable',
    configure_requires => {
        'Module::Build'         => 0,
    },
    requires => {
        'perl'                  => 5.010001,
        'version'               => '0.77',
        'Mojolicious'           => '5.41',
        'Sub::Util'             => '1.40',
        'Sub::Throttler'        => '0.2.0',
    },
    test_requires => {
        'Test::More'            => 0,
#         'Test::Exception'       => 0,
        'Test::CheckManifest'   => '0.9',
        'Test::Perl::Critic'    => 0,
        'Test::Pod'             => '1.22',
        'Test::Pod::Coverage'   => '1.08',
        'Pod::Coverage'         => '0.18',
    },
#     add_to_cleanup     => [ 'MojoX-UserAgent-Throttler-*' ],
);

$builder->create_build_script();
