Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FC117B432
	for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 11:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718105854; cv=none; b=W4dtsFJ+BSLbjeTYv3gaZhu9EEqM8gAhE1smq2RkPv9HNGcL7UwE/mzx9TiarIUOWNmpKYO02x5U9Jvjo5CZbI9edMb95eGNF8znAh/JHxDEMypqyrX+SPokFq4XCPHhDzzwO35m80Po7QNuMSqMnKtuYUdL/tO4XTvk7ZNbh5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718105854; c=relaxed/simple;
	bh=GO5l89q76n/rNWpS2cjpeqFKmk/GogYnz/FShkARY3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WuWHGA+md6PMZ811GQrF/AN9jVPtcCyKgl0YwyZT3jUsdtIQSP9mln2+9jrDorHxuSfXpnz7rhUA8Y6B0RS+k0xkfa/BSZGSzJpRtSMzedOz9p32v/s7Hwlp7Y9KejRMI+3pUlgXWVuJqDb9Nos7rOGF8ybHQvPEwug1Jq6I1DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=PWQYBuAu; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="PWQYBuAu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718105833; x=1718710633; i=wahrenst@gmx.net;
	bh=/y4LOIbqJknGYrEqai3bj3a+bvpQwJch5QZ8FP6BkIE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=PWQYBuAu656o40R36xzYUuKrVxF/iN/uNp/b5uTnFiYzf14jcYyf3eP+hyMOfj/Q
	 ifz+6XoYhWfepm6BbNj+IEEf7zQ/TR+nR8OjPZ0WTT1eypIO5r3nGshzNIitzPCi0
	 hr9JFNg89dLGC7MmWUbbNQs+xyaDYog6VL3U3LGOftluTOXpGATu+Slj9WUuu3tB/
	 HI4EY/C8V+eeMRYY8ii1q5dREKlTS0VR1d9BY90tpY65sQNMoTJMOkwLOe9OrEEJd
	 K9vjLaCj9+cqSLFxZ9HI+/EzZSp47I6+/7s2r9vcP1DCFXehyo5HsCHnG/2QOnWsu
	 ahrE5DGJ7aerxXYwMQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MaJ81-1rwNzQ001t-00YqJU; Tue, 11
 Jun 2024 13:37:13 +0200
Message-ID: <5113a1df-858b-4ba1-bd8b-c53c0313c7ce@gmx.net>
Date: Tue, 11 Jun 2024 13:37:11 +0200
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
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <9c2917fa-d2ee-4d0b-b42a-a27191e93088@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:12Du+PSsIQ00+4uM9IFU/tzimupZlza4P7X7eX9Ya1ZBgF9Su05
 YQqqnqPNDlFb8O2QusjJSbmOwRSCoS91kNRgjLjHWMJ+dYEkd9C+Ol5wl+rFv8BH8VvQHmB
 nIvc/5Ej+9mOD3wXIp6F+pyQAA7kUUnstV4mDX1l8W5KNEI+dT3KbZ1Xq+nfoP0aHh77dEK
 bxDeV4WYtn0LzDsdody6w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:i+kme520yok=;EmFqcVoKOx2ZBl2QTRA4BzF2LJU
 /cT14DzpbM3k8W/z5SPS0kAHaWI7pDZ0SvrtLr41hBTySJZnAZBHkNnLQlWH15H4LBZ/0j1Vm
 HYVocYfVz3u8GvDPiSx5fThl0uIJOMRQobuZSNMvHvDFcntSI4W0r5YTFUbt6diL5G0ncPjQh
 GFIE6VvHcCmZVKGlSIH9selJLYZ3FP/aQJl4AQEtUhIdRealPoVD30ZWuZzqe58paK63Jrdsn
 h32X3+NQolXooQPJ4rQ+98yT/65l7YXDQtlq/yc1L5UghDqyUFrBF/5mMxEh7J9vJ/c0aKvWM
 MKYnZxsmRQNnc6lb9w1a9FWBoQN4ZcCN+ZCAeL95TJMKTIT1K15UTG/J+1PwKmnVEuCb8zHKS
 jcqZqi6HsHOys7Uinpa5c1+f0XU3NfSIzWWh1EzSgdAXyIKZWxqc8jfb0hdHpVO+9IuDltiHT
 8Bs82UKPR07yKuJynMPxMnZS5f0Gv0vv/+3qkbpsA3fBCKjQBVD7KIndAe4zfhrXvCAu4iS05
 AaCDGvHuTHMRVyCCqC+yvD/0hucDl/B2oJQ8eYoppoSw4pEbvj9ZbGMLPtcrUrx62f7J1QCjV
 Uq9b9Gj3nbZM2L3SBT4Jk3CG2+FXf9TeSW1456fZhqNOKngDpHPhpIvDcAaxsh48e46BfGcgB
 wWr50y0NYImRRGtp1b6L1evhAQjjuFJ5/6zXCbawoUZX/s//UyMaICKtqWrq5Ppc3kUDQt5jM
 Qz5WOZwCExOZfesOpnruT3imvRuQ/Uw2A0/wWR15zkdZd1px5R0pdihxleb5IA9nBzli98bJR
 v/sFVsp1nWcxvHvahyEGbyNpObzPaP0NlRucp0V3WruU4=

