Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C037E
	for <linux-staging@lists.linux.dev>; Thu,  3 Mar 2022 15:16:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1646320586; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JrpQ/H92nyTLnwuq1ni4w8NmnnCdjxOl3sGve0WiNmfcD6SkSEeC95NYHkSw94hMzcmCzB42v1b/gdgLt9V8rd0i8IErh2a70XVYoqjCDFnP8iLAqvEsCZO6mJnlIjtJHt9LbDrDqTX7ZQsh3CmpMJhmwIbOdPPPJ8YwKi/0N0I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1646320586; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=R5VGKrB1TXcC7gdzXkVBxbvWdRfDw5wQnAyv/QuZCzY=; 
	b=mp5GDLT54JAHcSUwomKoQsLqbX9A9dlAX1CLdLn8QIDt3hux+2codn3VhgZwst/3o0+/7jDUSTOdcE+Fhggr62nHCu8vkNlEler+PYtWaDfZBiiCpdm25B+tiODXfli4PPZpUpDz1lEeDAxLd6M4AgANyFd2JIxrGLEnrLFdIh0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1646320586;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=R5VGKrB1TXcC7gdzXkVBxbvWdRfDw5wQnAyv/QuZCzY=;
	b=Vw5U3loKQX4BKGiQ2O+WHj6C8LCfVhLTJ9ft3ReMipQEYCkuGWEUQ/EbK4rzxDQ8
	vfyCvMbCSQ0brboBWMGOngmc2isIuQemD8ff65XkfJLNLJ8Z/tIVHy4E3pVb5WfjAav
	0Q0rMwvU8zDBCOz8IrdeGy8viaTRTSDLnzEpQVrs=
Received: from [10.10.10.3] (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 1646320584052832.2095674224655; Thu, 3 Mar 2022 07:16:24 -0800 (PST)
Message-ID: <18f43289-516c-3b07-d8cf-f173491aa6bb@arinc9.com>
Date: Thu, 3 Mar 2022 18:16:19 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 2/2] staging: mt7621-dts: do not use rgmii2_pins for
 ethernet on GB-PC1
Content-Language: en-US
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Sander Vanheule <sander@svanheule.net>, NeilBrown <neil@brown.name>,
 DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 erkin.bozoglu@xeront.com, Rob Herring <robh@kernel.org>,
 linux-staging@lists.linux.dev
References: <20220215081725.3463-1-arinc.unal@arinc9.com>
 <20220215081725.3463-2-arinc.unal@arinc9.com>
 <CAMhs-H-74bK3m975Dtmg2zPrGjmqzSd+Tb_qdUV14yJBAWRQbw@mail.gmail.com>
 <d9240058-68b4-cbd6-54b0-18f41ee5a98a@arinc9.com>
 <CAMhs-H_MvXOOmUDq97YyW7uaSfeNWcKE7F+J4182=MwH7yaOaw@mail.gmail.com>
 <6902e0b3-5bd3-185b-26f8-eab2e37f29cb@arinc9.com>
 <CAMhs-H-bMgsssuy-Rrygr0PCVkgDWDi=-=3vDVG_cnMX4L9vOA@mail.gmail.com>
 <bffc9641-ec69-f88e-b877-65d12305b928@arinc9.com>
 <CAMhs-H-dHY_+gTOmGXYFyVLK69D7y0bw5s2=e6gDh5yFtp6HzQ@mail.gmail.com>
 <e26eae35-8207-b8c7-7af0-0fb4bd7a69c9@arinc9.com>
 <CAMhs-H-JtkHzjUkNTdJ0OUsZqNYHYAi6gDp2SYc8yJbPpx9=zw@mail.gmail.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <CAMhs-H-JtkHzjUkNTdJ0OUsZqNYHYAi6gDp2SYc8yJbPpx9=zw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 28/02/2022 18:11, Sergio Paracuellos wrote:
