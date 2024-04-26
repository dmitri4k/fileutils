import sys
import os
import docx2txt


def convert_docx_to_txt(file_path):
    text = docx2txt.process(file_path)
    txt_file_path = file_path.rsplit(".", 1)[0] + ".txt"
    with open(txt_file_path, "w", encoding='utf-8') as text_file:
        print(f"Writing to {txt_file_path}...")  # Debugging print statement
        text_file.write(text)


def traverse_dir(root_dir):
    for dir_path, dirs, files in os.walk(root_dir):
        for file_name in files:
            if file_name.endswith('.docx'):
                file_path = os.path.join(dir_path, file_name)
                print(f"Converting {file_path} to txt...")  # Debugging print statement
                convert_docx_to_txt(file_path)


if __name__ == "__main__":
    root_dir = sys.argv[1]
    traverse_dir(root_dir)