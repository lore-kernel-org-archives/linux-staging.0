Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353994350
	for <linux-staging@lists.linux.dev>; Mon,  7 Mar 2022 22:25:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1646691915; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AUBB0LFL0xh2D2yGrzzgo3R0fdhNIyNf+lLO3o3qoyY2i2SNWag3Ied7grtDYfwhYwNcIkJjeHR6ebpEqnCCPFJguLBCObf4HQjxdc+aawRVhItP7pmh1I/oWenjAQGok8GM4PwotRBOLQLOBHzr3I+h/X6DkO8bHjsOXI1d44Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1646691915; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=piJd1IlRotImhusrB+cUJi7QxXVxUTjqbfQt2SvWEUY=; 
	b=fcvNwCZ4LlvEpOeRr23sXI00XvgkigFCljy0vNWH7tR7aiKB7dzi8znPtJLsE3RE+jexstcKUa4+Rv4VAqDo5ODMyPRt03LQgwMj8ayDylgFt5NnLRFFnkwmZrIwPuSWBSvLTDYffA/10FEi6GAM/AyCv9woT2CY9OxnJDMrQe0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1646691915;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=piJd1IlRotImhusrB+cUJi7QxXVxUTjqbfQt2SvWEUY=;
	b=RdQavhQvihHqIY+6AkDLdoFCnbsiV0WcKDuPNQ8N1r0OcDk8UwxXo1sTMJ6B3lDk
	opRkLK8rUlndp6t33fBp2+MJMiy6Kbfz1yGMR9GXvIEd7uLDKCoFHFVTZKFH/U6RCzq
	yvwnA0lvN1Rl8WGYBPTPMGxKIPZO6Wolm6BihQcQ=
Received: from [10.10.10.3] (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 1646691914109651.5585194868883; Mon, 7 Mar 2022 14:25:14 -0800 (PST)
Message-ID: <b0b5ce7b-4fed-ff4e-9329-33948942a16f@arinc9.com>
Date: Tue, 8 Mar 2022 01:25:09 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/2] staging: mt7621-dts: do not use rgmii2_pins for
 ethernet on GB-PC1
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
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
 <18f43289-516c-3b07-d8cf-f173491aa6bb@arinc9.com>
