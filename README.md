# **This project is deprecated, check back soon for an updated version of Chordie** #
# **Chordie**
## **A chording keyboard you shouldn't be scared of**

![](/img/chordie1.png)

***Chordie "It" inspired picture courtesy of [Sean Yin](https://www.coroflot.com/sean_yin)***

![](/img/mxchocchordie.png)




### Chordie is a chording keyboard heavily inspired by [gBoards' Ginny keyboard](https://www.gboards.ca/product/ginni) running on awesome chording engine by [DennyTom](https://github.com/DennyTom/qmk_firmware/tree/feature/buttery_engine_v2/users/dennytom/chording_engine). It supports all 104 keys found on normal keyboards and much more in large part thanks to [ASETNIOP](http://asetniop.com/) layout. For a complete experience it's also equipped with trackball. Except for the mouse sensor module whole assembly can be handwired in about 6 hours.

## **BOM**
|Item                                       |Count  |Example|
|:---                                       |:---:  |:---:|
|MCP23017 I2C Expander Breakout Board       |2      |[Link](https://www.aliexpress.com/item/1005002491319987.html?spm=a2g0o.productlist.0.0.69692ef16bL9AS&algo_pvid=409629d1-6323-42fb-83ee-a506b3168261&algo_exp_id=409629d1-6323-42fb-83ee-a506b3168261-25&pdp_ext_f=%7B%22sku_id%22%3A%2212000020851672976%22%7D)|
|Pro Micro 5V 16MHz                         |1      |[Link](https://www.aliexpress.com/item/32768308647.html?spm=a2g0o.productlist.0.0.2607f202QTTq67&algo_pvid=7ec29e4c-daf6-41db-8152-19ac2f65dfd9&algo_exp_id=7ec29e4c-daf6-41db-8152-19ac2f65dfd9-0)|
|TRRS Socket PJ-320A                        |2      |[Link](https://www.aliexpress.com/item/4000661212458.html?spm=a2g0o.productlist.0.0.786215bcMDWN6j&algo_pvid=48175f89-cc7c-4d82-9240-efce3152adfa&algo_exp_id=48175f89-cc7c-4d82-9240-efce3152adfa-2)|
|TRRS Cable Male to Male 0.5m               |1      |[Link](https://www.aliexpress.com/item/32905903526.html?spm=a2g0o.productlist.0.0.4dc47529QkykEs&algo_pvid=9cf4583a-296e-42ce-8e4a-b7ea884c7d69&algo_exp_id=9cf4583a-296e-42ce-8e4a-b7ea884c7d69-0)|
|Enameled copper wire 0.2mm 10m             |1      |[Link](https://www.aliexpress.com/item/1005003799096513.html?spm=a2g0o.order_list.order_list_main.26.21ef18020rLkLI)|
|5mm kapton tape                            |1      |[Link](https://www.aliexpress.com/item/4000808659339.html?spm=a2g0o.order_list.order_list_main.86.21ef18020rLkLI)|
|EVQ-WGD001 encoder with switch             |1      |[Link](https://www.aliexpress.com/item/4001293888953.html?spm=a2g0o.productlist.0.0.118759fcSeFGBC&algo_pvid=847610a8-18a5-4fa9-a57b-980ad6205089&algo_exp_id=847610a8-18a5-4fa9-a57b-980ad6205089-0)|
|Kailh Choc V1 25g or 20g MX switch         |16     |[Link](https://www.aliexpress.com/item/4000907409650.html?spm=a2g0o.store_pc_groupList.8148356.11.606939a66Tvk6L)|
|Choc/MX keycaps 1u                         |10     |[Link](https://www.aliexpress.com/item/32979973961.html?spm=a2g0o.store_pc_groupList.8148356.21.1b9d36a4Coe1f0)|
|Choc/MX keycaps 1.5u                       |6      |[Link](https://www.aliexpress.com/item/4000135705283.html?spm=a2g0o.store_pc_groupList.8148356.31.5b1136a4d8gvZK)|
|8mm x 1mm antislip pads                      |14     |[Link](https://www.aliexpress.com/item/32767105328.html?spm=a2g0o.order_list.order_list_main.5.4f631802SBcIju)|
|ZrO2 bearing ball                          |3      |[Link](https://www.aliexpress.com/item/4000829132124.html?spm=a2g0o.order_list.order_list_main.24.649218029s2nlG)|
|M570/Ergo 34mm trackball ball              |1      |[Link](https://www.aliexpress.com/item/1005003007477853.html?spm=a2g0o.productlist.0.0.5c2375b6zAYly4&algo_pvid=002d0afb-2191-423d-83ef-9072c89420e0&algo_exp_id=002d0afb-2191-423d-83ef-9072c89420e0-3)|
|M2x3mm heat insert (optional)              |15     |[Link](https://www.aliexpress.com/item/33021847966.html?spm=a2g0o.order_detail.order_detail_item.9.62d2f19cZBgXLP)
|M2x15mm screw (trackball)                  |3      |[Link](https://www.aliexpress.com/item/32973784147.html?spm=a2g0o.order_detail.order_detail_item.3.28ecf19cnWSpWO)
|M2x4mm screw                               |12     |[Link](https://www.aliexpress.com/item/32973784147.html?spm=a2g0o.order_detail.order_detail_item.3.28ecf19cnWSpWO)
|PMW3360 sensor module                      |1      |[Link](https://github.com/kbjunky/PMW3360) \| [Link](https://www.aliexpress.com/item/1005007729769668.html?spm=a2g0o.order_list.order_list_main.55.649218029s2nlG)

## **IrDA** ***(optional)***
|Item                                       |Count  |Example|
|:---                                       |:---:  |:---:|
|TCRT5000 sensor                            |2      |[Link](https://www.aliexpress.com/item/32841920225.html?spm=a2g0o.productlist.main.3.79942950SPAjdz&algo_pvid=ed88d699-0338-4bcb-95a3-763932d98b16&algo_exp_id=ed88d699-0338-4bcb-95a3-763932d98b16-1&pdp_ext_f=%7B%22sku_id%22%3A%2265127182414%22%7D&pdp_npi=2%40dis%21SGD%211.3%211.18%21%21%21%21%21%40211be72e16751642359824286d0743%2165127182414%21sea&curPageLogUid=VzOE51f5ktnE)|
|680/10k Ohm resistor                       |2 each |[Link](https://www.aliexpress.com/item/32847096736.html?spm=a2g0o.productlist.main.9.7f074331KtDEGu&algo_pvid=95030fc9-6a56-4629-8e69-df30ff729c8e&aem_p4p_detail=20230131032519392335935644940051139628&algo_exp_id=95030fc9-6a56-4629-8e69-df30ff729c8e-4&pdp_ext_f=%7B%22sku_id%22%3A%2265227930982%22%7D&pdp_npi=2%40dis%21SGD%210.7%210.49%21%21%21%21%21%40211bf04a16751643197514158d0764%2165227930982%21sea&curPageLogUid=GtNgOzT4snvI&ad_pvid=20230131032519392335935644940051139628_1&ad_pvid=20230131032519392335935644940051139628_1)

## **Tools**
|Item                                       |Count  |Example|
|:---                                       |:---:  |:---:|
|Soldering iron 80W                         |1      |[Link](https://www.aliexpress.com/item/4000005873814.html?spm=a2g0o.productlist.0.0.3d5059f26KRLVN&algo_pvid=5b1311ed-043b-48b1-9540-15845a9cffab&algo_exp_id=5b1311ed-043b-48b1-9540-15845a9cffab-31)|
|Tin wire 0.5 to 1mm will do                |1      |[Link](https://www.aliexpress.com/item/32946643268.html?spm=a2g0o.productlist.0.0.21334be6X9YM36&algo_pvid=50712cb8-a6be-4a82-bdfd-3deb5e2c4329&algo_exp_id=50712cb8-a6be-4a82-bdfd-3deb5e2c4329-0)|
|Hot glue gun (optional)                    |1      |[Link](https://www.aliexpress.com/item/1005001393578323.html?spm=a2g0o.productlist.0.0.3b063cf9nndoZZ&algo_pvid=59c64fb0-2832-4323-987f-0915939b8da6&algo_exp_id=59c64fb0-2832-4323-987f-0915939b8da6-7)|
|Solder flux/paste                          |1      |[Link](https://www.aliexpress.com/item/32948598235.html?spm=a2g0o.productlist.main.5.5fc1399cRxSV86&algo_pvid=c2394116-24f7-4a01-9828-c23ef7e63e7c&algo_exp_id=c2394116-24f7-4a01-9828-c23ef7e63e7c-2&pdp_ext_f=%7B%22sku_id%22%3A%2212000024724968108%22%7D&pdp_npi=2%40dis%21SGD%215.13%214.0%21%21%21%21%21%40211bea6216751652086441714d0731%2112000024724968108%21sea&curPageLogUid=ZUlXoJqPWq7N)
|Digital multimeter with diode test         |1      |[Link](https://www.aliexpress.com/item/1005004951791846.html?spm=a2g0o.productlist.main.15.7c866bd7cBUYed&algo_pvid=751c34a6-03de-4e0b-b461-6b0e1ab36d6d&algo_exp_id=751c34a6-03de-4e0b-b461-6b0e1ab36d6d-7&pdp_ext_f=%7B%22sku_id%22%3A%2212000031134230465%22%7D&pdp_npi=2%40dis%21SGD%215.37%214.83%21%21%21%21%21%40211bf04a16751658855944487d0764%2112000031134230465%21sea&curPageLogUid=sxHeDutjDcqK)

## **Remarks**
*   You can buy a bundle that is soldering iron + tin wire + some other accessories that you think might come usefull. Buying a bundle with a multimeter is a good idea.
*   Better kecaps are [MKUltra](https://mkultra.click/mbk-choc-keycaps).
*   For MX switches any linear switch can be swapped with 20g spring.
*   TRRS cable can be L shaped only on the left side due to the trackball blocking the way on the right side.
*   Solder flux helps with melting isolation on the enameled wire. Just put some where you need to melt the isolation and it should melt quickier.
*   Multimeter (continuity tester) is a must and comes handy when testing if every wire is connected properly.
*   Using heat inserts is recommended.

# **Build guide**

## **Chordie OpenSCAD generator**
Chordie comes with OpenSCAD generator that allows for easy cutomization of:
*   Height of switch/encoder columns.
*   Use of heat inserts or just screws.
*   I2C expander mounting hole dimensions as well as having expander exposed/covered.
*   Choc/MX type sockets.
*   IR sensor.
*   Custom tolerance of switch/encoder sockets.

How to customize your Chordie:
*   Download and install [OpenSCAD](https://openscad.org/).
*   Open ***config.scad*** from generator folder of this repository with OpenSCAD.
*   Adjust settings following tips from the config file.
*   When ready to print hit 'Render' (F6) and then ***File->Export to STL***.
*   Tip: Encoder (ENC) column should be a bit higher than (FF) column. Also thumb keys should be a bit higher than the rest. But this is mostly my preference. 
*   Tip: When measuring I2C expander boards provide exact value into the config file. Proper margin will be added by default.

![](/img/i2cdim.png)

## **3D printing**
Recommended settings:
*   Material: any, preferably PLA/PETG
*   Layer height 0.2mm
*   Infill >=15%
*   Supports are needed under audio jack holes and on the trackball where MCU USB socket is placed.

## **Wiring**
Before you start make sure your Chordie suits your hands well. Play with it for a while with just switches placed into the sockets. Wiring takes some time and last thing you want to do is to start over because some part isn't properly setup. For example you might find out that encoder is too low etc. Check if canals for the wires aren't filled with plastic. Check if all parts (switches/audio jacks/encoder/I2C exapanders etc.) fit into their sockets.

**While routing check every connection with continuity meter!**

**If you're using heat inserts start with them. Once done try if the bottom plate fits etc.**
![](/img/heatinsertsfit.jpg)

Attach kepton tape to the bottom side of ProMicro and top side of I2C expanders(cover the pads). This way you will avoid tin blobs.
![](/img/kapton.png)

Setup the address pins on I2C expanders following the diagram.

![](/img/address.png)

It should look something like this.

![](/img/i2c2.png)

Next you will have to prepare the switches. Put some tin on every switch pin then place the switches into the sockets. Make sure pins are facing the same way as on the photo/diagram. At this point you can also attach the I2C expander. Use small amount of hot glue to lock it in place. Be sure not to cover any of the pads.

![](/img/tinswitch.jpg)


Once this is done follow the below diagram and connect all the GND pins for the switches. For now skip the rotary encoder/audio jack part. These will be done later. Route the enameled wire through the canals. For this part use one wire that will connect every switch GND pin and then connect to the nearest GND on the I2C Expander.

![](/img/gndswitch.png)

It should look more or less like this (don't mind the encoder and audio jack, it's not important at this stage).

![](/img/onewire.jpg)

Now you can move to connecting switches to the I2C Expander. Refer to the diagram. **Avoid routing over 'B' pads on I2C Expander. Check the photo below on how to properly route the wires.** 

![](/img/switch2i2c.png)

Wiring should look like this. Note how wires mostly go up, it's OK even if it means goind around.

![](/img/wiring1.jpg)

Now it's time to connect the encoder. Attach long pieces of wire to it's pins. There are 2 pins that are GND (refer to the diagram). Connect them with one long wire. When routing, those GND pins can be connected to any nearest GND either to a switch or just directly to the wire.

![](/img/encsetup.jpg)

Refer to the diagram when connecting encoder to the I2C Exapnder.
![](/img/encoder.png)

Now it's time for audio jacks. They should fit quite tight. Use some tool to push them inside. Use the 3D printed spacers to prevent sockets from sliding out when connecting the TRRS cable.

![](/img/ajspacers.png)

Now follow the diagram and connect all pins accordingly. Routing start from I2C Expander towards the audio socket and then leave some wire that will later on be connected to Pro Micro. It's easier this way compared to later on trying to solder additional wire to the audio socket pin.

![](/img/audioi2c.png)
![](/img/extwire.jpg)

If you've decided on using IrDA here's how it should be wired.

![](/img/irda.png)

At this point you should have a working mouse sensor and be able to connect it to the ProMicro as well as connecting SDA (ProMicro pin 2)/SCL (ProMicro pin 3)/VCC/GND lines from the keyboard to the ProMicro. For connecting sensor to the ProMicro you can use the same enameled wire. Sandwich it with the ProMicro. There's a dedicated space for ProMicro on the bottom plate to hold it in place, in between the studs that hold mouse sensor. 

## **Mouse sensor wiring**
|ProMicro Pin|Sensor pin|
|:---        |:---:|
|A0          |NCS  |
|15          |SCLK |
|14          |MISO |
|16          |MOSI |     

![](/img/sandwich.jpg)
![](/img/assembled.png)

Congratulations!


Now it's flashing time, check **src** folder for flashing/layout information.

**And that's it. Congratulations!**


