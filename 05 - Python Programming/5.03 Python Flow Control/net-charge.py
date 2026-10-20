# Python3.11  
# Coding: utf-8  

# Store the human preproinsulin sequence in a variable called preproinsulin:  
preproInsulin = "malwmrllpllallalwgpdpaaafvnqhlcgshlvealylvcgergffytpktrreaedlqvgqvelgggpgagslqplalegslqkrgiveqcctsicslyqlenycn"  

# Store the remaining sequence elements of human insulin in variables:  
lsInsulin = "malwmrllpllallalwgpdpaaa"  
bInsulin = "fvnqhlcgshlvealylvcgergffytpkt"  
aInsulin = "giveqcctsicslyqlenycn"  
cInsulin = "rreaedlqvgqvelgggpgagslqplalegslqkr"  

# Combine chains to form the active insulin molecule
insulin = bInsulin + aInsulin

# Dictionary mapping pKa values for ionizable amino acid residues
pKR = {'y': 10.07, 'c': 8.18, 'k': 10.53, 'h': 6.00, 'r': 12.48, 'd': 3.65, 'e': 4.25}

# Count the frequency of each ionizable amino acid as a float using dictionary comprehension
seqCount = {x: float(insulin.count(x)) for x in ['y', 'c', 'k', 'h', 'r', 'd', 'e']}

# Initialize pH state variable to 0
pH = 0

# Titration sequence loop tracking pH values from 0 through 14
while (pH <= 14):
    # Henderson-Hasselbalch mathematical model for net charge estimation
    netCharge = (
        +(sum({x: ((seqCount[x]*(10**pKR[x]))/((10**pH)+(10**pKR[x]))) \
        for x in ['k','h','r']}.values()))
        -(sum({x: ((seqCount[x]*(10**pH))/((10**pH)+(10**pKR[x]))) \
        for x in ['y','c','d','e']}.values()))
    )
    
    # Format and print output data with 2 decimal places for pH
    print('{0:.2f}'.format(pH), netCharge)
    
    # Increment loop state
    pH += 1

