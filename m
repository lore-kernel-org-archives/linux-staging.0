Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC2533C0
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 15:34:37 +0000 (UTC)
Received: from [192.168.1.141] ([37.4.248.41]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N5W0q-1odYGM3rcA-016zDA; Mon, 23 Jan 2023 16:29:01 +0100
Message-ID: <40196216-79bc-0dff-d7d2-dee3bc53a38d@i2se.com>
Date: Mon, 23 Jan 2023 16:28:58 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 0/6] staging: vc04_services: vchiq: Register devices
 with a custom bus_type
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Adrien Thierry
 <athierry@redhat.com>, Dan Carpenter <error27@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>
References: <20230120201104.606876-1-umang.jain@ideasonboard.com>
 <786df750-221e-82fc-a324-d30261296974@i2se.com>
 <62644cd8-c871-aee0-30b7-2fbab097504c@ideasonboard.com>
 <912601ba-c60d-8d69-f061-62b854c5d9ce@i2se.com>
 <4e4215a7-c733-9ea6-dad8-9bf53dc9e891@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <4e4215a7-c733-9ea6-dad8-9bf53dc9e891@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Nwv1a9eVEttVMa+Xetvukvdky5ojIjEy6AquHuhtGboW48xcu8l
 3VQHVQlEdDd+Vg8yaFi7X+CNX5L2+z6wfLPLRcfYQNtapy4DYgl2d62MPFuq2d03sdJEq5b
 nTE0QMYUAkA/8KyWQeEW101uizo9dIJD3bus8TBUjvBfwipwdXr3VzcLni4YHyRE/ot7tfB
 z11S8n1XOEi1GxImLlaaQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Rl3yeVu5YDU=;aG2U0aaL1sst0VXIm3EHV1uhtXf
 k0IllVAw0AgnqztV2bxNXDHUPimE3wuqMKZNlTmrcVDTqvEw9hsc4MCp9ZwCKDym/UH6oRo4i
 LFxmXeQwF42Zn+zcdeNIxCc91ZSyUR0rNWY1BjamSAyK1jXAu6qmwpxgipBVJOu78QjbF5zVC
 YeY7pDhZQQ4JKqIXx03vdQbFad2BCJJYj7LiR0LHR/4e7p5Yz1Senzb9swYvcgbJVaERqUra7
 jjfa4t27uuhqC9CCDWUfHu3PO8dp0caeS0xwTsNS3SoRJSyt/7Jyowlh1DlXVgNEFGGbCQqjb
 RgbNc41l0ITI+iUhkoVdmiEMwdHKqEXyEcOmMZfQNP6Niil0st7V3QKhcGpuw/ocmP6J/6/aX
 Mo+0HyrcI5oCrnYJ78X6MdDrIXclq5nxr/4Laq1iK6bRBIvxBpnO5di00VSwy4kp/VBieo7jo
 PRnxKS84zTkWFoG7S3xg5OmRigST/5Mzk3QGwY5gUcfeQouTbKovUCaq1o3sDG6kPyjfYqOeN
 YhfdYJ++AT4oZL8bbMsHxfm3IHBz2dlrVxcdO19tIf0MOa9NNfpNiqTi9wEAlrvHW1yOfrPcY
 wZNg0HJghgtLCLGLi2SEpfzk3oH7lfBoJO0ZPIRbfUd3ogr2dP6N1/kjbC7dlWF7S+4c+15dl
 3yNwzB4kPnd0qG10IaK110ze+Si6Ibx0eSYwrsbDEw==

Hi Umang,

