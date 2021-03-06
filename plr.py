#!/usr/bin/env python3
# _*_ coding:utf-8 _*_
# pod local replacing
import sys
import os


def pod_actual_name_in_line(line_str: str):
    stripped_line: str = line_str.strip()
    if 'pod ' in stripped_line or 'pod\t' in stripped_line:
        if not stripped_line.startswith('#'):
            components = stripped_line.split('\'')
            if components[0].strip() == 'pod':
                return components[1]
    return None


def path_from_abstract_name(abstract_name: str):
    result = os.listdir("..")
    for file_name in result:
        if abstract_name.lower() in file_name.lower():
            return file_name
    return None


def generate_local_ref_str(actual_name: str, path: str):
    ref_str = 'pod \'' + actual_name + '\', :path=>\'../' + path + '\''
    return ref_str


def replace_string_in_podfile(abstract_name: str) -> None:
    with open('Podfile') as f:
        s = f.read()
    components = s.split('\n')
    replacing_action_occurred: bool = False
    for index, line_str in enumerate(components):
        if abstract_name in line_str.lower():
            actual_name = pod_actual_name_in_line(line_str)
            if actual_name is not None:
                local_path_str = path_from_abstract_name(actual_name)
                if local_path_str is not None:
                    local_ref_str = generate_local_ref_str(actual_name=actual_name, path=local_path_str)
                    components[index] = local_ref_str
                    replacing_action_occurred = True
                    print('Replaced to local ref: ' + actual_name)
    if replacing_action_occurred:
        content = '\n'.join(components)
        with open('Podfile', 'w') as f:
            f.write(content)
    else:
        print('Did not find any ref matching ' + abstract_name + ' in Podfile')


if __name__ == '__main__':
    print('Working... very hard... 🙄')
    for arg in sys.argv[1:]:
        replace_string_in_podfile(abstract_name=arg.lower())
