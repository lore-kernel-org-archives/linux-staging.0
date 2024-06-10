Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C87B18C31
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 09:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718011212; cv=none; b=nPzGw/hXPNleoTKwGX+Kx/EM9QXCOtLXdvMvxcDwp+5veMNTstTCi03UhPfB7Xlt8LUc3VtQKD3Hh5tJ4sQvrk2gGi3ux1Lzjxks3g+t36O/rfqmVWuPVQSVVS0F1M6DPk/ZEPH9OuFSpLyEmedJsNizuvpbPDconkZra0AE/ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718011212; c=relaxed/simple;
	bh=db7HUaRQ0RsBOufcp3NSrxaTQlMF+XJ2RXlBoo6bv/U=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=ZTLs+nvs85JdxMBUexP+raWgPawSxdh5DX+mUOr2qmiS9Nf35+etIsay66ufWKzcAasGPImGPHuvj7gnQSVRvvRqtCcdABv5dRYGccpVgwoEBGB5YdoUAAfL3D4/lFD8KMedA8b5zQC/pV2iC3KRzz+v2XvC0C2oz41ywLhqtd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=KQvaG0Xs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GZqICvub; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="KQvaG0Xs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GZqICvub"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id C44591380172;
	Mon, 10 Jun 2024 05:20:08 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 10 Jun 2024 05:20:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1718011208; x=1718097608; bh=vS+z2PoXmA
	eDThmmxcYxDuh5kBNZp5X+04/PDK3xdTc=; b=KQvaG0XsFKgj2Ec4TKzpGROGIr
	9L2UqwRxyagIzzd9IYMnK19uOXaXG9Pq3Rs8lN3GeCBlvSTvQLQit2peaZcWuqYm
	d4bz1873kahpicrqWIOfOEkR0KQVhQC9uj7dRCzNVJe0QVqoHhYxG+DyVJgSm1w5
	KTRCNY/eVMMPnV7+vbwYMLH+C2IGvpQrJ67HQxC/+RyOpuG/VJOD9253aBSU0cs0
	NUagT+2CQqx+dy7iimcYwoTIHgM1BjVTfL+mzBQP4I3f7QzPBjjTqAmM4Nn6mH2a
	hFF1thOCdHTWBWLLins3mgSfsnNeh7J2X0x0bPcR8W/gOLduej7Ba/SWnrrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718011208; x=1718097608; bh=vS+z2PoXmAeDThmmxcYxDuh5kBNZ
	p5X+04/PDK3xdTc=; b=GZqICvubtG7KkHoXlBtkUpuUAJnffvD9Hw96Wa7fgYWF
	vCM8GRoYlpumhkt5CONPayM0bsQPbfkiVd1X8CqhwzgswZec9k+Zck7HOBm485gZ
	Qqh7lgbYlCRqOdg0NHw5blwCYEqE29nLhM0fUnvCHw8SvEUXF39rMAgaug3frayN
	s9ObkTpJN+rgwDe52Y4Fr3k8oYD6aWazGJjePNQO0TkN1GXYZryOg+G5bSTxeOfl
	TOD7evB7P7w3xzMttKH/vWQPAsmjVgnQAYUimUbaU0kSVwqkcImfLStGAc9cZpUJ
	Qn93W2uBmWuh6oG9jivlSc461IC5AedluNSCjCQNDQ==
X-ME-Sender: <xms:SMVmZt1Mxh1uE7-GFGxXDng_-fMhfq9FViWOMxqi_uSWewCEXA27Lw>
    <xme:SMVmZkFkL6CUecf4MJjSidxYB1giRSjgLUlvME8Pr3-BiweGtv8SB-iTA6nEURqMD
    mAec_jfsqy_gPl5gQ0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedutddgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:SMVmZt5tjImzvFRYKnO0iKdpkP4C_2uu8hiwUzdZq-lUywUh--gRBA>
    <xmx:SMVmZq2nC82qPyv20YcIAExFARJ1IFbgu7VrUjita5BV46Muf05SwQ>
    <xmx:SMVmZgGXW5z3QsBjTOp8chsVTpt8s9WmAJKjg6yRYeSB7tCebKVGuQ>
    <xmx:SMVmZr_NfHAv6bcbh9E-Dg9VaqXpm_pW0v55XIIySEyivsWThGUl2Q>
    <xmx:SMVmZo_rSccvBHwCDVK-inqPahZf2TxD0qkRbOfSQXLWHjwGSuCVujyt>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5C9F5B6008D; Mon, 10 Jun 2024 05:20:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-497-g97f96844c-fm-20240526.001-g97f96844
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <28495bd5-41af-41b8-b427-6b6fd36a2740@app.fastmail.com>
In-Reply-To: <20240610091534.GO18479@pendragon.ideasonboard.com>
References: <ad2b7034-ecc9-4d6e-844c-bfe32fb5b23c@gmx.net>
 <9d603d43-0f8a-4f9b-b11b-9e7543f421b9@app.fastmail.com>
 <CAMEGJJ3BqY9=9cq_JpKTVhyWKO50hcbEK0MXkBcYZwqadciGiA@mail.gmail.com>
 <72a414e4-4cd0-4b12-a662-cb73d1e3515e@app.fastmail.com>
 <20240610091534.GO18479@pendragon.ideasonboard.com>
Date: Mon, 10 Jun 2024 11:19:47 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "laurent.pinchart" <laurent.pinchart@ideasonboard.com>
Cc: "Phil Elwell" <phil@raspberrypi.com>, "Stefan Wahren" <wahrenst@gmx.net>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Christoph Hellwig" <hch@lst.de>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Robin Murphy" <robin.murphy@arm.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
 linux-staging@lists.linux.dev
Subject: Re: WARNING: drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:364
 vchiq_prepare_bulk_data
Content-Type: text/plain

On Mon, Jun 10, 2024, at 11:15, Laurent Pinchart wrote:
> On Mon, Jun 10, 2024 at 11:00:12AM +0200, Arnd Bergmann wrote:
>> On Mon, Jun 10, 2024, at 10:26, Phil Elwell wrote:
>> > On Mon, 10 Jun 2024 at 07:00, Arnd Bergmann <arnd@arndb.de> wrote:
>> >
>> > Why is swiotlb involved at all? The DMA controller on BCM2837 can
>> > access all RAM that is visible to the ARM cores.
>> 
>> When a device is not cache-coherent and the buffer is not
>> cache aligned, we now use swiotlb to avoid clobbering data
>> in the same cache line during DMA synchronization.
>> 
>> We used to rely on kmalloc() returning buffers that are
>> cacheline aligned, but that was very expensive.
>
> Could we reject buffers provided by userspace that are not
> cache-aligned ?

My guess is that this will likely break existing applications,
in which case we cannot.

It's probably a good idea to take a look at what buffers
are actually passed by userspace today. That would also
help decide how we allocate bounce buffers if we have to.
E.g. it's a big difference if the buffers are always
within a few bytes, kilobytes or megabytes.

     Arnd
