from fabric.api import task, run, env, local
from fabric.contrib.project import rsync_project

@task
def tsung(test_name):
    rsync_project("tsung/", "scenarios/", delete=True)
    run("mkdir -p results")
    run("tsung -l results -f tsung/{} start".format(test_name))

    local("rsync  -pthrvz  --rsh='ssh  -p 22 ' {user}@{host}:results/ results/".format(user=env.user, host=env.host_string))

    print "remember to use:"
    print "/usr/local/lib/tsung/bin/tsung_stats.pl"

@task
def tsung_download_records():
    local("rsync  -pthrvz  --rsh='ssh  -p 22 ' {user}@{host}:.tsung/ log/".format(user=env.user, host=env.host_string))
