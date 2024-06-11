Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6531917C20A
	for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 12:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718108084; cv=none; b=czb9TIO+5oTqA/pcSTBT3nTSXLkkVR8zW0u3RhfFVqdwfKCr9X0ufJhA9rGnBg0abOhXimcpJ2Pc5Ikj1oZYfgz8sP55YmkxVzUmhteAXRVrdiAj98ykqv/gRhtSqrPapYaR2hm/4hwo/o4u0bIHcKrmGrfJTySUL+qtOL0hhKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718108084; c=relaxed/simple;
	bh=vEgt2gbTBG9hsNaqdbdxpd8QUY5/LRa2m+NXEeH23ac=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=LegOCempnClNyNLv8hZeHqS12JGezifq8qWC/BFA80m8TvU36BtgzxtGYdtdfWS+2qkw/rdOXoU6zqeAUuTZg0vZJmh2yoRjcGLmkPFyt3PYMGLXjmSvk2aGsnwsa5I1LdnBzdnfPSBsrhrita1+B471n7DkhhaIYzFXKUh9vZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=kXtxwATA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=j0y7dkLK; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="kXtxwATA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="j0y7dkLK"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 739EE1380224;
	Tue, 11 Jun 2024 08:14:41 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 11 Jun 2024 08:14:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718108081;
	 x=1718194481; bh=NZf/Q/oEIeZ3HdS+V7qGoE5X73uyJgk9mJAXyP/CEmY=; b=
	kXtxwATA+EjtOCXpGUNSDkWDmfAF4Ru6rU80x4YeSG0Cl7+DNnyqVliTQMSFlEcv
	CTJSa6S/8KtHsRLw3sixvhKjRCQwOj2VAjehCLxxMwE55KDRItTZYpBduUOanPan
	e+vx5SEEmOD9qAHJisysAKsfECBHUoueWTxcl81LiSXLPGBhQAUZ6Y/ZwxOasl/g
	8jIqk1Ya2IdpUp7a1KThU+XtjFQVCwdQuC2SrwUUMfvDgYMEoUyYHRuD1OMi1Q9V
	QRxqAgyDwHWZB2s7t6pLY/ayDf6jgnFpWdlgGnR7UyYlqtWVDdfwTN0dVS1v0bcL
	GjyfUcgbbs1Q8LzmBxiv3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718108081; x=
	1718194481; bh=NZf/Q/oEIeZ3HdS+V7qGoE5X73uyJgk9mJAXyP/CEmY=; b=j
	0y7dkLKOP1JRh7OYbItKdSJ0FBMo4d6WGqAYVhyfoCWFQe1j5A9nA36jK5YyI4Bg
	bvLQq97FR2cYTV899EpW+T1N6OzOIY6VwCH/CYA31IT6hQNzvPN73fM8p3gFKbjG
	AjDZlmwN+2pNQQKyOPqp8ighOyK1zWZ+ycE61h0JX/BY2pf18X63gmrlOiBRROEf
	ZulUSXnml27VnMJni67Hptpw5a57+jlSYEPb6KrA+mv4TBJbrwVte/6PpwFoIxJv
	ud83ASv7qg/+/EBzhbWoujgVl/066vxngx0BZCrAqvmquKR7SD87oQHyS2EsQP2t
	mlbTNWA4ziFa9Gk7KiCRA==
X-ME-Sender: <xms:sD9oZsDunCk3K2uGG_L9R2DJVJGu8lYdLWytmm5cBCyt6HB67netvQ>
    <xme:sD9oZuhDSJfhRcA4LarCzwkFKrlSpWxm5BrMBS2XzMf8Jte8XlIsR5tBuoCTXYi4y
    UrNX_cT5ycEd6x1xq8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduvddggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:sD9oZvmxBxglEJ0PmxRuZu1gt_jAovspkdotmgfLUhwtkCT5lD_Qpw>
    <xmx:sD9oZizpm2mrraRJoHE6MY8ujF5HipTej-nRkPB3E6DI84m2nZOAgg>
    <xmx:sD9oZhSUs2OjIURx11Uks6VzJ9kbMz-wOARYAL0iDIzmTiY9qoS_AQ>
    <xmx:sD9oZtag1iXsiWBWA5dHG82d8pcF54znWbfI3-y7Px8aGjPdo2DeZA>
    <xmx:sT9oZmJTN-HGdfmj6ENybTWSNW_hlHsg4WEGVLkX5Cf3s26_XlbyEA_7>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C0290B6008D; Tue, 11 Jun 2024 08:14:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-515-g87b2bad5a-fm-20240604.001-g87b2bad5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <87699d92-64f4-4b28-840e-8b320502acb2@app.fastmail.com>
In-Reply-To: <5113a1df-858b-4ba1-bd8b-c53c0313c7ce@gmx.net>
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
Date: Tue, 11 Jun 2024 14:14:20 +0200
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

On Tue, Jun 11, 2024, at 13:37, Stefan Wahren wrote:
> Am 11.06.24 um 13:08 schrieb Arnd Bergmann:
>> On Tue, Jun 11, 2024, at 12:47, Stefan Wahren wrote:

>
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 if (len =3D=3D 0)
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_warn_once=
("%s: sg_dma_len() =3D=3D 0\n", __func__);
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 else if (i && (i !=3D (dma_buff=
ers - 1)) && (len & ~PAGE_MASK))
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_warn_once=
("%s: following block not page aligned\n",
> __func__);
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 else if (i && (addr & ~PAGE_MAS=
K)) {
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_warn_once=
("%s: block %u, DMA address %pad doesn't align
> with PAGE_MASK 0x%lx\n", __func__, i, &addr, PAGE_MASK);
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_warn_once=
("sg_dma_is_swiotlb: %d, dma_flags: %x\n",
> sg_dma_is_swiotlb(sg), sg->dma_flags);
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_warn_once=
("type =3D %s\n", (type =3D=3D PAGELIST_WRITE) ?
> "PAGELIST_WRITE" : "PAGELIST_READ");
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (buf)
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 pr_warn_once("buf =3D %p, count =3D %zu\n", buf, count);
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 else
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 pr_warn_once("ubuf =3D %p, count =3D %zu\n", ubuf, count);
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 }
>
> Output:
>
> [=C2=A0=C2=A0 66.184030] create_pagelist: block 1, DMA address 0x00000=
000f5fc7800
> doesn't align with PAGE_MASK 0xfffffffffffff000
> [=C2=A0=C2=A0 66.184056] sg_dma_is_swiotlb: 0, dma_flags: 0
> [=C2=A0=C2=A0 66.184063] type =3D PAGELIST_READ
> [=C2=A0=C2=A0 66.184066] ubuf =3D 00000000266a70a7, count =3D 0

From my reading of the code, it's not really meant to handle
count=3D0, so maybe the answer for that is to just return an
error (or possibly success) when there is data attached to
the request from user space, something like

--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -328,6 +328,11 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_=
instance *instance,
                userdata =3D args->userdata;
        }
=20
+       if (!args->size) {
+               ret =3D 0;
+               goto out;
+       }
+
        status =3D vchiq_bulk_transfer(instance, args->handle, NULL, arg=
s->data, args->size,
                                     userdata, args->mode, dir);
=20
