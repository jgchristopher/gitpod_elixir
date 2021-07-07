FROM gitpod/workspace-postgres

USER gitpod

# Install Erlang, Elixir, Hex and Rebar
RUN wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb \
    && sudo dpkg -i erlang-solutions_2.0_all.deb \
    && sudo apt-get update \
    && sudo DEBIAN_FRONTEND=noninteractive apt-get install esl-erlang -q -y \
    && sudo DEBIAN_FRONTEND=noninteractive apt-get install elixir -q -y \
    && sudo DEBIAN_FRONTEND=noninteractive apt-get install inotify-tools -q -y \
    && mix local.hex --force \
    && mix local.rebar --force \
    && sudo apt-get clean && sudo rm -rf /var/cache/apt/* && sudo rm -rf /var/lib/apt/lists/* && sudo rm -rf /tmp/*
