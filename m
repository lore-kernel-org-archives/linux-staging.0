Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7044178CCF
	for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 13:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718111383; cv=none; b=RJumPHJ+T+B8re4Cw7gGtjqgj9oXQIKesnC9xvjh/NTGRR9OqEk0Vh4TE+dXyxOvRYd1DiVFmsZaaL4RPqEnQVMPfIuXvOWIcQY5CgyGfk2gtaZ6TmLXttmOhv2uZePPSNl28K/NvWtgRrDAjwnzUVUmgOkPPWsQpCBwW8LM2hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718111383; c=relaxed/simple;
	bh=htTChbBA+MmnKAZLP01j7mypZjo//LR/R+vYV9/UXIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iiv3AFH2vA6etarAkxn3DCNfCOJ9q2tbyMsOMkkv1j+hpj1frJqTbVtPLtvZ6aOYuCOnNSIH9CquCkbLoHymukkURTc6VE7BjfHQh5r0jPV3TYkr0HCK/gVT1vvFadtXVaYvHQSZXeHrezAq1LvLEcqlxJWUWXnZyVvuUsu1P+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Tgd735NJ; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Tgd735NJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718111360; x=1718716160; i=wahrenst@gmx.net;
	bh=C/qy24EZjE9bp21B10xy4RBhu0Qrn/97XJMgD57eTtg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Tgd735NJi2oyRwwJXelb0CLQWcbqwzEKCeZKVYwNz9WW3rK0hGq+0cAPOj63+q/L
	 uA/hj3KkgUgnGX4cJfnC89oNmSlPt/ZtVyvNNYrIEVR+zCILqtdO3esQYmXGu7cD2
	 B/LfVi0SIPvTeSpCj6dI1PLMpMEmAfjrz0KCSZUc1ZPm1ssEHtgiAuh2MhDIKuQdA
	 05asu36XLs4/Yh1knIpkRsTojI60I70PH4uJl6Zh7c5ru9nemYqDhJAAJMSM8/6p6
	 459UiJZkKVTCnxHLMGdukCquXVR2I4YRvG4rFaN50LeWBv2MBINlsZKxO2/3vfOQV
	 CmOyUD+QBvzRuyXbfw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mk0JM-1sfNea1KtE-00iqYX; Tue, 11
 Jun 2024 15:09:20 +0200
Message-ID: <66aafbbd-b90c-4ca6-80a7-233ec0f6dce6@gmx.net>
Date: Tue, 11 Jun 2024 15:09:19 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WARNING:
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:364
 vchiq_prepare_bulk_data
To: Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>,
 Phil Elwell <phil@raspberrypi.com>
Cc: "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-staging@lists.linux.dev
References: <ad2b7034-ecc9-4d6e-844c-bfe32fb5b23c@gmx.net>
 <9d603d43-0f8a-4f9b-b11b-9e7543f421b9@app.fastmail.com>
 <CAMEGJJ3BqY9=9cq_JpKTVhyWKO50hcbEK0MXkBcYZwqadciGiA@mail.gmail.com>
 <72a414e4-4cd0-4b12-a662-cb73d1e3515e@app.fastmail.com>
 <20240610091534.GO18479@pendragon.ideasonboard.com>
 <28495bd5-41af-41b8-b427-6b6fd36a2740@app.fastmail.com>
 <CAMEGJJ30ffMSd40YpqGuMWOeazoT+oiDvzkYEc37jOTx4fZBNg@mail.gmail.com>
 <04b1276d-4db3-41a5-9960-15e96b779b13@arm.com>
 <d6f28773-d408-425c-8347-d0dbf301aea6@gmx.net>
 <9c2917fa-d2ee-4d0b-b42a-a27191e93088@app.fastmail.com>
 <5113a1df-858b-4ba1-bd8b-c53c0313c7ce@gmx.net>
 <87699d92-64f4-4b28-840e-8b320502acb2@app.fastmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <87699d92-64f4-4b28-840e-8b320502acb2@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jHWAQYtLCQLOVZdlsRy0uhZJvvWE/49++jAL7WvO8MSeDxsURHB
 AfyCpn3rAQNmNv8lhBt47ha7zE6MEWM7mmXjs2BqjK6ZJBJ4Ch2C+JnJzKe8voqV1GpYQJn
 b1KBf+xdWDeaj/pQUrV1i6/doW7/zpTOg6I6zyclP1+b0fr6XKEed4zSDVqeXJVhsQed673
 JIo/3SvVso5JUzMI9mk/g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mf+h5EmeDQI=;Az2bjoFsAI5BsknuChA7ZRB5/ad
 jW58YdFAUxKI8vF581s3yPrRKvln42ybCE6gUGtUh6NeOjkPFEKaQ/FTTAoS4l4rf1PCpXJfi
 qDgrZtih9oIQbEYboXTxfRxn9UD4pYfpupLXNO7PgjIPyAIu0PuhomWMr4z+5lmOi46kZPPmy
 zzDu7EfqhQXRqaSXp/F+PCdUmD6zB61OFm7QTPf+cZGGo18Cb7khQBD1Uu2gMtWDGIWHQqNFs
 96I5ooA/7FwcZjT8eeEvVXP9pkROKAQn61DVSeWXhtwUh8G0oR/LUfPreERtfnM7ve0H3mmq3
 Y3z8t29nbmVKD5mlZqVZkAQKWoZAjDH86VdNFex/z3Yktp5S9mlST4eujUjX+RwEeD4wJ3AoU
 T/tj1rk0TwWy88RpPKzf+SvMn7YCOUE0voYKwXB/sdTDH9wWkH1LfHXkrqKCHRddQvs8gsgvv
 x9IW5P5n+1Tpu28NvrOSHzKGzXul1a2BLZ2vOWGRN+3NfD9leaG5Ff9hzk0+0Ynx2Pb5AsgVN
 +1tNnJsrJtwx43BRzuBGyGUnVtPh2RRJH/VeJT4iVZx+9JE/1r26toH9Zx0te94lR0VXkSh3A
 dYw2fw2U0/5jwAkbuwK5kupAh67vNSNE4JDCRBucDzTDG1aXt/9P2tyjbNchiBrgL8R2LTko8
 wZIh3LN4ROO1TO1WfCSi8urdOFqQ4xbr/IF+z+q+sOzoXude44F4yJLGA28RqTwzNyQfdLNJz
 FK/R1OOlJTaLSza4nBP3wBZhMD3BDF7DEipoz3oQZPasrDDm5fDItt0MvyER8BUQG0Rx3zUA/
 TKLoRW2e55d1yd4/uCNtomHgLUO+bJU3mLCkHqXcefHSc=

