#!/bin/sh
set -e

eval $(ssh-agent -s)

if [[ ! -z "$SSH_PRIVATE_KEY" ]]; then
    echo "Adding SSH_PRIVATE_KEY to SSH agent"
    echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add - > /dev/null
else
    echo "No SSH_PRIVATE_KEY set";
fi

# Execute CMD
exec "$@"
