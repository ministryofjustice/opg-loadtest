brew install tsung
sudo cpan Template # to get load statistics

running test:

    tsung -f test-01.xml start


recording new test:

    tsung-recorder start

than pull the recorded file and paste it into text-XX.xml



viewing stats:

    cd <log directory>
    /usr/local/lib/tsung/bin/tsung_stats.pl
    open report.html
