tmux has-session -t myapp

if [ $? != 0 ]
then
  tmux new-session -s myapp -n services -d

  tmux send-keys -t myapp 'cd myapp' C-m

  ps -p `head -n 1 /usr/local/var/postgres/postmaster.pid`
  if [ $? != 0 ]
  then
    tmux send-keys -t myapp 'pg_ctl -D /usr/local/var/postgres start' C-m
  fi

  tmux split-window -v -t myapp
  tmux send-keys -t myapp 'redis-server' C-m

  tmux split-window -h -t myapp
  tmux send-keys -t myapp 'memcached' C-m

  tmux split-window -h -t myapp:0.0
  tmux send-keys -t myapp 'cd myapp' C-m
  tmux send-keys -t myapp 'nginx -c `pwd`/nginx/opt/local/etc/nginx/nginx.conf' C-m
fi

tmux attach -t myapp
