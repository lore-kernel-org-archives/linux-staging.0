Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855F9174EC1
	for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 10:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718102880; cv=none; b=pDvkgW73FnvuC9DuXMBqzqzWAKR3RjhyoJYRSJHSFi0ZHwSsyr5PG2CcaeaoFhI+WOSkndBYSIWPoieqGOAo8qMqOq3O6/aYAoXAcfNJ/kDBLUWkjez5lCAaQg4EMkWxaG0e5jOefgJG+gpg62KP95KDbBi4zRtQClT+81x0WiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718102880; c=relaxed/simple;
	bh=4DMiqBeKrfEVSsEGDgYXgvD7XFxUK2YqmfqyXFVikQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rDIR4w6ZDu2jd5m5fsTgXB0+BIIw9IBgJVb8OxqM6f906bBQTaDUVRagPeME4+IcwaSmyZQN9i/+p6lNMqZLOtFhpepux8BVSkdYI+19i4cBMNPGKA870s+4XvuA4wqRrzH32f+OkDF+O7XTAf4TcYcHmLtb9KalAHp7x7c4Ulw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Atkyk6Be; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Atkyk6Be"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718102859; x=1718707659; i=wahrenst@gmx.net;
	bh=4DMiqBeKrfEVSsEGDgYXgvD7XFxUK2YqmfqyXFVikQ8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Atkyk6BeLpGhhV6mb0Yc3X6c44c/vyDVSFVNfKzk4O4kjaJ3qCAa2He85vXY6l5W
	 9/wYcdkSsV16VXIRDr6MLE0BQUKtsJ2ri8AyrNx12ecgW13CkQ7H+5NCmePfiB0L4
	 0M0QGQWOYZnT5rS2W7oDy1z4Qp5pSts0OQ14Y+DCuo811Z6+zBGGL8WRkMfb1VfgU
	 A3U6IIFdLr2wFYG4bIzkUxo3wWvH1BRs7ONU0qekj1tDCmrZ3WCQpGeKBwXeMSUme
	 T+/tLkbiUyrsBGiR7lz0Ngf+TbDc6BPEu1UDIurZN3/mGzIeZBvuz2J01624/zFEp
	 /TLXRyZvvYTwFUOXWg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MN5eX-1s0pbC16Pd-00Y2Vh; Tue, 11
 Jun 2024 12:47:39 +0200
Message-ID: <d6f28773-d408-425c-8347-d0dbf301aea6@gmx.net>
Date: Tue, 11 Jun 2024 12:47:37 +0200
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
To: Robin Murphy <robin.murphy@arm.com>, Phil Elwell <phil@raspberrypi.com>,
 Arnd Bergmann <arnd@arndb.de>
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
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <04b1276d-4db3-41a5-9960-15e96b779b13@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6f99WbCfNfWkrxS+CsuNEpqorlQlaX4CEsSu/dv3Pq9N7ll+PnK
 2cj4bgF+kAeB38StL/nqTB9nzue6ykrSBf4TIhF12RsCIYVkDN/4CXAa2YOMg6V4D43oKCC
 4UTf/eeZdirwK9FZmRDT/Zp7PDBzmGRbiwZsdFGJAFXGIAIfsb6wOBUwBW68xita9T96RZD
 g7gjjZIaPYbo0G2JHU2CA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OG5HhYd5dlg=;UqH0xxeRmGY4TWGaTVfYpoaBf5x
 +mRXjG9vEvLJgj6DRypsfDPEN/yEoHa4tl6wpdsgIG0JoZGgJBM5IyBVuGOaLh5AkFKRmUeRP
 KURpK/Vqtnt18orpzJegisCZwPBTxE46dWBJIsV5AbPryw3pcQ7cPUez+jCrbSE12uejFicbt
 6mhdk4pbeV017dtO9ZSojgk4Yi/F+DhVhu6fsGRP26ATnQxETEwogRdkBKVwx9QaEJbU7cuxf
 GAv9XJVf2q+EA7fM7KOENDZtG0kcoFLqPeaxaibLglNqEIhmvZivbVvR+riRIuVrj5Rkvmo0A
 WCgFS5bGkH+BvP3fSokyWvWrUS30wSfF+ZOKTqyla3pDhP8Ru6IE0lrihqzU3S29kstXu7DTC
 ER8efYnjNFUw2Em/ZY5hRbGEwr47bkSJtZGE+N8lvXwWQ1G1lOYbRHlCqFfn2A9dQxeTyATQk
 QrPcRPMb/GBjqvxvh/yI6Ueky2wciX+XzyJA3/IK+gMl37OCRJkRLQD1N+VNjFjugz2pVcr0D
 0dW1YLIVOSKKAkpAPYM4Esx9rHj5oqfMzts4pk4HZXj4csHGqDj/hB9Lk7+DgW7zgFeqqsNAg
 caSKNsi9PPffyZpuqx4jOVqg4poGsVGQ/i5iixU0Gk/1yNjG2DNhxu5e4I1YykELSaSSd2ZjD
 hSTEJlE5hXgbCUiSx2h7NOIiprEy46ZymnAeiuuKsqk+1pKF1VACaOPt1V06GE7g36GyBCXTT
 YrfhLcSpGP5Ycl/qDMpGyvt7yKRi1jgSh0BxHqJQ+OHp1x8XKl6mayR66GX3I83xIqwJ5L6SY
 OI5sYoLI0Od3rqpEi9ck6c+Pp3QGzyT2EQTMg7+TyJQwc=

