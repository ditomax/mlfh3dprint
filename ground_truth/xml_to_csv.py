"""
Usage:
  python3 xml_to_csv.py
  SOURCE: https://raw.githubusercontent.com/datitran/raccoon_dataset/master/

"""

import os
import glob
import pandas as pd
import xml.etree.ElementTree as ET

file_count=0
object_count=0

def xml_to_csv(path):
    global object_count
    global file_count
    xml_list = []
    for xml_file in glob.glob(path + '/*.xml'):
        file_count+=1
        tree = ET.parse(xml_file)
        root = tree.getroot()
        for member in root.findall('object'):
            object_count+=1

            value = (root.find('filename').text,
                     int(root.find('size')[0].text),
                     int(root.find('size')[1].text),
                     member[0].text,
                     int(member[5][0].text),
                     int(member[5][1].text),
                     int(member[5][2].text),
                     int(member[5][3].text)
                     )
            xml_list.append(value)
    column_name = ['filename', 'width', 'height', 'class', 'xmin', 'ymin', 'xmax', 'ymax']
    xml_df = pd.DataFrame(xml_list, columns=column_name)
    return xml_df


#def main():
#    image_path = os.path.join(os.getcwd(), 'annotations')
#    xml_df = xml_to_csv(image_path)
#    xml_df.to_csv('raccoon_labels.csv', index=None)
#    print('Successfully converted xml to csv.')

def main():
    global object_count
    global file_count
    for directory in ['train','test']:
        file_count=0
        object_count=0
        image_path = os.path.join(os.getcwd(), 'images/{}'.format(directory))
        xml_df = xml_to_csv(image_path)
        xml_df.to_csv('data/{}_labels.csv'.format(directory), index=None)
        print('Successfully converted xml to csv with {} files and {} objects'.format(file_count,object_count))

main()
