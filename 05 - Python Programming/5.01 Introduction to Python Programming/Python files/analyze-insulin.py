# Raw sequence copied from NCBI
raw_sequence = """
ORIGIN      
        1 malwmrllpl lallalwgpd paaafvnqhl cgshlvealy lvcgergffy tpktrreaed
       61 lqvgqvelgg gpgagslqpl alegslqkrg iveqcctsic slyqlenycn
//
"""

# Step 1: Programmatically clean the raw text sequence
# Remove metadata headers, footers, numbers, spaces, and newlines
clean_sequence = raw_sequence.replace("ORIGIN", "")
clean_sequence = clean_sequence.replace("//", "")
clean_sequence = "".join(char for char in clean_sequence if char.isalpha()).lower()

print("--- Data Engineering & Dissection Telemetry ---")
print(f"Total Preproinsulin Sequence: {clean_sequence}")
print(f"Total Character Count: {len(clean_sequence)} (Expected: 110)\n")

# Step 2: Programmatically slice the specific sequence regions
# Note: Python indices start at 0, so amino acids 1-24 maps to index [0:24]
lsinsulin = clean_sequence[0:24]
binsulin = clean_sequence[24:54]
cinsulin = clean_sequence[54:89]
ainsulin = clean_sequence[89:110]

# Step 3: Output the segmented values and their exact string lengths
print(f"lsinsulin (1-24): {lsinsulin} | Length: {len(lsinsulin)} (Expected: 24)")
print(f"binsulin (25-54): {binsulin} | Length: {len(binsulin)} (Expected: 30)")
print(f"cinsulin (55-89): {cinsulin} | Length: {len(cinsulin)} (Expected: 35)")
print(f"ainsulin (90-110): {ainsulin} | Length: {len(ainsulin)} (Expected: 21)")