procs = `ssh root@esxi1.mydomain.local /etc/init.d/hostd status`
running = false
procs.each_line do |proc|
  running = true if proc.include?('hostd is running')
end
if running
  puts 'OK - HOSTD is running'
  exit 0
else
  puts 'WARNING - HOSTD daemon is NOT running'
  exit 1
end

