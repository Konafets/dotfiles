#!/usr/bin/env bash

# Add Composer's global binaries to PATH, using Composer if available.
if [[ -x "$(command -v git)" ]]; then
    export PATH=$PATH:$(composer global config bin-dir --absolute 2>/dev/null)
else
   [[ -d $HOME/.composer/vendor/bin ]] && export PATH=$PATH:$HOME/.composer/vendor/bin
   [[ -d $HOME/.config/composer/vendor/bin ]] && export PATH=$PATH:$HOME/.config/composer/vendor/bin
fi

# Use the Brew version of sed over the OSX version
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# Load Perl paths
export PATH="/Users/sok/perl5/bin${PATH:+:${PATH}}";
PERL5LIB="/Users/sok/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/sok/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/sok/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/sok/perl5"; export PERL_MM_OPT;

# PHP
export PATH="/usr/local/opt/php/bin:$PATH"
export PATH="/usr/local/opt/php/sbin:$PATH"

# Databases
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# Ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin/:$PATH"
