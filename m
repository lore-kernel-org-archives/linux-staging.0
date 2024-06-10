Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A2E74065
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 09:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718010038; cv=none; b=FTJXpe/oiQ5O52QT1bajjwb0V9xpfdTgTut3qE03wp42q1pC2DqRI0L93tUM6aMzCaM0rXIGIsuVRn8UrE8oxoqOnUoa88/TktpuHaDW/lmzRud1C+wnHNUicJc9g0qDCUgxXM16z9XIGVMtEZ2VfeobjAT9zFbBUffWmKgx0JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718010038; c=relaxed/simple;
	bh=5tICRiKppDEyTw8AXLRwlaYgG9WLu4LfuASavDVayow=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=hXe7hGq/QrnRAYhY9KpQduaOtQdrnFpaQy/AeoY2UkCdy+IgXEB6h/FwfcK3kzk8uXmbupobt+v7/BcXAoV+bIsoWFVozF5r33V8NJhWGcR5UmIiXT9QKn/1Y6/ilhajRXHNyRraFH2JTiWTBaOyXC9xc987/ZcjKapp6P9qQoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=yEL/RvM2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EOEoHV0S; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="yEL/RvM2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EOEoHV0S"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id C1D5F11401B5;
	Mon, 10 Jun 2024 05:00:35 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 10 Jun 2024 05:00:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1718010035; x=1718096435; bh=1VQOkaEEW8
	eUKVJuO1ks1QNru45NEr+gYb2iIuCHq0k=; b=yEL/RvM2Mid/r0Cnhx3hxpGHp/
	AQ1pkEeDO8B8UsN0ISl/t7BtVMN0irMdXygSCan6SY32swPFJ/yuvQIWy7mdoY4M
	7Bsse38T2oeAjVqOrsUV0JE8HqfqHuYx2s2Iaz81rdEIqqmP8mxTpbcNom5OaCbs
	8UJf8/ffyelLWROtJDUJSAGqa84LbZXNE+NY+hlksFnraOA5sN76Hg923lKedumf
	vSzK/Up/aSMgKkaont06OJFm6Fz4+riVOmahbSqnKGvSaYDUETSiDACj86LWku9o
	RLvpnRd5+SnR9ikzOxZPqmswsqat4+65weVcJW3i6xkEX+Eyt2c3SFn1UMUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718010035; x=1718096435; bh=1VQOkaEEW8eUKVJuO1ks1QNru45N
	Er+gYb2iIuCHq0k=; b=EOEoHV0SGGiHinpuCiMAKRYU7OE2krP2MUVrPs/rAF7q
	uJjpRUh8+S/isVlvJU70dfI8Ys/wOaJ3lVlbVbvNBNIh6luVtanZiX8GLTAwWRM9
	IjtIp8FHZiZXYIHoi7iIgEh6Cd6F6pvvJcgkOBGtrbFq3bOCq06whPoVn8zg2nsY
	Ll+jZX0zaSTs+GI0gC4ZLjjoezveiBXXZ9Ow4JP18vZMh2nepkr6S8sPRxlV4zsS
	sNVVomSOiaQEmLZ4eyN82DOW1fpUIhwwUPOC8ty4t+phf0ejh3sf47HOxaYE1Z35
	I12XRDWwCXhybFQflTb9hrl0h3T1zWPlsWGM/Q/r8Q==
X-ME-Sender: <xms:s8BmZk84yMX7Qr5kDfOW2-7rTfPJ6wu475KI5g3wTvHxy8KnLsqVIg>
    <xme:s8BmZssPoct8NkTwBphZFCYUccONvscjE48AGsFzF2mcAyc9EyB0wJpgK2si-5fwx
    Ptfqgw9ig_CO4qTbtM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedutddgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:s8BmZqBzSPgPAS_nb_L7K2n9yNV4vjmDV-D-gaAFI2wDDwxlp7ajXQ>
    <xmx:s8BmZkdnHmvTBTFS3dZrl1gk9pqbeZjgyha9ZBwa38npluO_zYXnOg>
    <xmx:s8BmZpOHc_DGdQSDzBwiRAst4qM5BUBNtwnyqSjN9aMsJx2m1iSaHw>
    <xmx:s8BmZulnaSOMKzghzYoyBRqF0JkDlH1ImIKXUs_gtrIUPXCz8E0Z0Q>
    <xmx:s8BmZqEkZxPkaEGvVjCF-V5JAxD4tX8AanEy2OM3i4fEwwTNwO91fKr3>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 28F67B6008D; Mon, 10 Jun 2024 05:00:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-497-g97f96844c-fm-20240526.001-g97f96844
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <72a414e4-4cd0-4b12-a662-cb73d1e3515e@app.fastmail.com>
In-Reply-To: 
 <CAMEGJJ3BqY9=9cq_JpKTVhyWKO50hcbEK0MXkBcYZwqadciGiA@mail.gmail.com>
References: <ad2b7034-ecc9-4d6e-844c-bfe32fb5b23c@gmx.net>
 <9d603d43-0f8a-4f9b-b11b-9e7543f421b9@app.fastmail.com>
 <CAMEGJJ3BqY9=9cq_JpKTVhyWKO50hcbEK0MXkBcYZwqadciGiA@mail.gmail.com>
Date: Mon, 10 Jun 2024 11:00:12 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Phil Elwell" <phil@raspberrypi.com>
Cc: "Stefan Wahren" <wahrenst@gmx.net>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "Will Deacon" <will@kernel.org>, "Christoph Hellwig" <hch@lst.de>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Robin Murphy" <robin.murphy@arm.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
 linux-staging@lists.linux.dev
Subject: Re: WARNING: drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:364
 vchiq_prepare_bulk_data
Content-Type: text/plain

On Mon, Jun 10, 2024, at 10:26, Phil Elwell wrote:
> On Mon, 10 Jun 2024 at 07:00, Arnd Bergmann <arnd@arndb.de> wrote:
>
> Why is swiotlb involved at all? The DMA controller on BCM2837 can
> access all RAM that is visible to the ARM cores.

When a device is not cache-coherent and the buffer is not
cache aligned, we now use swiotlb to avoid clobbering data
in the same cache line during DMA synchronization.

We used to rely on kmalloc() returning buffers that are
cacheline aligned, but that was very expensive.

     Arnd