In-Reply-To: <18f43289-516c-3b07-d8cf-f173491aa6bb@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 03/03/2022 18:16, Arınç ÜNAL wrote:
> On 28/02/2022 18:11, Sergio Paracuellos wrote:
>> On Mon, Feb 28, 2022 at 3:53 PM Arınç ÜNAL <arinc.unal@arinc9.com> wrote:
>>>
>>> On 28/02/2022 10:01, Sergio Paracuellos wrote:
>>>> Hi Arinc,
>>>>
>>>> On Sun, Feb 27, 2022 at 4:12 PM Arınç ÜNAL <arinc.unal@arinc9.com> 
>>>> wrote:
>>>>>
>>>>> On 15/02/2022 18:16, Sergio Paracuellos wrote:
>>>>>> Hi Arinc,
>>>>>>
>>>>>> On Tue, Feb 15, 2022 at 3:11 PM Arınç ÜNAL <arinc.unal@arinc9.com> 
>>>>>> wrote:
>>>>>>>
>>>>>>> On 15/02/2022 12:09, Sergio Paracuellos wrote:
>>>>>>>> Hi Arinc,
>>>>>>>>
>>>>>>>> On Tue, Feb 15, 2022 at 9:50 AM Arınç ÜNAL 
>>>>>>>> <arinc.unal@arinc9.com> wrote:
>>>>>>>>>
>>>>>>>>> Hey Sergio,
>>>>>>>>>
>>>>>>>>> On 15/02/2022 11:35, Sergio Paracuellos wrote:
>>>>>>>>>> Hi Arinc,
>>>>>>>>>>
>>>>>>>>>> On Tue, Feb 15, 2022 at 9:18 AM Arınç ÜNAL 
>>>>>>>>>> <arinc.unal@arinc9.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>> GB-PC1 uses some of the rgmii2 pins (22 - 33) as GPIO. 
>>>>>>>>>>> Therefore, the
>>>>>>>>>>> rgmii2 bus cannot be used on this device.
>>>>>>>>>>> Overwrite pinctrl-0 property under the ethernet node without 
>>>>>>>>>>> rgmii2_pins on
>>>>>>>>>>> the GB-PC1 devicetree.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>>>>>>>>> ---
>>>>>>>>>>>       drivers/staging/mt7621-dts/gbpc1.dts | 4 ++++
>>>>>>>>>>>       1 file changed, 4 insertions(+)
>>>>>>>>>>
>>>>>>>>>> No issues in GB-PC1. So:
>>>>>>>>>>
>>>>>>>>>> Tested-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>>>>>>>>>
>>>>>>>>> Thanks for testing it so quickly!
>>>>>>>>>
>>>>>>>>> I was wondering if you got pinctrl errors on the bootlog before 
>>>>>>>>> applying
>>>>>>>>> this patch series.
>>>>>>>>>
>>>>>>>>> rgmii2 pin group is given gpio function so calling it from 
>>>>>>>>> ethernet node
>>>>>>>>> would cause this on my TP-Link RE650 v1 which also uses the 
>>>>>>>>> rgmii2_pins
>>>>>>>>> as GPIO.
>>>>>>>>>
>>>>>>>>> [    1.177349] rt2880-pinmux pinctrl: pin io22 already 
>>>>>>>>> requested by
>>>>>>>>> pinctrl; cannot claim for 1e100000.ethernet
>>>>>>>>> [    1.196966] rt2880-pinmux pinctrl: pin-22 
>>>>>>>>> (1e100000.ethernet) status -22
>>>>>>>>> [    1.210312] rt2880-pinmux pinctrl: could not request pin 22 
>>>>>>>>> (io22)
>>>>>>>>> from group rgmii2  on device rt2880-pinmux
>>>>>>>>> [    1.230058] mtk_soc_eth 1e100000.ethernet: Error applying 
>>>>>>>>> setting,
>>>>>>>>> reverse things back
>>>>>>>>> [    1.245853] mtk_soc_eth: probe of 1e100000.ethernet failed 
>>>>>>>>> with error -22
>>>>>>>>
>>>>>>>> No, I was not getting any kind of error since when I test your last
>>>>>>>> patch series I was not experimenting any kind of regression. I 
>>>>>>>> don't
>>>>>>>> have any issues now also with your new patch series. Your new 
>>>>>>>> changes
>>>>>>>> make sense since as you have said "rgmii2" pins are requested as 
>>>>>>>> GPIO
>>>>>>>> but it seems are not really being requested? I don't have time to
>>>>>>>> check the datasheet now but will try to get time to see what is
>>>>>>>> happening there.
>>>>>>>
>>>>>>> I think this must have something to do with pinctrl on newer 
>>>>>>> kernels as
>>>>>>> the TP-Link RE650 that I tested uses the OpenWrt master branch 
>>>>>>> (Linux 5.10).
>>>>>>
>>>>>> I think is this commit which I did according to a review after moving
>>>>>> the driver from staging into 'drivers/pincrtl/ralink':
>>>>>>
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/drivers/pinctrl/ralink?h=staging-next&id=8a55d64c3336fc2ffd488a37d08ceab154c7b56b 
>>>>>>
>>>>>>
>>>>>> You can also check other changes from where the driver was moved:
>>>>>>
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/log/drivers/pinctrl/ralink?h=staging-next 
>>>>>>
>>>>>
>>>>> I realised current mt7621.dtsi does not apply the functions we specify
>>>>> for the pin groups on device-specific devicetrees. I believe we 
>>>>> need to
>>>>> add this like on OpenWrt's mt7621.dtsi.
>>>>>
>>>>> https://github.com/openwrt/openwrt/blob/master/target/linux/ramips/dts/mt7621.dtsi#L249-L253 
>>>>>
>>>>>
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/tree/drivers/staging/mt7621-dts/mt7621.dtsi?h=staging-testing#n153 
>>>>>
>>>>>
>>>>> Can you apply the patch below to see if you get the error like above?
>>>>> I also put it in attachments in case of space characters replacing tab
>>>>> on the mail.
>>>>>
>>>>> Arınç
>>>>>
>>>>> ---
>>>>> diff --git a/drivers/staging/mt7621-dts/gbpc1.dts
>>>>> b/drivers/staging/mt7621-dts/gbpc1.dts
>>>>> index 1b5175e6ccf3..e38a083811e5 100644
>>>>> --- a/drivers/staging/mt7621-dts/gbpc1.dts
>>>>> +++ b/drivers/staging/mt7621-dts/gbpc1.dts
>>>>> @@ -114,10 +114,6 @@ default_gpio: gpio {
>>>>>           };
>>>>>     };
>>>>>
>>>>> -&ethernet {
>>>>> -       pinctrl-0 = <&mdio_pins>, <&rgmii1_pins>;
>>>>> -};
>>>>> -
>>>>>     &switch0 {
>>>>>           ports {
>>>>>                   port@0 {
>>>>> diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi
>>>>> b/drivers/staging/mt7621-dts/mt7621.dtsi
>>>>> index 4da20da243e6..8e181d6f70ae 100644
>>>>> --- a/drivers/staging/mt7621-dts/mt7621.dtsi
>>>>> +++ b/drivers/staging/mt7621-dts/mt7621.dtsi
>>>>> @@ -152,6 +152,11 @@ spi0: spi@b00 {
>>>>>
>>>>>           pinctrl: pinctrl {
>>>>>                   compatible = "ralink,rt2880-pinmux";
>>>>> +               pinctrl-names = "default";
>>>>> +               pinctrl-0 = <&state_default>;
>>>>> +
>>>>> +               state_default: pinctrl0 {
>>>>> +               };
>>>>
>>>> This should not be in the pinctrl node. I was told to remove it when
>>>> bindings were reviewed since these properties must be in consumer
>>>> nodes [0]. See binding documentation [1]:
>>>>
>>>> [0]: 
>>>> https://www.mail-archive.com/driverdev-devel@linuxdriverproject.org/msg102634.html 
>>>>
>>>> [1]: 
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/tree/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml?h=staging-linus&id=b6821b0d9b56386d2bf14806f90ec401468c799f 
>>>>
>>>
>>> I'm not sure what a consumer node would be in this context so we can
>>> claim the pin groups with the given function under it.
>>>
>>> Is the ethernet node a consumer node since I claim the rgmii2_pins pin
>>> group under it for example?
>>
>> That is my understanding, yes.
> 
> Adding Rob on Cc.
> 
> Solutions that come to my mind:
> 
> We can overwrite the pin group node with the function we want to set it.
> Then claim it under a node where pins from the pin group is used.
> 
> Example:
> 
> diff --git a/drivers/staging/mt7621-dts/gbpc1.dts 
> b/drivers/staging/mt7621-dts/gbpc1.dts
> index 360ac98de3f1..709105b2822b 100644
> --- a/drivers/staging/mt7621-dts/gbpc1.dts
> +++ b/drivers/staging/mt7621-dts/gbpc1.dts
> @@ -38,6 +38,9 @@ reset {
>       gpio-leds {
>           compatible = "gpio-leds";
> 
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&uart3_pins>;
> +
>           power {
>               label = "green:power";
>               gpios = <&gpio 6 GPIO_ACTIVE_LOW>;
> @@ -103,6 +106,12 @@ gpio {
>       };
>   };
> 
> +&uart3_pins {
> +    pinmux {
> +        function = "gpio";
> +    };
> +};
> +
>   &ethernet {
>       pinctrl-0 = <&mdio_pins>, <&rgmii1_pins>;
>   };
> 
> A few issues with this:
> 
> - Some used pins might not be defined on the devicetree. We cannot claim 
> these pin groups because the consumer node doesn't exist.
> 
> For example, check JTAG pins of GB-PC2 on page 15:
> https://github.com/ngiger/GnuBee_Docs/blob/master/GB-PCx/Documents/GB-PC2_V1.1_schematic.pdf 
> 
> 
> - Pins on the same pin group can be used under different nodes. We 
> cannot claim a pin group under multiple nodes.
> 
> So we can get back to this:
> 
> Treat pinctrl node as a consumer node. We might not need to refer to the 
> pinctrl-0 & pinctrl-names properties on the rt2880-pinmux documentation 
> since they're generic pinctrl properties.
> 
> Example:
> 
> diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi
> b/drivers/staging/mt7621-dts/mt7621.dtsi
> index 4da20da243e6..8e181d6f70ae 100644
> --- a/drivers/staging/mt7621-dts/mt7621.dtsi
> +++ b/drivers/staging/mt7621-dts/mt7621.dtsi
> @@ -152,6 +152,12 @@ spi0: spi@b00 {
> 
>        pinctrl: pinctrl {
>            compatible = "ralink,rt2880-pinmux";
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&state_default>;
> +
> +        state_default: state-default {
> +
> +        };
> 
>            i2c_pins: i2c0-pins {
>                pinmux {
> 
> On any mt7621 devicetree:
> 
> &state_default {
>      gpio-pinmux {
>          groups = "rgmii2", "uart3", "wdt";
>          function = "gpio";
>      };
> };

I think a better solution would be to claim default_state under a device 
specific devicetree so we don't touch mt7621.dtsi at all. An mt7621 
device might not need to use any pin groups as gpio so putting a 
state_default node under mt7621.dtsi doesn't make sense.

I'll send patches for GB-PC1 & GB-PC2 for you to comment on.

Arınç
