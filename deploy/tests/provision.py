import  yaml 

with open ('hosts.yml', 'r') as file:
	hosts_file = yaml.load(file)

etchosts = open('hoststest', 'w')

etchosts.write("127.0.0.1	localhost\n")
for host in hosts_file:
     etchosts.write(host["ip"] + "	" + host["name"] + "\n")

etchosts.close()
