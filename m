Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67CB14F98
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 06:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717999260; cv=none; b=GqKnl17lKihdTr9RWu7tc1kQSKxEd9u07BC1DMBHozaFC00RqOOJX7b4+V0zeN/aens13bq9yBd29NiO3OlMZXideSYetOhEzcIaEoX1mMTCKMSJ/65jXXgSlcyN7B6g1OiGUpYJRN1YzLXz8UzgajGgWnK8mAGqBM6ou0hC7nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717999260; c=relaxed/simple;
	bh=G2Mmw/03HT9wTJHE1SUutnlOlQy3ut+XQLleBtq2vyg=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=XzehJvju6BdZy4oKTyjhPLCBFNWYs050eE0DD45iWl9md8D+NV579IFGBPaZGPUQISByVneRaXX8AtrL4rcglOavI8tPxucTmqJSGvzbwJoNQ58XaCn21OVWE6KTk2j6JEst9rQtY5JrT+GQKrn+9XepmP0K28yA1y4hrjTPA4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=NvtSa3lC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nh68+DkQ; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="NvtSa3lC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nh68+DkQ"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id EB81613800F1;
	Mon, 10 Jun 2024 02:00:57 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 10 Jun 2024 02:00:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1717999257;
	 x=1718085657; bh=j+sK7jp6HG10g5aZu/GHC7JvpZY0AaIXu7mAACFrz4s=; b=
	NvtSa3lCEqtq3PJJgoiuM3R9SXJGTK20wHQ5eOrEYscHiBDh1hEs24/qVoqgpgkl
	kb5kn9B13do0UOXcgvP0Cn1ujco5ud7QRskbfvbcuc5a5ZbXtUPoWhC5TozcJDs3
	gA4JOanOg4EKyV6mksz1X8lcQFk2EVSl0njvgU9Z9ZUjUJ9lzqh6SRQfcCRbe94q
	dwsSE3jCp+S+Av09ACbm/IMPmOSOjVHBwE9pWZDwNIn6OQKRlIRbPKTPrBHOM0ZH
	XHg3m3idcGef9tQCJRDUf8AT/2roeYWemVio/ufxeROTDyKb7FUUgPIuPQNyEsvW
	Ih3bPoXOgzuihO/8kDnHCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1717999257; x=
	1718085657; bh=j+sK7jp6HG10g5aZu/GHC7JvpZY0AaIXu7mAACFrz4s=; b=n
	h68+DkQrCYmzjVhmz+ISyURayYDoUa5+MM0wmfwGnbIl/pMytPNoEv0zUPFbthe7
	VFfuw8YCa1Lo+rjpzlNpwLQejUvC11v3R53wQjDMyYJzVXsKq+munqgUMgBhuEJ4
	tH3DevjTMaB+5gjtsms/iIw6z8vIS0yT5iWwwg0JBDhM3z7/sFYwb+GxzKL/55Dk
	l3lYKqGdqFzq4QsPQYeP03SlVteSHML0orsXU6dqN5kbCBIb2+ysqFY57PE60xit
	V+1mpJFnAvVPAqdoVZcgE326foKZr/BRHCBL1LkWb4zrsttvVR0vmKKYVc3oltc/
	5cbtSVUCp1wNBnhzvOcjA==
X-ME-Sender: <xms:mZZmZhLgqi55rxWLAMfhZXf5B7DXpjjtzAnJybMuffEsuH_TeUz6Fg>
    <xme:mZZmZtKvn9hSUrjAZMsbP4C0omB9n94H11sR0adPeNONA7Yg6Jjh7LGdkB7WWa-Vp
    ADMig6-rFzyUs-595I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedtledggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:mZZmZpvg7Nz-6pVrPg1SHpYRuWKG2fpGttMmDfjdolJ0rP4l_sLnsg>
    <xmx:mZZmZiZQbqAxYuTXSv5FE54asFZ_uThPV4jvZJywfuiAO0srtmLPlw>
    <xmx:mZZmZoYIRn4bL19xuDmdFfdvMHq-liVzPRnu646rFILu-ZABm-8ZXw>
    <xmx:mZZmZmCh6D_sSoCH-7WUxc4Ji-6FyJx2Py5Ow6UgPh50c7eK8AU2nQ>
    <xmx:mZZmZlTI90iDinyu0feQZvmxRa3giOpRZiJ_2V2kWtb2xHrBqpUiwPMQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id EC1D4B6008D; Mon, 10 Jun 2024 02:00:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-497-g97f96844c-fm-20240526.001-g97f96844
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <9d603d43-0f8a-4f9b-b11b-9e7543f421b9@app.fastmail.com>
In-Reply-To: <ad2b7034-ecc9-4d6e-844c-bfe32fb5b23c@gmx.net>
References: <ad2b7034-ecc9-4d6e-844c-bfe32fb5b23c@gmx.net>
Date: Mon, 10 Jun 2024 08:00:26 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stefan Wahren" <wahrenst@gmx.net>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Phil Elwell" <phil@raspberrypi.com>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>
Cc: "Will Deacon" <will@kernel.org>, "Christoph Hellwig" <hch@lst.de>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Robin Murphy" <robin.murphy@arm.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
 linux-staging@lists.linux.dev
Subject: Re: WARNING: drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:364
 vchiq_prepare_bulk_data
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024, at 00:24, Stefan Wahren wrote:

>
> After that i'm getting the following warning:
>
>  =C2=A0 create_pagelist: block 1, DMA address 0x00000000f5f62800 doesn=
't
> align with PAGE_MASK 0xfffffffffffff000
>
> Then i bisected the issue to this commit:
>
> commit 1c1a429efd4ee8ca244cc2401365c983cda4ed76
> Author: Catalin Marinas <catalin.marinas@arm.com>
> Date:=C2=A0=C2=A0 Mon Jun 12 16:32:01 2023 +0100
>
>  =C2=A0=C2=A0=C2=A0 arm64: enable ARCH_WANT_KMALLOC_DMA_BOUNCE for arm=
64
>
>  =C2=A0=C2=A0=C2=A0 With the DMA bouncing of unaligned kmalloc() buffe=
rs now in place,
> enable
>  =C2=A0=C2=A0=C2=A0 it for arm64 to allow the kmalloc-{8,16,32,48,96} =
caches.=C2=A0 In addition,
>  =C2=A0=C2=A0=C2=A0 always create the swiotlb buffer even when the end=
 of RAM is within the
>  =C2=A0=C2=A0=C2=A0 32-bit physical address range (the swiotlb buffer =
can still be
> disabled on
>  =C2=A0=C2=A0=C2=A0 the kernel command line).
>
> So how can the root cause of these warnings be fixed?
> Or is the specific WARN_ON() now obsolete?
>

It appears that the buffer that gets passed to the device
has a start address and length that both come from user
space, and in this case crosses a page boundary, and the
second half is not aligned to ARCH_KMALLOC_MINALIGN.

This means it's not actually a kmalloc buffer that goes
wrong, but userspace passing something that is problematic,
see also the comment above create_pagelist().

If that is a correct interpretation of what is going on,
one way to solve it would be to add the same logic for
vchiq user buffers that we have for kmalloc buffers:
if either the start or the size of the user buffer in
vchiq_irq_queue_bulk_tx_rx() are unaligned, just
allocate a new kernel buffer for the whole thing instead
of pinning the user buffer.

     Arnd