Am 11.06.24 um 13:08 schrieb Arnd Bergmann:
> On Tue, Jun 11, 2024, at 12:47, Stefan Wahren wrote:
>> Am 10.06.24 um 12:25 schrieb Robin Murphy:
>>> On 2024-06-10 10:24 am, Phil Elwell wrote:
>>>> On Mon, 10 Jun 2024 at 10:20, Arnd Bergmann <arnd@arndb.de> wrote:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Arnd
>>>> vchiq sends partial cache lines at the start and of reads (as seen
>>>> from the ARM host) out of band, so the only misaligned DMA transfers
>>>> should be from ARM to VPU. This should not require a bounce buffer.
>>> Hmm, indeed the dma_kmalloc_safe() takes into account that unaligned
>>> DMA_TO_DEVICE does not need bouncing, so it would suggest that
>>> something's off in what vchiq is asking for.
>> I'm available to debug this further, but i need more guidance here.
>>
>> At least i extend the output for the error case:
>>
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 WARN_ON(len =3D=3D 0);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 WARN_ON(i && (i !=3D (dma_buffers - 1)) && (len &
>> ~PAGE_MASK));
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 WARN_ON(i && (addr & ~PAGE_MASK));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (len =3D=3D 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn_on=
ce("%s: sg_dma_len() =3D=3D 0\n", __func__);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 else if (i && (i !=3D (dma_buffers - 1)) && (len &
>> ~PAGE_MASK))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn_on=
ce("%s: following block not page
>> aligned\n", __func__);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 else if (i && (addr & ~PAGE_MASK)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn_on=
ce("%s: block %u, DMA address %pad
>> doesn't align with PAGE_MASK 0x%lx\n", __func__, i, &addr, PAGE_MASK);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn_on=
ce("sg_dma_is_swiotlb: %d, dma_flags:
>> %x\n", sg_dma_is_swiotlb(sg), sg->dma_flags);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 }
>>
>> Example result:
>>
>> [=C2=A0=C2=A0 84.180527] create_pagelist: block 1, DMA address 0x000000=
00f5f74800
>> doesn't align with PAGE_MASK 0xfffffffffffff000
>> [=C2=A0=C2=A0 84.180553] sg_dma_is_swiotlb: 0, dma_flags: 0
>>
>> Is this helpful?
> It's interesting that this does not have the SG_DMA_SWIOTLB
> flag set, as the theory so far was that an unaligned
> user address is what caused this to bounce.
>
> I think the most helpful bit of information that is
> currently missing is the 'ubuf' and 'count' arguments
> that got passed down from userspace into create_pagelist(),
> to see what alignment they have in the failure case.
Here is my attempt:

 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 if (len =3D=3D 0)
 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_warn_once("%s=
: sg_dma_len() =3D=3D 0\n", __func__);
 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 else if (i && (i !=3D (dma_buffers =
- 1)) && (len & ~PAGE_MASK))
 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_warn_once("%s=
: following block not page aligned\n",
__func__);
 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 else if (i && (addr & ~PAGE_MASK)) =
{
 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_warn_once("%s=
: block %u, DMA address %pad doesn't align
with PAGE_MASK 0x%lx\n", __func__, i, &addr, PAGE_MASK);
 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_warn_once("sg=
_dma_is_swiotlb: %d, dma_flags: %x\n",
sg_dma_is_swiotlb(sg), sg->dma_flags);
 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_warn_once("ty=
pe =3D %s\n", (type =3D=3D PAGELIST_WRITE) ?
"PAGELIST_WRITE" : "PAGELIST_READ");
 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (buf)
 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 pr_warn_once("buf =3D %p, count =3D %zu\n", buf, count);
 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 else
 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 pr_warn_once("ubuf =3D %p, count =3D %zu\n", ubuf, count);
 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 }

Output:

[=C2=A0=C2=A0 66.184030] create_pagelist: block 1, DMA address 0x00000000f=
5fc7800
doesn't align with PAGE_MASK 0xfffffffffffff000
[=C2=A0=C2=A0 66.184056] sg_dma_is_swiotlb: 0, dma_flags: 0
[=C2=A0=C2=A0 66.184063] type =3D PAGELIST_READ
[=C2=A0=C2=A0 66.184066] ubuf =3D 00000000266a70a7, count =3D 0
>
>       Arnd

