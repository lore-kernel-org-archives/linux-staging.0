Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F404D8BC
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 08:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718007995; cv=none; b=WLD+hU79uqg1ydmuaKYvoz2DASxNJHNOllqECU/c35blhOUCX6hUUuWZ9UEC8fLMlF5kinA5mtToL7HaepIKpoeCHydnUYeQZzdjztCAZ90oPcClmUc7jCeWPHETCOBzSzUJBJSSs7gpvkIO3C7OZPjgGrJDSwCwMTN6RYuoN7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718007995; c=relaxed/simple;
	bh=xXwlfu6x0T1m63OgsFMzBkdK+k7T8FnR6dyjOppDoQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DtBVnnZXg3Jw5Q0YpITeXI7depOCiibt2+SvtUgyQyutfq0KZ6IRzNEihRFJOVfg35IwUqmbQg7nnuo3gkhC7AkHhf9swWijlIb8s0dqzZxxY7SBS6zFEmAcJfUGKcYtkobz7uZ3IIcYOy0VKfH+ddpNK/K4Lbc1AIaqSPIn4O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=o6B/Sz29; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="o6B/Sz29"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dfb0ccbd401so1415993276.0
        for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 01:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1718007992; x=1718612792; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ym/cUClMfZBSsr9kRxDp0DhJykrN0qnvDNklujx/CRY=;
        b=o6B/Sz29WZiIUSClshhxt+8p335mLy0DnsxIuQlJUUtJhbFhT/xMnzEx90wWxMd6ty
         816BDMkbKW4Wud7zdQ04GwP676WelvBocaY5mzj03chwvvuq9iAeYOD3RpWLQLc1jEmF
         5gJXd8qchp3WXTNI/yRnlymZ+dRMGeW+6473eC6z9dQQiv6iLOxyem78lNHTosOFglz+
         CTaAg/duJPFUgn48kiXNr+hY0P4izdIECiVZyEFBUqsgWirY0/FsgRpQBealmhKy+uiK
         93hdm6a7V70UrA+tEWDlmxjkXavmINRiyd3OFRVvjWvdRRZdn+qIKj7al3uXjjbxNet+
         HaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718007992; x=1718612792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ym/cUClMfZBSsr9kRxDp0DhJykrN0qnvDNklujx/CRY=;
        b=eNXaJyNlhGrcG97aGMkZXy0PZQn70/8NVs0rhqlztTJc4SWEWdQlVpJE29VBM8EsXn
         7g8KiruIHLmN8a1vRAULSsxHtmskMEGIkBDGShI6IeRFvmOr0gvpHT0o6slFTnkqYuN/
         cQ5FcdXp6Vw4F8oo7xvtM93qXKFfGJCGZaMPgSiwLusi8YJUS4oJgM2UCyRFNPqaA151
         Y+MZSH6K/Zundaero9+x5wFIrwWV3IpnsMeSLHhPkY6bi3y+g/bNKIfGFy/U/EujFQep
         sLuMYm7A0vnn2Fp0mtY0n397SgJLwtw6JuN4BL8h5DmzPFhxANethwHH2taPAQFeTZzj
         D+LA==
X-Forwarded-Encrypted: i=1; AJvYcCUNgjcYSH30TXscWBo9cI4Ynx6HXkF+E3KSfCHfIYj4IvrB+YLBG6Zjn48HpNR7pgXr+o3BBnjVBBFfEnFTW5vRLWigAd3m0p2JRtqhRA==
X-Gm-Message-State: AOJu0Yxn1ALMb8Oyu6V1A62/VVkxfzEA6Bahtgf/8gpYCVY4apoMEDN8
	MCxzcEH4svQPw6wbkUa94RIaAwU5WA4hAg2bWQNRiUI8RD0yodFl938bV/Izg+ySuZSeK6o82cD
	p4OTXW8P5RQxXqY9YBD746nGy0yLBIUuASZJG5Q==
X-Google-Smtp-Source: AGHT+IELP1AOK8WEwLzj4gRZjY77ccPkM0NlGoCOUWDPhoqHxf47Be/5/BKDoReoiIzevqSJd4+UIktmihB5syrUFPc=
X-Received: by 2002:a25:a167:0:b0:dfb:f01:5b19 with SMTP id
 3f1490d57ef6-dfb0f018917mr4330556276.47.1718007991985; Mon, 10 Jun 2024
 01:26:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ad2b7034-ecc9-4d6e-844c-bfe32fb5b23c@gmx.net> <9d603d43-0f8a-4f9b-b11b-9e7543f421b9@app.fastmail.com>
In-Reply-To: <9d603d43-0f8a-4f9b-b11b-9e7543f421b9@app.fastmail.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Mon, 10 Jun 2024 09:26:20 +0100
Message-ID: <CAMEGJJ3BqY9=9cq_JpKTVhyWKO50hcbEK0MXkBcYZwqadciGiA@mail.gmail.com>
Subject: Re: WARNING: drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:364
 vchiq_prepare_bulk_data
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stefan Wahren <wahrenst@gmx.net>, Catalin Marinas <catalin.marinas@arm.com>, 
	"laurent.pinchart" <laurent.pinchart@ideasonboard.com>, Will Deacon <will@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Robin Murphy <robin.murphy@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Jun 2024 at 07:00, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Jun 10, 2024, at 00:24, Stefan Wahren wrote:
>
> >
> > After that i'm getting the following warning:
> >
> >    create_pagelist: block 1, DMA address 0x00000000f5f62800 doesn't
> > align with PAGE_MASK 0xfffffffffffff000
> >
> > Then i bisected the issue to this commit:
> >
> > commit 1c1a429efd4ee8ca244cc2401365c983cda4ed76
> > Author: Catalin Marinas <catalin.marinas@arm.com>
> > Date:   Mon Jun 12 16:32:01 2023 +0100
> >
> >      arm64: enable ARCH_WANT_KMALLOC_DMA_BOUNCE for arm64
> >
> >      With the DMA bouncing of unaligned kmalloc() buffers now in place,
> > enable
> >      it for arm64 to allow the kmalloc-{8,16,32,48,96} caches.  In addition,
> >      always create the swiotlb buffer even when the end of RAM is within the
> >      32-bit physical address range (the swiotlb buffer can still be
> > disabled on
> >      the kernel command line).
> >
> > So how can the root cause of these warnings be fixed?
> > Or is the specific WARN_ON() now obsolete?
> >
>
> It appears that the buffer that gets passed to the device
> has a start address and length that both come from user
> space, and in this case crosses a page boundary, and the
> second half is not aligned to ARCH_KMALLOC_MINALIGN.
>
> This means it's not actually a kmalloc buffer that goes
> wrong, but userspace passing something that is problematic,
> see also the comment above create_pagelist().
>
> If that is a correct interpretation of what is going on,
> one way to solve it would be to add the same logic for
> vchiq user buffers that we have for kmalloc buffers:
> if either the start or the size of the user buffer in
> vchiq_irq_queue_bulk_tx_rx() are unaligned, just
> allocate a new kernel buffer for the whole thing instead
> of pinning the user buffer.
>
>      Arnd

Why is swiotlb involved at all? The DMA controller on BCM2837 can
access all RAM that is visible to the ARM cores.

Phil