Am 23.01.23 um 15:12 schrieb Umang Jain:
> Hi Stefan
>
> On 1/23/23 5:16 PM, Stefan Wahren wrote:
>> Hi Umang,
>>
>> Am 23.01.23 um 08:48 schrieb Umang Jain:
>>> Hi Stefan,
>>>
>>> Thank for the testing.
>>>
>>> On 1/23/23 5:04 AM, Stefan Wahren wrote:
>>>> Hi Umang,
>>>>
>>>> Am 20.01.23 um 21:10 schrieb Umang Jain:
>>>>> This series just introduces five extra patches for dropping include
>>>>> directives from Makefiles (suggested by Greg KH) and rebased.
>>>>>
>>>>> The main patch (6/6) removes platform device/driver abuse and moves
>>>>> things to standard device/driver model using a custom_bus. Specific
>>>>> details are elaborated in the commit message.
>>>>>
>>>>> The patch series is based on top of d514392f17fd (tag: next-20230120)
>>>>> of linux-next.
>>>>
>>>> applied this series on top of linux-next and build it with 
>>>> arm/multi_v7_defconfig plus the following:
>>>>
>>>> CONFIG_BCM_VIDEOCORE=y
>>>> CONFIG_BCM2835_VCHIQ=m
>>>> CONFIG_VCHIQ_CDEV=y
>>>> CONFIG_SND_BCM2835=m
>>>> CONFIG_VIDEO_BCM2835=m
>>>> CONFIG_BCM2835_VCHIQ_MMAL=m
>>>>
>>>> and the devices doesn't register on Raspberry Pi 3 B Plus:
>>>>
>>>> [   25.523337] vchiq: module is from the staging directory, the 
>>>> quality is unknown, you have been warned.
>>>> [   25.541647] bcm2835_vchiq 3f00b840.mailbox: Failed to register 
>>>> bcm2835_audio vchiq device
>>>> [   25.553692] bcm2835_vchiq 3f00b840.mailbox: Failed to register 
>>>> bcm2835-camera vchiq device
>>>
>>> I was able to reproduce and it seems the issue here is the change 
>>> mentioned in the cover
>>>
>>> - drop dma_set_mask_and_coherent
>>>
>>> in V6.
>>>
>>> (I usually test patches on RPi 4B with vcsm-cma and bcm2835-isp 
>>> applied so my branch has the DMA hunk included while I was testing V6)
>>
>> just to avoid misunderstandings, did you read 
>> drivers/staging/vc04_services/interface/TESTING ?
>
> Yes, but it's not geared towards the hardware I have (Rpi Model 4B)
>>
>> The Raspberry Pi 4 is currently not fully supported for VCHIQ in 
>> mainline. From my limited understanding the DMA controller driver 
>> needs 40 bit support, so VCHIQ on BCM2711 can use it. This part is 
>> currently only available in the vendor tree. The reason why the 
>> driver is unexpectedly probing is a historical issue in the 
>> devicetree :-(
>>
>> Raspberry Pi 4 support is not considered as necessary for moving out 
>> of staging.
>>
>
> While I am looking into what's the reason behind the hunk, without 
> which the devices cannot get registered... This is not related to the 
> 40bit support for DMA. I remember that it worked without it during the 
> bcm2835-isp development.
>
> Are you implying that I should not use RPi Model 4B for testing ? 
> Because that's the only RPi hardware I own.

No, i didn't want to imply this. It's just a warning that's currently 
not the best platform for testing. But i also understand that nowadays 
users have a BCM2711 based Raspberry Pi.

This leads to another question which device tree do you use for testing, 
since the mainline one doesn't have the right compatible for BCM2711?

>>>
>>> Below is the hunk which should resolve the issue.
>>>
>>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_device.c
>>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_device.c
>>> @@ -6,6 +6,7 @@
>>>   */
>>>
>>>  #include <linux/device/bus.h>
>>> +#include <linux/dma-mapping.h>
>>>  #include <linux/slab.h>
>>>  #include <linux/string.h>
>>>
>>> @@ -72,6 +73,12 @@ int vchiq_device_register(struct device *parent, 
>>> const char *name)
>>>         device->dev.type = &vchiq_device_type;
>>>         device->dev.release = vchiq_device_release;
>>>
>>> +       ret = dma_set_mask_and_coherent(&device->dev, 
>>> DMA_BIT_MASK(32));
>>> +       if (ret < 0) {
>>> +               vchiq_device_release(&device->dev);
>>> +               return ret;
>>> +       }
>>> +
>>>         ret = device_register(&device->dev);
>>>         if (ret) {
>>>                 put_device(&device->dev);
>>>
>>> It seems we need to include the dma_set_mask_and_coherent() even if 
>>> bcm2835-audio, bcm2835-camera device doesn't do DMA? I need to look 
>>> into why is that/
>>>
>>>  Laurent, any thoughts on this please?
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