Hi,

Am 10.06.24 um 12:25 schrieb Robin Murphy:
> On 2024-06-10 10:24 am, Phil Elwell wrote:
>> On Mon, 10 Jun 2024 at 10:20, Arnd Bergmann <arnd@arndb.de> wrote:
>>>
>>> On Mon, Jun 10, 2024, at 11:15, Laurent Pinchart wrote:
>>>> On Mon, Jun 10, 2024 at 11:00:12AM +0200, Arnd Bergmann wrote:
>>>>> On Mon, Jun 10, 2024, at 10:26, Phil Elwell wrote:
>>>>>> On Mon, 10 Jun 2024 at 07:00, Arnd Bergmann <arnd@arndb.de> wrote:
>>>>>>
>>>>>> Why is swiotlb involved at all? The DMA controller on BCM2837 can
>>>>>> access all RAM that is visible to the ARM cores.
>>>>>
>>>>> When a device is not cache-coherent and the buffer is not
>>>>> cache aligned, we now use swiotlb to avoid clobbering data
>>>>> in the same cache line during DMA synchronization.
>>>>>
>>>>> We used to rely on kmalloc() returning buffers that are
>>>>> cacheline aligned, but that was very expensive.
>>>>
>>>> Could we reject buffers provided by userspace that are not
>>>> cache-aligned ?
>>>
>>> My guess is that this will likely break existing applications,
>>> in which case we cannot.
>>>
>>> It's probably a good idea to take a look at what buffers
>>> are actually passed by userspace today. That would also
>>> help decide how we allocate bounce buffers if we have to.
>>> E.g. it's a big difference if the buffers are always
>>> within a few bytes, kilobytes or megabytes.
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Arnd
>>
>> vchiq sends partial cache lines at the start and of reads (as seen
>> from the ARM host) out of band, so the only misaligned DMA transfers
>> should be from ARM to VPU. This should not require a bounce buffer.
>
> Hmm, indeed the dma_kmalloc_safe() takes into account that unaligned
> DMA_TO_DEVICE does not need bouncing, so it would suggest that
> something's off in what vchiq is asking for.
I'm available to debug this further, but i need more guidance here.

At least i extend the output for the error case:

-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 WARN_ON(len =3D=3D 0);
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 WARN_ON(i && (i !=3D (dma_buffers - 1)) && (len &
~PAGE_MASK));
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 WARN_ON(i && (addr & ~PAGE_MASK));
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (len =3D=3D 0)
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn_once(=
"%s: sg_dma_len() =3D=3D 0\n", __func__);
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 else if (i && (i !=3D (dma_buffers - 1)) && (len &
~PAGE_MASK))
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn_once(=
"%s: following block not page
aligned\n", __func__);
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 else if (i && (addr & ~PAGE_MASK)) {
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn_once(=
"%s: block %u, DMA address %pad
doesn't align with PAGE_MASK 0x%lx\n", __func__, i, &addr, PAGE_MASK);
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn_once(=
"sg_dma_is_swiotlb: %d, dma_flags:
%x\n", sg_dma_is_swiotlb(sg), sg->dma_flags);
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 }

Example result:

[=C2=A0=C2=A0 84.180527] create_pagelist: block 1, DMA address 0x00000000f=
5f74800
doesn't align with PAGE_MASK 0xfffffffffffff000
[=C2=A0=C2=A0 84.180553] sg_dma_is_swiotlb: 0, dma_flags: 0

Is this helpful?

>
> Thanks,
> Robin.

