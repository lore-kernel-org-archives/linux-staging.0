Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E501C89
	for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 08:50:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1644914992; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ixtAlUE0bwbwsyxLrrYhbUagRd2pesDXIS0h5ijxE4AfGfeX4VgqWwLuAmWZq+a7lf1rn+8c28QCfvEfqrS5hQUwTCHHTmlhirrUSYd8SRTC5qhKvNCpAEdPE8qRpi3bWdrmAFT64FRSam0Rj7t/o60lVM2BZzC/IQtsV1dMLws=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1644914992; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=UWN8r7YG3GxC+gL7Rb8jBzBDypf7DDePH+hxIx8sems=; 
	b=guZXmuQEeMXmV7jQ7RUBqRMxBSyf8/2ZzVktlsYh1HffSwK7x0comWBJ1CDmoUQU4xlZeqS2jPvBS2/X85/G5p8xZe/GpWSDXZpCl/rkO5FGYByM+ZByXgRxN262b4eFuF5G60EXaR1ctNzwhkrmIU3gCHdAiLYnMJ5LMGMHbus=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1644914992;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=UWN8r7YG3GxC+gL7Rb8jBzBDypf7DDePH+hxIx8sems=;
	b=ZAumvDo493izSBPxBn5iHChMIjSCrEXd/VPKI5ZMt0ygsH/RsTx74AoHNKNNsmpT
	BtInCAvLiVRvqsavzg6q4+2iCQsyGnIGCRnmrACs701Iyus8lI9aNl/Hz5FoZWdJrUb
	W5T/FxIP84s1lFM3alWM9PYPOv5r8mY5JmapMqmM=
Received: from [10.10.10.3] (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 1644914989516543.9506762113273; Tue, 15 Feb 2022 00:49:49 -0800 (PST)
Message-ID: <d9240058-68b4-cbd6-54b0-18f41ee5a98a@arinc9.com>
Date: Tue, 15 Feb 2022 11:49:45 +0300
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
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <CAMhs-H-74bK3m975Dtmg2zPrGjmqzSd+Tb_qdUV14yJBAWRQbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hey Sergio,

On 15/02/2022 11:35, Sergio Paracuellos wrote:
> Hi Arinc,
> 
> On Tue, Feb 15, 2022 at 9:18 AM Arınç ÜNAL <arinc.unal@arinc9.com> wrote:
>>
>> GB-PC1 uses some of the rgmii2 pins (22 - 33) as GPIO. Therefore, the
>> rgmii2 bus cannot be used on this device.
>> Overwrite pinctrl-0 property under the ethernet node without rgmii2_pins on
>> the GB-PC1 devicetree.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>   drivers/staging/mt7621-dts/gbpc1.dts | 4 ++++
>>   1 file changed, 4 insertions(+)
> 
> No issues in GB-PC1. So:
> 
> Tested-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks for testing it so quickly!

I was wondering if you got pinctrl errors on the bootlog before applying 
this patch series.

rgmii2 pin group is given gpio function so calling it from ethernet node 
would cause this on my TP-Link RE650 v1 which also uses the rgmii2_pins 
as GPIO.

[    1.177349] rt2880-pinmux pinctrl: pin io22 already requested by 
pinctrl; cannot claim for 1e100000.ethernet
[    1.196966] rt2880-pinmux pinctrl: pin-22 (1e100000.ethernet) status -22
[    1.210312] rt2880-pinmux pinctrl: could not request pin 22 (io22) 
from group rgmii2  on device rt2880-pinmux
[    1.230058] mtk_soc_eth 1e100000.ethernet: Error applying setting, 
reverse things back
[    1.245853] mtk_soc_eth: probe of 1e100000.ethernet failed with error -22

Arınç
