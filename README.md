# **Chordie**
## **A chording keyboard you shouldn't be scared of**

![](/img/chordie1.png)

***"It" inspired picture courtesy of [Sean Yin](https://www.coroflot.com/sean_yin)***

![](/img/chordie2.jpg)

This is my attempt at a chording keyboard. I got inspired by [gBoards' Ginny keyboard](https://www.gboards.ca/product/ginni) but felt like there's some room for improvements. Especially uncomfortable was using mouse with it. Thus I have decided to attach a trackball. Now mouse buttons are part of the keyboard and can also be usen in chords. Trackball can be kept very close to the keyboard eliminating the need for moving your hand like with normal mouse. I have also added rotary encoders to make some of the operations easily accessible. This project wouldn't have been possible without an awesome chording engine by [DennyTom](https://github.com/DennyTom/qmk_firmware/tree/feature/buttery_engine_v2/users/dennytom/chording_engine). I have extended it a bit to support pointing devices(mouse buttons handling) as well as performing some operations with the ball like scrolling, changing volume etc. Plus some bug fixes(broken leader key handling). I also wanted to make the build process as easy as possible. All parts just clip in and only 2 screws are needed to secure the trackball sensor. Everything is hand wired and there's no need for PCB. No special soldering skills are required either (except for making the ADNS9800 sensor if you opt to make one on your own, I've also included pre-built version in BOM which should work as well). **Trackball is optional though**. This keyboard is using [ASETNIOP](http://asetniop.com/).

## **BOM - base**
|Item                                       |Count  |Example|
|:---                                       |:---:  |:---:|
|MCP23017 I2C Expander Breakout Board       |2      |[Link](https://www.aliexpress.com/item/32957655097.html?spm=a2g0o.productlist.0.0.5e992ef16dybSP&algo_pvid=17c0eef6-10e8-4b1f-b37f-36588a77d8f5&algo_exp_id=17c0eef6-10e8-4b1f-b37f-36588a77d8f5-0)|
|Pro Micro 5V 16MHz                         |1      |[Link](https://www.aliexpress.com/item/32768308647.html?spm=a2g0o.productlist.0.0.2607f202QTTq67&algo_pvid=7ec29e4c-daf6-41db-8152-19ac2f65dfd9&algo_exp_id=7ec29e4c-daf6-41db-8152-19ac2f65dfd9-0)|
|TRRS Socket PJ-320A                        |4      |[Link](https://www.aliexpress.com/item/4000661212458.html?spm=a2g0o.productlist.0.0.786215bcMDWN6j&algo_pvid=48175f89-cc7c-4d82-9240-efce3152adfa&algo_exp_id=48175f89-cc7c-4d82-9240-efce3152adfa-2)|
|TRRS Cable Male to Male 0.5m               |2      |[Link](https://www.aliexpress.com/item/32905903526.html?spm=a2g0o.productlist.0.0.4dc47529QkykEs&algo_pvid=9cf4583a-296e-42ce-8e4a-b7ea884c7d69&algo_exp_id=9cf4583a-296e-42ce-8e4a-b7ea884c7d69-0)|
|4.7k Ohm resistor through hole             |2      |[Link](https://www.aliexpress.com/item/32952657927.html?spm=a2g0o.productlist.0.0.55367bd26OIocu&algo_pvid=eb21df2b-1bb7-4781-a8fa-866f7e1554e0&algo_exp_id=eb21df2b-1bb7-4781-a8fa-866f7e1554e0-0)|
|Enameled copper jumper wire 0.1mm          |1      |[Link](https://www.aliexpress.com/item/32848033421.html?spm=a2g0o.productlist.0.0.222d322f9kKtko&algo_pvid=4df65977-a071-4e66-b8d2-4cdc380b177d&algo_exp_id=4df65977-a071-4e66-b8d2-4cdc380b177d-0)|
|5mm kepton tape                            |1      |[Link](https://www.aliexpress.com/item/1005001870368903.html?spm=a2g0o.productlist.0.0.56c32964so3t00&algo_pvid=b4641df1-4258-436e-ae0a-dd49df904cfe&algo_exp_id=b4641df1-4258-436e-ae0a-dd49df904cfe-0)|
|12mm rotary encoder with switch            |0-2    |[Link](https://sg.rs-online.com/web/p/mechanical-rotary-encoders/7377742/)|
|15x16 knob for 12mm encoder                |0-2    |[Link](https://www.aliexpress.com/item/1005001323668563.html?spm=a2g0o.detail.1000014.23.248e794eVvCEnx&gps-id=pcDetailBottomMoreOtherSeller&scm=1007.14976.204930.0&scm_id=1007.14976.204930.0&scm-url=1007.14976.204930.0&pvid=a1382086-ef33-42ef-a9ab-94a2c085269f&_t=gps-id:pcDetailBottomMoreOtherSeller,scm-url:1007.14976.204930.0,pvid:a1382086-ef33-42ef-a9ab-94a2c085269f,tpp_buckets:668%230%23131923%2371_668%23888%233325%231_4976%230%23204930%239_4976%232711%237538%23796_4976%233104%239653%236_4976%234052%2321623%2388_4976%233141%239887%234_668%232846%238109%231935_668%232717%237564%23648_668%231000022185%231000066059%230_668%233422%2315392%23340_4452%230%23189847%230_4452%233474%2315675%23228_4452%234862%2322449%23630_4452%233098%239599%23666_4452%233564%2316062%23426)|
|EVQ-WGD001 encoder with switch             |0-2    |[Link](https://www.aliexpress.com/item/4001293888953.html?spm=a2g0o.productlist.0.0.118759fcSeFGBC&algo_pvid=847610a8-18a5-4fa9-a57b-980ad6205089&algo_exp_id=847610a8-18a5-4fa9-a57b-980ad6205089-0)|
|Kailh Choc V1 25g switch                   |14     |[Link](https://www.aliexpress.com/item/4000907409650.html?spm=a2g0o.store_pc_groupList.8148356.11.606939a66Tvk6L)|
|Choc keycaps 1u                            |8      |[Link](https://www.aliexpress.com/item/32979973961.html?spm=a2g0o.store_pc_groupList.8148356.21.1b9d36a4Coe1f0)|
|Choc keycaps 1.5u                          |6      |[Link](https://www.aliexpress.com/item/4000135705283.html?spm=a2g0o.store_pc_groupList.8148356.31.5b1136a4d8gvZK)|
|6x2 antislip pads                          |4|[Link](https://www.aliexpress.com/item/1005001834060269.html?spm=a2g0o.productlist.0.0.1b4de9abYDw7VQ&algo_pvid=7e52f7bd-74d2-497d-89a9-5126675db393&algo_exp_id=7e52f7bd-74d2-497d-89a9-5126675db393-11)|

## **Tools**
|Item                                       |Count  |Example|
|:---                                       |:---:  |:---:|
|Soldering iron 80W                         |1      |[Link](https://www.aliexpress.com/item/4000005873814.html?spm=a2g0o.productlist.0.0.3d5059f26KRLVN&algo_pvid=5b1311ed-043b-48b1-9540-15845a9cffab&algo_exp_id=5b1311ed-043b-48b1-9540-15845a9cffab-31)|
|Tin wire 0.5 to 1mm will do                |1      |[Link](https://www.aliexpress.com/item/32946643268.html?spm=a2g0o.productlist.0.0.21334be6X9YM36&algo_pvid=50712cb8-a6be-4a82-bdfd-3deb5e2c4329&algo_exp_id=50712cb8-a6be-4a82-bdfd-3deb5e2c4329-0)|
|Hot glue gun                               |1      |[Link](https://www.aliexpress.com/item/1005001393578323.html?spm=a2g0o.productlist.0.0.3b063cf9nndoZZ&algo_pvid=59c64fb0-2832-4323-987f-0915939b8da6&algo_exp_id=59c64fb0-2832-4323-987f-0915939b8da6-7)|

## **Remarks**
*   You can buy a bundle that is soldering iron + tin wire + some other accessories that you think might come usefull. Buying a bundle with a multimeter is a good idea.
*   Better kecaps are [MKUltra](https://mkultra.click/mbk-choc-keycaps)
*   If possible getting switches lighter than 25g should make sense, but since I wasn't able to put my hands on any of these I can't recommend. Choc springs are almost impossible to get.

## ***[Optional]* Additional items for trackball module**

You will have to get all the items from the 'trackball base' plus the ones from the ball size you're planning to use. Paracord and heatshrink tube are rather optional but using it will result in better hold of the cable in trackball base. As a plus you can match the color of paracord to the TRRS cables.

## **BOM - trackball base**
|Item                                       |Count  |Example|
|:---                                       |:---:  |:---:|
|6 core wire                                |1m     |[Link](https://www.aliexpress.com/item/1005001886139193.html?spm=a2g0o.productlist.0.0.75cee7daBQPjdC&algo_pvid=ddc5ba45-1e3a-4247-86ff-a8b83a390748&algo_exp_id=ddc5ba45-1e3a-4247-86ff-a8b83a390748-0)|
|Bearing steel rollers M3x8mm               |3      |[Link](https://www.aliexpress.com/item/4000176913597.html?spm=a2g0s.9042311.0.0.27424c4d8d9YIH)|
|ADNS9800 breaktout board                   |1      |[Link](https://github.com/kbjunky/ADNS9800) or [Pre-assembled](https://www.tindie.com/products/jkicklighter/adns-9800-laser-motion-sensor/)|
|M2x5mm flat head screw                     |2      |[Link](https://www.aliexpress.com/item/1005001763933939.html?spm=a2g0o.productlist.0.0.5069306aGAEBqO&algo_pvid=b928c17d-eb55-42dd-a5fd-f70dc61b1c6e&algo_exp_id=b928c17d-eb55-42dd-a5fd-f70dc61b1c6e-1)|
|Paracord 4mm                               |1m     |[Link](https://www.aliexpress.com/item/4000288304576.html?spm=a2g0o.productlist.0.0.469c57b3KTd8Gz&algo_pvid=2e98efd8-3384-46e1-97e4-6de90e955e46&algo_exp_id=2e98efd8-3384-46e1-97e4-6de90e955e46-0)|
|Heat shrink tube                           |1box   |[Link](https://www.aliexpress.com/item/32985677716.html?spm=a2g0o.productlist.0.0.5f406406FbPlSp&algo_pvid=77cd5c76-4f2a-4af4-9cd5-eb6d1cbf94fd&algo_exp_id=77cd5c76-4f2a-4af4-9cd5-eb6d1cbf94fd-0)|
## **BOM - 34mm trackball**
|Item                                       |Count  |Example|
|:---                                       |:---:  |:---:|
|SiO2 bearing 603(3x9x3mm)                  |3      |[Link](https://www.aliexpress.com/item/1005002254638667.html?spm=a2g0s.9042311.0.0.27424c4dtEdyQj)|
|M570/Ergo 34mm ball                        |1      |[Link](https://www.aliexpress.com/item/1005003007477853.html?spm=a2g0o.productlist.0.0.5c2375b6zAYly4&algo_pvid=002d0afb-2191-423d-83ef-9072c89420e0&algo_exp_id=002d0afb-2191-423d-83ef-9072c89420e0-3)|
 
## **BOM - 44mm trackball**
|Item                                       |Count  |Example|
|:---                                       |:---:  |:---:|
|SiO2 bearing 603(3x9x3mm)                  |3      |[Link](https://www.aliexpress.com/item/1005002254638667.html?spm=a2g0s.9042311.0.0.27424c4dtEdyQj)|
|44mm Trackman ball                         |1      |[Link](https://www.aliexpress.com/item/4001206864887.html?spm=a2g0o.productlist.0.0.5c2375b6zAYly4&algo_pvid=002d0afb-2191-423d-83ef-9072c89420e0&algo_exp_id=002d0afb-2191-423d-83ef-9072c89420e0-0)|

## **BOM - 52mm trackball**
|Item                                       |Count  |Example|
|:---                                       |:---:  |:---:|
|52mm snooker ball                          |1      |[Link](https://www.aliexpress.com/item/4001039556813.html?spm=a2g0s.9042311.0.0.68774c4dwpTP9T)|
|MR63ZZ bearings  3x6x2.5mm                 |3      |[Link](https://www.aliexpress.com/item/32833964689.html?spm=a2g0s.9042311.0.0.27424c4d8qSE8j)|


## **Remarks**
*   Two types of rotary encoders are supported, vertical and horizontal. In my build I went with horizontal on the right side and vertical on the left, and I would recommend this setup as the right one is meant to act as a mouse roller/scroll. But it's up to you which one you choose. Especially if you're not planning to use the trackball functionality. Pick two as the sockets doesn't support switches there. But encoders are interchangeable. 
*   Use recommended type of bearing for particular ball. This ensures smooth operation of the ball. Different bearing than specified won't support ball of other size at the correct height from the sensor.


# **Build guide**
## **3D printing**
Recommended settings for top part (holding switches etc), bottom not angled and encoder cap:
*   Layer height 0.2mm
*   Infill 30%
*   Use mirroring feature of your slicer to print left half
*   Supports not needed

Recommended settings for other parts:
*   Layer height 0.3mm (but if you have time 0.2mm will work just fine too)
*   Infill 15%
*   Use mirroring feature of your slicer to print left half
*   Supports not needed
*   Print desired trackball module matching your ball size. Bottom part is common for all sizes.

### **I would suggest printing top with the raised thumb and for the bottom part left side: angled 10 deg, and for the right side: flat with/o tracbkall**



## **Wiring**
Start with attaching kepton tape to the bottom side of ProMicro and top side of I2C expanders(cover the pads). This way you will avoid tin blobs (I didn't do it for I2C expanders and it was a mistake).
![](/img/kepton1.jpg)

Setup the pins on I2C expanders following the diagram.

![](/img/i2c1.png)

It should look something like this.

![](/img/i2c2.png)

Next you will have to prepare the switches. Put some tin on every switch pin. Then for the pinky you will have to attach 2 long pieces of enameled wire. It's easier this way since pinky is the tallest and it's a bit difficult to solder once it's socketed in place.

![](/img/pinky1.jpg)

Then insert switches. Make sure pins are facing the same way as on the photo/diagram. At this point you can also attach the I2C expander. Use small amount of hot glue to lock it in place. Be sure not to cover any of the pads.

![](/img/pins1.jpg)

Once this is done follow the below diagram and connect all the GND pins for the switches. For now skip the rotary encoder/audio jack part. These will be done later. Route the enameled wire through the canals. Otherwise it might get clipped when the bottom part is attached. 

![](/img/pins2.png)

Wiring should look like this.aa

![](/img/wiring1.jpg)

Now it's time to connect every switch to the respective pin on the I2C expander. Follow the diagram below for proper wiring.

![](/img/pins3.png)

Prepare encoders. From the 12mm vertical one clip mounting legs (thick ones on the sides) and solder some wire to each leg. It will make wiring easier later on. Attach the 3D printed cap which later on should clip into the encoder socket (it fits only one way so try first). Use the screw and a washer that came with the encoder (as per the image). For the horizontal one just solder some wire except for the first pin which is unused.

![](/img/enc1.png)

Push the encoders into the slots and follow below diagram for wiring. Be sure to keep the same pin orientation. Also you might want to use hot glue to hold them in place. **Remember to connect GND pins (look at the switch GND diagram)!**

![](/img/enc2.png)

Before moving on to assembling audio jacks I would recommend using some hot glue on the switches that are above the audio jack. Otherwise later on it will be impossible to reach the bottom of the switch.
First you will have to bend the pins on the audio jack socket and cut the plastic pieces marked in red. There's a special pocket inside the wall for the socket to fit in. Try pushing it so it's at the same level as the bottom of the keyboard. 

![](/img/audio1.png)

Follow the diagram below for proper wiring(I have only named proper pins). You can wire GND to the nearest GND, for example to the encoder GND or the one on the nearest switch or even wire.

![](/img/audio2.png)

And final product should look like this (pay attention to the audio socket position and don't mind that I'm lacking the GND connection).

![](/img/audio3.jpg)

That should be it for assembling keyboard halves. Secure everything with hot glue. Should look more or less like this. Be sure no wire is sticking out, place everything inside the canals and secure with hot glue.

![](/img/done1.jpg)

Now it's time for the MCU part. First take a look at assembled part. This will give you a general understanding how it should look like. There are 2 pull up resistors wired from RAW pin to pin 2 (SDA) and pin 3 (SCL). Audio jacks sockets should clip in place. Notice that audio jack pins are bent in the opposite direction (inwards) compared to the keyborad halves. If you're planning to use the trackball I would suggest wiring connecting cable first then wiring audio jack sockets. Refer to the wiring diagram for all of the parts. Reset switch is not necessary. I've only used one because I knew I will be programming it multiple times and shorting pins in a long run is not the best way to enter flashing mode. Besides pressing ASETNIOP keys will enter DFU mode so you can totally skip the reset switch. Also it's a real pain to solder :D

![](/img/mcu1.jpg)

First are the pull up resistors.

![](/img/mcu2.png)

Then the trackball if you're using one(you can choose any GND pin).

![](/img/mcu3.png)

And audio sockets come last (You can use VCC pin instead of RAW).

![](/img/mcu4.png)

For the trackball assembly one picture is worth a thousand words. All pins are described so it's just a matter of soldering.

![](/img/tb1.png)

Check **src** folder for flashing/layout information.

**And that's it. Congratulations!**


