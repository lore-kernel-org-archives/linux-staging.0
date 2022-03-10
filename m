Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CCC7A
	for <linux-staging@lists.linux.dev>; Thu, 10 Mar 2022 12:23:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1646915005; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GkAoB7r9c7s7UiESKL9s+dnfNw0xeqkJVOi3vZrkYIUvh0V3eKEcZkB9pNpq7qkpYQbg0x78Wn4EjOXAtB4TDlGo1XsStdPPIixHLbB0cQ3Kdu9lw5IJIOi0d3zeMdRpIQxDr3e6EAkAJ7eQDWIps+nQYg5JXxPCZTt6KEgUcmw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1646915005; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=3KM4D79OlValPnnS0apkwERbdPwnv53R+zslHeClcd8=; 
	b=bMxA9WVd3I0VZ2OQumflcPm78e2rCjIzVbBoqT5mRtLlGaiitlwXo5Lf2AGY8uYOBFOEvl29P+vwwLJEua9K6I3QTRwaznNaBVF0FbIRfzFFHI8lYX6+K1NBLA7mh8M6+vaoL8hUybTE02Ra7yDZoix1BlGXQK0i1qf2WLneTnU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1646915005;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=3KM4D79OlValPnnS0apkwERbdPwnv53R+zslHeClcd8=;
	b=dUpUPy9Jcbi3+at1DtcIpE9nZsO5LV6bX3C4LMPMu9xfVMS9v/2hnFMn/aJpBUYV
	ybCCci7pwrpYFwVraOKCB3dtZTt9/Jwu6GUxnqFoNq4o/Kbbwk/MMcNUh7C60cg1aVt
	IKfv0iinFL4SyG1Lzj2/mExAgRLZRJV1oCRMmku8=
Received: from [10.10.10.3] (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 1646915003515915.3429061838422; Thu, 10 Mar 2022 04:23:23 -0800 (PST)
Message-ID: <49f5cd24-62db-0d5d-bdf5-da23cb85befd@arinc9.com>
Date: Thu, 10 Mar 2022 15:23:20 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/2] staging: mt7621-dts: fix GB-PC2 devicetree
Content-Language: en-US
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, NeilBrown <neil@brown.name>,
 erkin.bozoglu@xeront.com, linux-staging@lists.linux.dev
References: <20220310113939.6601-1-arinc.unal@arinc9.com>
 <20220310113939.6601-2-arinc.unal@arinc9.com>
 <CAMhs-H-pUWadNi7ZhuVEh2uhvqkUJNmsS=uYZQi8yNoFTch3MQ@mail.gmail.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <CAMhs-H-pUWadNi7ZhuVEh2uhvqkUJNmsS=uYZQi8yNoFTch3MQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi Sergio,

On 10/03/2022 14:50, Sergio Paracuellos wrote:
> Hi Arinc,
> 
> Overall it looks good. See below my concerns.
> 
> On Thu, Mar 10, 2022 at 12:41 PM Arınç ÜNAL <arinc.unal@arinc9.com> wrote:
>>
>> Fix the GB-PC2 devicetree. Refer to the schematics of the device for more
>> information.
>>
>> GB-PC2 devicetree fixes:
>> - Include mt7621.dtsi instead of gbpc1.dts. Add the missing definitions.
> 
> There are pretty much the same definitions. Should we really include
> mt7621 instead of gbpc1??

The DeviceTree Specification states that the name of include files 
should end with “.dtsi”.

On top of that, we'd have to overwrite ethernet node's pinctrl-0 
property again since we use a different value for GB-PC2 than GB-PC1.

Not to mention, GB-PC2 does not need gpio-leds node.

> 
>> - Remove gpio-leds node as the system LED is not wired to anywhere on
>> the board and the power LED is directly wired to GND.
>> - Remove uart3 pin group from gpio-pinmux node as it's not used as GPIO.
>> - Use reg 7 for the external phy to be on par with
>> Documentation/devicetree/bindings/net/dsa/mt7530.txt.
>>
>> Link: https://github.com/ngiger/GnuBee_Docs/blob/master/GB-PCx/Documents/GB-PC2_V1.1_schematic.pdf
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>   drivers/staging/mt7621-dts/gbpc2.dts | 107 +++++++++++++++++++++++++--
>>   1 file changed, 100 insertions(+), 7 deletions(-)
> 
> In any case, as I have said, looks good:
> 
> Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> 
> Thanks,
>      Sergio Paracuellos