> On Mon, Feb 28, 2022 at 3:53 PM Arınç ÜNAL <arinc.unal@arinc9.com> wrote:
>>
>> On 28/02/2022 10:01, Sergio Paracuellos wrote:
>>> Hi Arinc,
>>>
>>> On Sun, Feb 27, 2022 at 4:12 PM Arınç ÜNAL <arinc.unal@arinc9.com> wrote:
>>>>
>>>> On 15/02/2022 18:16, Sergio Paracuellos wrote:
>>>>> Hi Arinc,
>>>>>
>>>>> On Tue, Feb 15, 2022 at 3:11 PM Arınç ÜNAL <arinc.unal@arinc9.com> wrote:
>>>>>>
>>>>>> On 15/02/2022 12:09, Sergio Paracuellos wrote:
>>>>>>> Hi Arinc,
>>>>>>>
>>>>>>> On Tue, Feb 15, 2022 at 9:50 AM Arınç ÜNAL <arinc.unal@arinc9.com> wrote:
>>>>>>>>
>>>>>>>> Hey Sergio,
>>>>>>>>
>>>>>>>> On 15/02/2022 11:35, Sergio Paracuellos wrote:
>>>>>>>>> Hi Arinc,
>>>>>>>>>
>>>>>>>>> On Tue, Feb 15, 2022 at 9:18 AM Arınç ÜNAL <arinc.unal@arinc9.com> wrote:
>>>>>>>>>>
>>>>>>>>>> GB-PC1 uses some of the rgmii2 pins (22 - 33) as GPIO. Therefore, the
>>>>>>>>>> rgmii2 bus cannot be used on this device.
>>>>>>>>>> Overwrite pinctrl-0 property under the ethernet node without rgmii2_pins on
>>>>>>>>>> the GB-PC1 devicetree.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>>>>>>>> ---
>>>>>>>>>>       drivers/staging/mt7621-dts/gbpc1.dts | 4 ++++
>>>>>>>>>>       1 file changed, 4 insertions(+)
>>>>>>>>>
>>>>>>>>> No issues in GB-PC1. So:
>>>>>>>>>
>>>>>>>>> Tested-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>>>>>>>>
>>>>>>>> Thanks for testing it so quickly!
>>>>>>>>
>>>>>>>> I was wondering if you got pinctrl errors on the bootlog before applying
>>>>>>>> this patch series.
>>>>>>>>
>>>>>>>> rgmii2 pin group is given gpio function so calling it from ethernet node
>>>>>>>> would cause this on my TP-Link RE650 v1 which also uses the rgmii2_pins
>>>>>>>> as GPIO.
>>>>>>>>
>>>>>>>> [    1.177349] rt2880-pinmux pinctrl: pin io22 already requested by
>>>>>>>> pinctrl; cannot claim for 1e100000.ethernet
>>>>>>>> [    1.196966] rt2880-pinmux pinctrl: pin-22 (1e100000.ethernet) status -22
>>>>>>>> [    1.210312] rt2880-pinmux pinctrl: could not request pin 22 (io22)
>>>>>>>> from group rgmii2  on device rt2880-pinmux
>>>>>>>> [    1.230058] mtk_soc_eth 1e100000.ethernet: Error applying setting,
>>>>>>>> reverse things back
>>>>>>>> [    1.245853] mtk_soc_eth: probe of 1e100000.ethernet failed with error -22
>>>>>>>
>>>>>>> No, I was not getting any kind of error since when I test your last
>>>>>>> patch series I was not experimenting any kind of regression. I don't
>>>>>>> have any issues now also with your new patch series. Your new changes
>>>>>>> make sense since as you have said "rgmii2" pins are requested as GPIO
>>>>>>> but it seems are not really being requested? I don't have time to
>>>>>>> check the datasheet now but will try to get time to see what is
>>>>>>> happening there.
>>>>>>
>>>>>> I think this must have something to do with pinctrl on newer kernels as
>>>>>> the TP-Link RE650 that I tested uses the OpenWrt master branch (Linux 5.10).
>>>>>
>>>>> I think is this commit which I did according to a review after moving
>>>>> the driver from staging into 'drivers/pincrtl/ralink':
>>>>>
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/drivers/pinctrl/ralink?h=staging-next&id=8a55d64c3336fc2ffd488a37d08ceab154c7b56b
>>>>>
>>>>> You can also check other changes from where the driver was moved:
>>>>>
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/log/drivers/pinctrl/ralink?h=staging-next
>>>>
>>>> I realised current mt7621.dtsi does not apply the functions we specify
>>>> for the pin groups on device-specific devicetrees. I believe we need to
>>>> add this like on OpenWrt's mt7621.dtsi.
>>>>
>>>> https://github.com/openwrt/openwrt/blob/master/target/linux/ramips/dts/mt7621.dtsi#L249-L253
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/tree/drivers/staging/mt7621-dts/mt7621.dtsi?h=staging-testing#n153
>>>>
>>>> Can you apply the patch below to see if you get the error like above?
>>>> I also put it in attachments in case of space characters replacing tab
>>>> on the mail.
>>>>
>>>> Arınç
>>>>
>>>> ---
>>>> diff --git a/drivers/staging/mt7621-dts/gbpc1.dts
>>>> b/drivers/staging/mt7621-dts/gbpc1.dts
>>>> index 1b5175e6ccf3..e38a083811e5 100644
>>>> --- a/drivers/staging/mt7621-dts/gbpc1.dts
>>>> +++ b/drivers/staging/mt7621-dts/gbpc1.dts
>>>> @@ -114,10 +114,6 @@ default_gpio: gpio {
>>>>           };
>>>>     };
>>>>
>>>> -&ethernet {
>>>> -       pinctrl-0 = <&mdio_pins>, <&rgmii1_pins>;
>>>> -};
>>>> -
>>>>     &switch0 {
>>>>           ports {
>>>>                   port@0 {
>>>> diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi
>>>> b/drivers/staging/mt7621-dts/mt7621.dtsi
>>>> index 4da20da243e6..8e181d6f70ae 100644
>>>> --- a/drivers/staging/mt7621-dts/mt7621.dtsi
>>>> +++ b/drivers/staging/mt7621-dts/mt7621.dtsi
>>>> @@ -152,6 +152,11 @@ spi0: spi@b00 {
>>>>
>>>>           pinctrl: pinctrl {
>>>>                   compatible = "ralink,rt2880-pinmux";
>>>> +               pinctrl-names = "default";
>>>> +               pinctrl-0 = <&state_default>;
>>>> +
>>>> +               state_default: pinctrl0 {
>>>> +               };
>>>
>>> This should not be in the pinctrl node. I was told to remove it when
>>> bindings were reviewed since these properties must be in consumer
>>> nodes [0]. See binding documentation [1]:
>>>
>>> [0]: https://www.mail-archive.com/driverdev-devel@linuxdriverproject.org/msg102634.html
>>> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/tree/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml?h=staging-linus&id=b6821b0d9b56386d2bf14806f90ec401468c799f
>>
>> I'm not sure what a consumer node would be in this context so we can
>> claim the pin groups with the given function under it.
>>
>> Is the ethernet node a consumer node since I claim the rgmii2_pins pin
>> group under it for example?
> 
> That is my understanding, yes.

Adding Rob on Cc.

Solutions that come to my mind:

We can overwrite the pin group node with the function we want to set it.
Then claim it under a node where pins from the pin group is used.

Example:

diff --git a/drivers/staging/mt7621-dts/gbpc1.dts 
b/drivers/staging/mt7621-dts/gbpc1.dts
index 360ac98de3f1..709105b2822b 100644
--- a/drivers/staging/mt7621-dts/gbpc1.dts
+++ b/drivers/staging/mt7621-dts/gbpc1.dts
@@ -38,6 +38,9 @@ reset {
  	gpio-leds {
  		compatible = "gpio-leds";

+		pinctrl-names = "default";
+		pinctrl-0 = <&uart3_pins>;
+
  		power {
  			label = "green:power";
  			gpios = <&gpio 6 GPIO_ACTIVE_LOW>;
@@ -103,6 +106,12 @@ gpio {
  	};
  };

+&uart3_pins {
+	pinmux {
+		function = "gpio";
+	};
+};
+
  &ethernet {
  	pinctrl-0 = <&mdio_pins>, <&rgmii1_pins>;
  };

A few issues with this:

- Some used pins might not be defined on the devicetree. We cannot claim 
these pin groups because the consumer node doesn't exist.

For example, check JTAG pins of GB-PC2 on page 15:
https://github.com/ngiger/GnuBee_Docs/blob/master/GB-PCx/Documents/GB-PC2_V1.1_schematic.pdf

- Pins on the same pin group can be used under different nodes. We 
cannot claim a pin group under multiple nodes.

So we can get back to this:

Treat pinctrl node as a consumer node. We might not need to refer to the 
pinctrl-0 & pinctrl-names properties on the rt2880-pinmux documentation 
since they're generic pinctrl properties.

Example:

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi
b/drivers/staging/mt7621-dts/mt7621.dtsi
index 4da20da243e6..8e181d6f70ae 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -152,6 +152,12 @@ spi0: spi@b00 {

   	pinctrl: pinctrl {
   		compatible = "ralink,rt2880-pinmux";
+		pinctrl-names = "default";
+		pinctrl-0 = <&state_default>;
+
+		state_default: state-default {
+
+		};

   		i2c_pins: i2c0-pins {
   			pinmux {

On any mt7621 devicetree:

&state_default {
	gpio-pinmux {
		groups = "rgmii2", "uart3", "wdt";
		function = "gpio";
	};
};

By the way, is there a reason why wdt and jtag pin groups are missing 
from the documentation and mt7621.dtsi? If they are used as GPIO by 
default we can explicitly define them on mt7621.dtsi and mention them on 
the documentation.

Arınç
