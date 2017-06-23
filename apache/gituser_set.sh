#!/bin/sh

# local user set(git update user)
echo -n "local user.name : "
read l_user
git config --local user.name "$l_user"

# local user email(git update user email)
echo -n "local user.Email : "
read l_email
git config --local user.email "$l_email"

# local user push set
echo -n "local push.default(simple or current) : "
read l_default
git config --local push.default "$l_default"

