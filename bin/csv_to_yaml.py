#!/home/linuxbrew/.linuxbrew/bin/python3
import csv
import yaml

def convert_csv_to_yaml(csv_file, yaml_file):
    data = {}
    data['object_list'] = []

    with open(csv_file, 'r', encoding='utf-8') as file:
        csv_reader = csv.DictReader(file)
        for row in csv_reader:
            for key, value in row.items():
                if '\n' in value:
                    row[key] = "|\n\"{}\"\n".format(value.replace('\n', '\n\n'))
                else:
                    row[key] = "\"{}\"".format(value)
            data['object_list'].append(row)

    with open(yaml_file, 'w', encoding='utf-8') as file:
        yaml.dump(data, file, default_flow_style=False, allow_unicode=True)

# Replace 'input.csv' and 'output.yaml' with your CSV and desired YAML file names
convert_csv_to_yaml('./manuscript/catalogue.csv', './output.yaml')