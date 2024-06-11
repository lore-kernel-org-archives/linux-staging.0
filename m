Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562C8172BCC
	for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 11:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718104154; cv=none; b=tE6G20L6llUawXNkPdqB9f5Gpo193wfCFUVVKVIIaWEKSy8hz+kHQYt5yYygOCfqTZV5mdzLp9OKBHNuhtSU9kvOnjDv9GiZkb8DUZxiyDeRjwT+7LeuybN6V67/a1/kjWW04GsE5OAdkD9/jJbiVy3hNPpaFrvb5uHZfGxiIXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718104154; c=relaxed/simple;
	bh=td4Vb3rpAL6UVJ4PGoOi9sYzqcGMqI148sv81YBqMSU=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=lJfQmP165WqmlC39z3LtgOg3vviMZykosYZVYs89i8/8G3DYCeUrasL20uloYhyksbYw9/e6wKadrZYjZhas4e648i8/f9M1XdUXHMefquUzmfoeSxX+H8VJhNC/q3hbke9hswHH9QbATFuxyN9/qjzEpfWPHZR6MrDboLoAb8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Pwpa1wh3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mnXzRT/4; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Pwpa1wh3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mnXzRT/4"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 6A07B138018A;
	Tue, 11 Jun 2024 07:09:11 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 11 Jun 2024 07:09:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718104151;
	 x=1718190551; bh=gGjiqGeOmyQfnome5qrtsXwWtdFVp95cZbiUe1vn0Zw=; b=
	Pwpa1wh3yYUcT39sfGkLv41BO5dUIK7jOEtBI5eNS2MJQrKKTxUQe3xV8jPHdMSu
	h2Nr+h1H9hOmEmbADYefRKpjZCmZBKd05/qcOGC15huIcyjY79232tXRImmr3mmH
	ozJ5KOemLgrEWfcyOdsbpVqiuzaljyJ+pZGtLoWL4grrQZkBUFIdSZ0Xi/837siF
	ojzwwnQsZuDOPhtQuj0/TQlHklclkytRyo3QfFeMCncvDrKik7eMDwkccFdeUx7j
	ZdlOCzhPWmrllHcatS4c9qOCyNMXr9WrTDjh2J0nCB3Mzm8Gz2S/kiQqcZRsVHES
	lO6aKMXFxCPh/YxRkaDQyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718104151; x=
	1718190551; bh=gGjiqGeOmyQfnome5qrtsXwWtdFVp95cZbiUe1vn0Zw=; b=m
	nXzRT/4AGts2bE4o7MCDSyfYcLuscQqCShAWgpkg/XK+UpOTzD85MXM2BLqGrvvM
	Of/SllN/hYNdHWw8l767yz2sQo2FkugERAZenaInuwuGrPptKcug908cxk2UdLIQ
	BaViD9aW/yy9I/uK3dA+VGZraYtrJfPMSDhw0crHI1E7+wVnej7P7b4/7rxUZ16G
	1IO/jGvxhdJWQLtKoUJ/j4Yq2lzeB4fZqWRkaUDKicDLrKMFvC/Gin7PIF+M6zwW
	Q3Esu4PqMIlfL+OS49vHCX7otqN0t/QZgDj9eoLIHtDQQgKDYr7eWA2AiW2FVN0P
	BGCvXhZRHcCZPKwtMheWQ==
X-ME-Sender: <xms:VjBoZlCHqCMs7srfolwbusQt8diA6ekEOh1G8vobFqp5Hf2QSxdmxA>
    <xme:VjBoZjiZCf7Qq9IvZ3CvWbcMLgpR9CRFdXy7OVpQzwtaMnGAtCWeh0M1Bu31aB7AZ
    PdrsG87LpBe5Wo-GMc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduvddgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:VjBoZgnlvpC77b67dMx_db8mBvGaIKSBO2TDxWFC8S05eh3MXV_K4Q>
    <xmx:VjBoZvwGPVqMXh4uOOE7PSr7A1c21XCx0b7vJHKLQNHHbuebfPoclA>
    <xmx:VjBoZqQl1nThNusPMWzyFiyjMYWynm_9_6Bi-rJIp93walzX_ySVtQ>
    <xmx:VjBoZib7FZHt_LzOh1cV5Y4agX47jtBZex3tJdHCzXzAHC8CVhQ7vQ>
    <xmx:VzBoZvJoYXV-hpRt21mNW5p-LfS6vdmPuLkejuO98ocYpfmVGuKQj7C6>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C14AFB6008D; Tue, 11 Jun 2024 07:09:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-515-g87b2bad5a-fm-20240604.001-g87b2bad5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <9c2917fa-d2ee-4d0b-b42a-a27191e93088@app.fastmail.com>
