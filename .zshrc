#!/usr/bin/env zsh
# We nee to put logic in here for path'ing when we need it.
# export $PATH=$PATH

# functions
wp-login () {
	wp login install --activate
	wp login create admin
}
