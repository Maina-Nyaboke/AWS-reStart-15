import subprocess

subprocess.run(["dir"], shell=True)
subprocess.run(["dir", "/w"], shell=True)
subprocess.run(["dir", "README.md"], shell=True)

# Retrieving System Information
command = "hostname"
print(f'Gathering system information with command: {command}')
subprocess.run([command], shell=True)

#Retrieving Information about Current Disk Space
command = "tasklist"
print(f'Gathering active process information with command: {command}')
subprocess.run([command], shell=True)


