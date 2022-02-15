Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3A21561
	for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 14:11:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1644934273; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MuMqrlicxA4P7MbqkOrK99tAZnfya5ncXN1GocfVW2vbSw6mE5fZNazXxapPsVpzebfC9KeAvBMFB8We81nBYrV0RnUMPMvLutDTWTeXT8LKYdRJiRxzLn2P8pakzJsIQDylAWbLy/OUQ7xXP1A0OYSi8rxTDhbr3obTKfk1aeM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1644934273; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=8eXe6qTiDhWGw8cIAbkt0qjhk6AskvfddgIjxuqvJeM=; 
	b=YAoHsbzu63ghKuvFHKH7neBvopzdnnhd6RIG12NeSQ/CZ1v2BqL0o2gnSwYM45HrJuJ+jQ7RpBu9V/js1oU4tCj5f0V8UfUo3aOPPrdb9O85czdAZ+cYANtxbCFvRGvkYbVdx8pS7p581+aUfwqmyj4ZWqasMp222FVtcESeir0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1644934273;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=8eXe6qTiDhWGw8cIAbkt0qjhk6AskvfddgIjxuqvJeM=;
	b=T9uI3ph1hWB3Pcutj4v8ZYoGz0ekpY1QMb/SJNO0kqSGnoxiPf07G+isbW3CeS8p
	bkVATVY6HtQcKzPmO6KBJxjfupoHX4qixuo0HI/s8Xo75CQntT83f5GLd7G28RkVCmt
	YP24/8lVyjw3RwdSQWugkI4cByYSCU8VelwjbaiU=
Received: from [10.10.10.3] (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 1644934271575829.756525928824; Tue, 15 Feb 2022 06:11:11 -0800 (PST)
Message-ID: <6902e0b3-5bd3-185b-26f8-eab2e37f29cb@arinc9.com>
Date: Tue, 15 Feb 2022 17:11:06 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/2] staging: mt7621-dts: do not use rgmii2_pins for
 ethernet on GB-PC1
Content-Language: en-US
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Sander Vanheule <sander@svanheule.net>, NeilBrown <neil@brown.name>,
 DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 erkin.bozoglu@xeront.com, linux-staging@lists.linux.dev
References: <20220215081725.3463-1-arinc.unal@arinc9.com>
 <20220215081725.3463-2-arinc.unal@arinc9.com>
 <CAMhs-H-74bK3m975Dtmg2zPrGjmqzSd+Tb_qdUV14yJBAWRQbw@mail.gmail.com>
 <d9240058-68b4-cbd6-54b0-18f41ee5a98a@arinc9.com>
 <CAMhs-H_MvXOOmUDq97YyW7uaSfeNWcKE7F+J4182=MwH7yaOaw@mail.gmail.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <CAMhs-H_MvXOOmUDq97YyW7uaSfeNWcKE7F+J4182=MwH7yaOaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 15/02/2022 12:09, Sergio Paracuellos wrote:
> Hi Arinc,
> 
> On Tue, Feb 15, 2022 at 9:50 AM Arınç ÜNAL <arinc.unal@arinc9.com> wrote:
>>
>> Hey Sergio,
>>
>> On 15/02/2022 11:35, Sergio Paracuellos wrote:
>>> Hi Arinc,
>>>
>>> On Tue, Feb 15, 2022 at 9:18 AM Arınç ÜNAL <arinc.unal@arinc9.com> wrote:
>>>>
>>>> GB-PC1 uses some of the rgmii2 pins (22 - 33) as GPIO. Therefore, the
>>>> rgmii2 bus cannot be used on this device.
>>>> Overwrite pinctrl-0 property under the ethernet node without rgmii2_pins on
>>>> the GB-PC1 devicetree.
>>>>
>>>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>> ---
>>>>    drivers/staging/mt7621-dts/gbpc1.dts | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>
>>> No issues in GB-PC1. So:
>>>
>>> Tested-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>>
>> Thanks for testing it so quickly!
>>
>> I was wondering if you got pinctrl errors on the bootlog before applying
>> this patch series.
>>
>> rgmii2 pin group is given gpio function so calling it from ethernet node
>> would cause this on my TP-Link RE650 v1 which also uses the rgmii2_pins
>> as GPIO.
>>
>> [    1.177349] rt2880-pinmux pinctrl: pin io22 already requested by
>> pinctrl; cannot claim for 1e100000.ethernet
>> [    1.196966] rt2880-pinmux pinctrl: pin-22 (1e100000.ethernet) status -22
>> [    1.210312] rt2880-pinmux pinctrl: could not request pin 22 (io22)
>> from group rgmii2  on device rt2880-pinmux
>> [    1.230058] mtk_soc_eth 1e100000.ethernet: Error applying setting,
>> reverse things back
>> [    1.245853] mtk_soc_eth: probe of 1e100000.ethernet failed with error -22
> 
> No, I was not getting any kind of error since when I test your last
> patch series I was not experimenting any kind of regression. I don't
> have any issues now also with your new patch series. Your new changes
> make sense since as you have said "rgmii2" pins are requested as GPIO
> but it seems are not really being requested? I don't have time to
> check the datasheet now but will try to get time to see what is
> happening there.

I think this must have something to do with pinctrl on newer kernels as 
the TP-Link RE650 that I tested uses the OpenWrt master branch (Linux 5.10).

I hacked together something to run 5.17-rc1 for RE650 on OpenWrt. Here's 
what I found:

When I still have rgmii2_pins on the ethernet node, I don't get any of 
the warnings above but this happens:

- failsafe button lights_toggle was pressed -
- failsafe -

When I apply this patch and test again I don't get into failsafe anymore.

The key for LIGHTS_TOGGLE is on GPIO 30 which is one of the rgmii2 pins.
https://github.com/openwrt/openwrt/blob/master/target/linux/ramips/dts/mt7621_tplink_rexx0-v1.dtsi#L34

What I make of this is, with newer kernels, pinctrl doesn't care and 
just claims the pin group for ethernet anyway. This would explain why 
the lights_toggle key GPIO goes from active low to high. So this patch 
is still a necessity.

Arınç