In-Reply-To: <d6f28773-d408-425c-8347-d0dbf301aea6@gmx.net>
References: <ad2b7034-ecc9-4d6e-844c-bfe32fb5b23c@gmx.net>
 <9d603d43-0f8a-4f9b-b11b-9e7543f421b9@app.fastmail.com>
 <CAMEGJJ3BqY9=9cq_JpKTVhyWKO50hcbEK0MXkBcYZwqadciGiA@mail.gmail.com>
 <72a414e4-4cd0-4b12-a662-cb73d1e3515e@app.fastmail.com>
 <20240610091534.GO18479@pendragon.ideasonboard.com>
 <28495bd5-41af-41b8-b427-6b6fd36a2740@app.fastmail.com>
 <CAMEGJJ30ffMSd40YpqGuMWOeazoT+oiDvzkYEc37jOTx4fZBNg@mail.gmail.com>
 <04b1276d-4db3-41a5-9960-15e96b779b13@arm.com>
 <d6f28773-d408-425c-8347-d0dbf301aea6@gmx.net>
Date: Tue, 11 Jun 2024 13:08:50 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stefan Wahren" <wahrenst@gmx.net>, "Robin Murphy" <robin.murphy@arm.com>,
 "Phil Elwell" <phil@raspberrypi.com>
Cc: "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Christoph Hellwig" <hch@lst.de>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
 linux-staging@lists.linux.dev
Subject: Re: WARNING: drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:364
 vchiq_prepare_bulk_data
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024, at 12:47, Stefan Wahren wrote:
> Am 10.06.24 um 12:25 schrieb Robin Murphy:
>> On 2024-06-10 10:24 am, Phil Elwell wrote:
>>> On Mon, 10 Jun 2024 at 10:20, Arnd Bergmann <arnd@arndb.de> wrote:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Arnd
>>>
>>> vchiq sends partial cache lines at the start and of reads (as seen
>>> from the ARM host) out of band, so the only misaligned DMA transfers
>>> should be from ARM to VPU. This should not require a bounce buffer.
>>
>> Hmm, indeed the dma_kmalloc_safe() takes into account that unaligned
>> DMA_TO_DEVICE does not need bouncing, so it would suggest that
>> something's off in what vchiq is asking for.
> I'm available to debug this further, but i need more guidance here.
>
> At least i extend the output for the error case:
>
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 WARN_ON(len =3D=3D 0);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 WARN_ON(i && (i !=3D (dma_buffers - 1)) && (len &
> ~PAGE_MASK));
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 WARN_ON(i && (addr & ~PAGE_MASK));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (len =3D=3D 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn_=
once("%s: sg_dma_len() =3D=3D 0\n", __func__);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 else if (i && (i !=3D (dma_buffers - 1)) && (len &
> ~PAGE_MASK))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn_=
once("%s: following block not page
> aligned\n", __func__);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 else if (i && (addr & ~PAGE_MASK)) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn_=
once("%s: block %u, DMA address %pad
> doesn't align with PAGE_MASK 0x%lx\n", __func__, i, &addr, PAGE_MASK);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn_=
once("sg_dma_is_swiotlb: %d, dma_flags:
> %x\n", sg_dma_is_swiotlb(sg), sg->dma_flags);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 }
>
> Example result:
>
> [=C2=A0=C2=A0 84.180527] create_pagelist: block 1, DMA address 0x00000=
000f5f74800
> doesn't align with PAGE_MASK 0xfffffffffffff000
> [=C2=A0=C2=A0 84.180553] sg_dma_is_swiotlb: 0, dma_flags: 0
>
> Is this helpful?

It's interesting that this does not have the SG_DMA_SWIOTLB
flag set, as the theory so far was that an unaligned
user address is what caused this to bounce.

I think the most helpful bit of information that is
currently missing is the 'ubuf' and 'count' arguments
that got passed down from userspace into create_pagelist(),
to see what alignment they have in the failure case.

     Arnd
