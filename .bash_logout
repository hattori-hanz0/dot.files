# ~/.bash_logout

trap 'test -n "$SSH_AGENT_PID" && eval `/usr/bin/ssh-agent -k`' 0

# if ( "$SSH_AGENT_PID" != "" ) then
#         eval `/usr/bin/ssh-agent -k`
# endif

# echo logout >> ~/tmp/ssh-agent-pid.log