Hi Arnd,

Am 11.06.24 um 14:14 schrieb Arnd Bergmann:
> On Tue, Jun 11, 2024, at 13:37, Stefan Wahren wrote:
>> Am 11.06.24 um 13:08 schrieb Arnd Bergmann:
>>> On Tue, Jun 11, 2024, at 12:47, Stefan Wahren wrote:
>>   =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 if (len =3D=3D 0)
>>   =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_warn_once=
("%s: sg_dma_len() =3D=3D 0\n", __func__);
>>   =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 else if (i && (i !=3D (dma_buff=
ers - 1)) && (len & ~PAGE_MASK))
>>   =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_warn_once=
("%s: following block not page aligned\n",
>> __func__);
>>   =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 else if (i && (addr & ~PAGE_MAS=
K)) {
>>   =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_warn_once=
("%s: block %u, DMA address %pad doesn't align
>> with PAGE_MASK 0x%lx\n", __func__, i, &addr, PAGE_MASK);
>>   =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_warn_once=
("sg_dma_is_swiotlb: %d, dma_flags: %x\n",
>> sg_dma_is_swiotlb(sg), sg->dma_flags);
>>   =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_warn_once=
("type =3D %s\n", (type =3D=3D PAGELIST_WRITE) ?
>> "PAGELIST_WRITE" : "PAGELIST_READ");
>>   =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (buf)
>>   =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 pr_warn_once("buf =3D %p, count =3D %zu\n", buf, count);
>>   =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 else
>>   =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 pr_warn_once("ubuf =3D %p, count =3D %zu\n", ubuf, count);
>>   =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>> Output:
>>
>> [=C2=A0=C2=A0 66.184030] create_pagelist: block 1, DMA address 0x000000=
00f5fc7800
>> doesn't align with PAGE_MASK 0xfffffffffffff000
>> [=C2=A0=C2=A0 66.184056] sg_dma_is_swiotlb: 0, dma_flags: 0
>> [=C2=A0=C2=A0 66.184063] type =3D PAGELIST_READ
>> [=C2=A0=C2=A0 66.184066] ubuf =3D 00000000266a70a7, count =3D 0
sorry my debug attempt for count was pointless. The value is always
decremented to zero at this point. So your suggested change won't have
any effect.
>  From my reading of the code, it's not really meant to handle
> count=3D0, so maybe the answer for that is to just return an
> error (or possibly success) when there is data attached to
> the request from user space, something like
>
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
> @@ -328,6 +328,11 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_=
instance *instance,
>                  userdata =3D args->userdata;
>          }
>
> +       if (!args->size) {
> +               ret =3D 0;
> +               goto out;
> +       }
> +
>          status =3D vchiq_bulk_transfer(instance, args->handle, NULL, ar=
gs->data, args->size,
>                                       userdata, args->mode, dir);
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

