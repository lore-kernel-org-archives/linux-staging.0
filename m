Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CFE770FD
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 10:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718014221; cv=none; b=AiOoxZx4zAOEH3aAWqdnM9nf1nakhZSVBfjqkL7pxlvJw5SQXD+Wl/QV8K1T+cQjsP3SXKY2MaPL0vID9+6wJGLmYv4chd+l5mvzRkdfXVULd3EwpO3Oklw4Fp3ghLN+wkCoOJzNOk8LKGBjFpbGzvOAgrrfboDR1g0RrqYZkcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718014221; c=relaxed/simple;
	bh=XoELS200McX4Bji52IdELrryR8J8IiYj1cwHBSnc0sg=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=ubI8zl2/xDTQYovz+QKyhHG8ClTKTWUMgmt9zhyCOq2nwT4CcPDDcycYVQCDsm7BSpww9wQqhtJTq7VVb/CKPbmxXEGXDE4av/O9RuNQY6mOfKzKUaY0Okb5xjc8ETFdPDvbe7TA1zA+0qp762nCjOiuOAR0yt2PN8IIYb8z+7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=VIMNWyo6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LxdmMnjs; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="VIMNWyo6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LxdmMnjs"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 93254138012F;
	Mon, 10 Jun 2024 06:10:18 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 10 Jun 2024 06:10:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1718014218; x=1718100618; bh=vBV7hd/KO2
	Ucye97GEktL0XhPmdj+GgPo5ibUeeTolc=; b=VIMNWyo6K1mSUnoUwM1LEWt3mC
	w4bUDFn0GickH1G/Q8BaSQVGZBGC6tkt7QkSHkZMUK/Ezu8hL8xMfPqPcrV328mE
	kzv7Da34ZOQL8B2JFFKeen82E7r55C9aICsPgIAUJSb4GW8+3cpjGzJbUGkb5rT3
	eNaW/rmvM7k0WG2BtDERJwB99N10H9+HbcPXpSXHN15Z8Fpki8gXahwQijhoPsx4
	vApFejJ2M4AKXDUq4L/6RIbvUcTtam2srAEdwHbn+DKnBEAcmaBzHYlfgDzCzMx6
	LWY4hlRLDv5GgHMnBZMygeKSJBSReOW60TzsSIKsYMeSUVt4etvUQfKmDNnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718014218; x=1718100618; bh=vBV7hd/KO2Ucye97GEktL0XhPmdj
	+GgPo5ibUeeTolc=; b=LxdmMnjs0n14gNaLP9L/ST28+EYkkdRCU7A4yBcHmSh8
	HXuxj8mZDWzYoh7GcGBlOGIHQvzYXLiNCSW79ruiBfuCzIZkfh5TsxUuYSfhyroy
	P3BjQ23PAkP7iBCfrjkwDF50Se10XA/NV2LRObd7dbofdQuNfYn5/DvhsZI1Xv4w
	hu4+O/Y/gJouXZA6lH/COQQU1VoN/DQeh+Ep/cmIHEQY0qU+Lnfg2rHwBTlMoSEw
	pSeh5atzl/olSbzcyEi9ftcv+fOOMiHyUVYWDrupt5V9+QjMXcsmfzMsuXex/wre
	NuvtqMCocKyqVWb4ptkmLmHOdLSz+8kVFaqSCKyStA==
X-ME-Sender: <xms:CtFmZif2Z_GLZiPafycmDjdFHTcxC21phC0Moj5NJypHMgovoMN6gw>
    <xme:CtFmZsP0VDabpTpO8Y4Rdr3FgRT6wG1LFdZ_2wEw8bf6YhUvEf74kqXzD4mQQUMgL
    rN5aqCMvjScBnHQu14>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedutddgvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:CtFmZjjBNys5pTOR0W_sZBsNwC0y0y0xMWlfMlngTs697XnGIKlStg>
    <xmx:CtFmZv8A2XKca9Dt20UNguBha9l0o0htqh7qIE4pm8kkTWk9oDxlfw>
    <xmx:CtFmZutKoiZskkx9zUHxcUjHEUMwjkxpm2Tea_x78t-dUWPy2e3XEA>
    <xmx:CtFmZmGk851j-wxu3F1Ezo9cNATL_68keTaMYjTqL5t-qWh6XBLYNw>
    <xmx:CtFmZvltrbZAxZlCHY-Q7OcRREq8gEd8WWX67Fr_mRps1YpsbsjtQ4eH>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E8E5DB6008D; Mon, 10 Jun 2024 06:10:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-497-g97f96844c-fm-20240526.001-g97f96844
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <857445de-23ee-4893-bddc-eebfcaec45f2@app.fastmail.com>
In-Reply-To: 
 <CAMEGJJ30ffMSd40YpqGuMWOeazoT+oiDvzkYEc37jOTx4fZBNg@mail.gmail.com>
References: <ad2b7034-ecc9-4d6e-844c-bfe32fb5b23c@gmx.net>
 <9d603d43-0f8a-4f9b-b11b-9e7543f421b9@app.fastmail.com>
 <CAMEGJJ3BqY9=9cq_JpKTVhyWKO50hcbEK0MXkBcYZwqadciGiA@mail.gmail.com>
 <72a414e4-4cd0-4b12-a662-cb73d1e3515e@app.fastmail.com>
 <20240610091534.GO18479@pendragon.ideasonboard.com>
 <28495bd5-41af-41b8-b427-6b6fd36a2740@app.fastmail.com>
 <CAMEGJJ30ffMSd40YpqGuMWOeazoT+oiDvzkYEc37jOTx4fZBNg@mail.gmail.com>
Date: Mon, 10 Jun 2024 12:09:57 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Phil Elwell" <phil@raspberrypi.com>
Cc: "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "Stefan Wahren" <wahrenst@gmx.net>,
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

On Mon, Jun 10, 2024, at 11:24, Phil Elwell wrote:
> On Mon, 10 Jun 2024 at 10:20, Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> My guess is that this will likely break existing applications,
>> in which case we cannot.
>>
>> It's probably a good idea to take a look at what buffers
>> are actually passed by userspace today. That would also
>> help decide how we allocate bounce buffers if we have to.
>> E.g. it's a big difference if the buffers are always
>> within a few bytes, kilobytes or megabytes.
>
> vchiq sends partial cache lines at the start and of reads (as seen
> from the ARM host) out of band, so the only misaligned DMA transfers
> should be from ARM to VPU. This should not require a bounce buffer.

Ok, so if the partial data is sent out of band already, it
may be possible to just leave it out of the scatterlist so
it doesn't get bounced by dma_map_sg().

I don't see where that case is handled but that shouldn't
be too hard here.

     Arnd
