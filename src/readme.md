## **Programming**

Follow the [QMK Getting Started Guide](https://docs.qmk.fm/#/newbs_getting_started) and setup your enviroment. Then copy 'chordie' to your QMK\keyboards folder. 
Start **QMK SYS** and compile with command:
*   qmk compile -kb chordie -km chording

Flash it and happy chording!

If you decide to do any changes to the **keymap_def.json** file then it needs to be run throug parser to generate new **keymap.c** file:
python3 parser.py keymap_def.json keymap.c

**Default** keymap is used for checking if every key is working, it's a debugging layout of some sorts.