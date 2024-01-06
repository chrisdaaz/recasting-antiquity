# Python script that uses Pandoc and PyYAML to convert a Microsoft Word Document in Chicago Author-Date style to a YAML file containing items for each bibliographic reference

import subprocess
import yaml

# Define the input and output file paths
input_file = "./manuscript/bibliography.docx"
output_file = "./references.txt"

# Use Pandoc to convert the input file to plain text
#subprocess.run(["pandoc", input_file, "-o", output_file])

# Read the plain text file
with open(output_file, "r", encoding="utf-8") as f:
    references_text = f.read()

# Split the references_text into a list of individual references
references_list = references_text.split("\n\n")

# Initialize the list to hold the references in YAML format
references_yaml = []

# Iterate over the list of references
for reference in references_list:
    # Append a dictionary containing the reference to the references_yaml list
    references_yaml.append({"full": reference, "id": ""})

# Dump the references_yaml list to a YAML file
with open("references.yaml", "w", encoding="utf-8") as f:
    yaml.dump(references_yaml, f, allow_unicode=True)