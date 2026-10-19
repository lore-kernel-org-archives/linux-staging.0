Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABE94E2F12
	for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 11:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410410; cv=pass; b=vEjaXBoGPFeX2B8yyfI5dbgcx9Ua8v/3/a4fYWTrbAB3CRGmbMxTXzOERgGjXHy1vY8WsX2qofE5RpwercC9J5z3FLLd9H1BvjQ/Nur22Q38vcJAxt3MIs04XowN6+9aSUv6O0lbf/xmyGudc7lBzeYnYZ8ZW1uGWPpv3De9dLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410410; c=relaxed/simple;
	bh=a/+0QquMjDxXq7vYM/x236+ERibUdJVR8Keoyp+eUC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bcMHHCyHm1gCcfMkx5Oa3B8Yal2dpcTTl07JSiQyTqskVqYv5dkSh7ayco6EQsZ9GCpIym3LSc9UTTCKttlfSe63uplRTFde6rQMeqnbenOgAAyqoNYCIZq9P7uQJGkurpiQ9Jn6HaECz7I+6ILn9/OlCYKTAuw4Xn8524PNx3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fs63V6d4; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fs63V6d4"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a5a26c8412so16017871fa.3
        for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 04:46:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792410407; cv=none;
        d=google.com; s=arc-20260327;
        b=AQTNQq88eFtj1TydVm/JunYHDr8jiwTxcSUQ+t+aPAVndBUH8aikEq4XGZ+iYe+iu4
         3BsKnKrXon6J54z0qjudrg0Kt/7gA6q1QucFTVvMbJhVG5OSGqp3/KGlSyv1fWf/uLHB
         wIth9j2sXKOro06DkhLB6leq5vugHVvVV9IQHmcSpdYTsCjc5D1wklJz8L8vAfhshJvE
         utI+Tpz1C3qFYdX0pEqISY2vMEY9mWWbaJHcE1/6xyy1v7ayhjjC5WWLVKmoeSidLGXa
         P+P2c+Af4f4VWfuVuXxJv+h4HfCEGkM5YJclktFk8QowWRjNA0l7PQd3qnmmkkO6dlMP
         wy3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T/pXYNCJ0xeK4V1BUXfqQjJ36OKtMGptQa0NVIglrao=;
        fh=YfgMUpjwsRmOlxDWz41ATNCV4cESeb+uJ33jNpumhL8=;
        b=Do0akzpHnXne4TZlm7FYAwUEzIjyimNfuRYmj3Jb0coZJYrFiqAGZVVAk608v2L/D6
         GuNMO70FFivTp0gQf77bCmcIU1EpggKDXs4lUCYWlF+MeLJiT4nzxbAgLBIaQL4Js0UW
         O43m2th6XRQvO1ltqb/uq3DXNdJAHdIQmCuSEN6jiS2iCh2CCYoL7g2dDbPPbyBD6VIG
         BuDZ4J98c13EPTK4OpuUscuT6mDmwsnMhRBAVAuxt6WyO7tiJVSWWRD7aJFtTzx3f+mg
         NUTr8olvid4jkaJT76rztOQ8nRqie3UgpfkzaerMdBrEfhiVWcawpW5CIiS8MyqREhiS
         bYUw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792410407; x=1793015207; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T/pXYNCJ0xeK4V1BUXfqQjJ36OKtMGptQa0NVIglrao=;
        b=fs63V6d4dzqCGNpIHddhi+nBWbd/mgDQymjK8xY2A3knSRJDtse3c/W3lMtDdjiEx2
         nnyKJMnNQBXXTJujIV/kp86wcu+/XhFB0vPmOCRCAcTHsVrHtGdQ2dzm8N5Focq843bz
         hTU7rxjk2LE4mDajlNkgDymB4qsHkhqDB+dA2m6ClLQXmgr768+rMTalHn53RDr3syUV
         tenq0Fj1L1KQKaB0Zo5QqyKgYsITq8I3NtD36xKptOwC/7I7MfBoLSGf4hD1Boax+Xmi
         7+kMdxc59T/o2FbMtlW8eu7nuiWNNITBqp5YOF4kUD4cc8PlgIgc7Ieawlp/EHWXyPcJ
         tQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410407; x=1793015207;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/pXYNCJ0xeK4V1BUXfqQjJ36OKtMGptQa0NVIglrao=;
        b=a6Hvv6z89h9P7tMVNJcyzQrOPek1TWs36TIga2coZXYVk1ga9MA2FJd8WPWkptOys3
         r9yIs4MQUlSgwj1pDy2lwBtK+kNcDK1yioVHiU2sQUdjgdW7L14v4bGDsAdzewsZcDR8
         9EeHggNQPfMY3vfxlG4sZril2idwK8BAd3/XQo99/jxEwqYs6p9Yzu2rO8FGtxWF1gSR
         QqNei09khIbgFyAcxdWqogedEdhSEbOuOK5bbC6w0CElQAiYBUnZvhdedf1Lsom9fyAh
         kRhfaKjAtGrbOz2WrMz5t4ouP2BLjwKKRLWKf8H9YJUxH9+N5r+EELss2wpb31sUIinO
         xP/g==
X-Gm-Message-State: AFq9FYJLHqWtoDJyLvP2PgcBHFw2rHWUjQyyVXPRGe0OaqgtkpuRyxra
	fhatsGVfZcE+m294B1V28Ofdl93BNSssgravBaqFb+AiwbY5+2KLBrlpUNXYNyWh74xe2t+01+y
	3MdYxzEAPFAKEpAh1vixysMR8yykgcPQ=
X-Gm-Gg: AYBFou2y6DgpZdr2xfTj3URdFWq2OpOx5biNB1knIo7H+dP/6mY9Axo3XhW3mz/Y5ro
	baePt2eS0Qze+n8G9+hNKp6xJBFT8JFJYmzjKHVfTejcRyMug0NYdEX8tfHzJf7mvmll/pY6iMk
	hPteNAmYM8N/C/LyQtxdhEr/BZQ2pR28yFHrdm2cZaVdXSJD7SGtvnW8Z9Y9sd+Dc1tXUUMcPoi
	0jYi/x83waVg+40EvSaALjzabgzE2mjUY7Tj8IQdmyY+M9ZykQU/YFZ5XVlmzuHuMY1Gn1fqwb+
	LIyqV9pi+2YWqbwr8+k3pAmhL+agFyh47oOtMxS7RcULB+SN26N9ufsK4iBljvtSR/ec
X-Received: by 2002:a2e:bc0a:0:b0:3ab:27e4:5b7a with SMTP id
 38308e7fff4ca-3ab29175d9bmr18692051fa.4.1792410406406; Mon, 19 Oct 2026
 04:46:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261003175055.1511-1-timofey.zakharchuk.research@gmail.com> <2026101326-pectin-decent-7407@gregkh>
In-Reply-To: <2026101326-pectin-decent-7407@gregkh>
From: Timofey Zakharcuk <timofey.zakharchuk.research@gmail.com>
Date: Mon, 19 Oct 2026 14:46:35 +0300
X-Gm-Features: AclHuK8tRVzyhyE8NcFjY3zyrVz7jUzZz9jdtp-eYqnxWzWFr3nJLlNdjVo1t4o
Message-ID: <CAOm0KL_gbV=PY9DzjcsgqUOUjRK=vc--3q0c6LD_uDfbD0AFNQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: sm750fb: fix resource leaks on probe error
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ahmet Sezgin Duran <ahmet@sezginduran.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi Greg,
it was found by manual code inspection by noticing the asymmetry
between the resources
allocated pci probe (and freed in pci remove ) versus the cleanup
performed in the release_fb error path:

it was verified with checkpatch.pl
i don't have access to the physical sm750 hardware to test on real silicon.

thanks,
Tymofiy
(resending this because i accidentally sended it with html)

On Tue, Oct 13, 2026 at 4:39=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sat, Oct 03, 2026 at 08:50:55PM +0300, Tymofiy Zakharchuk wrote:
> > If sm750fb_framebuffer_alloc() fails during lynxfb_pci_probe(), only
> > the framebuffer structures are released. The write-combining MTRR,
> > the MMIO and VRAM mappings, and PCI region 1 remain allocated.
> >
> > Call arch_phys_wc_del(), iounmap(), and pci_release_region() on the
> > release_fb error exit path to prevent leaking resources.
> >
> > Signed-off-by: Tymofiy Zakharchuk <timofey.zakharchuk.research@gmail.co=
m>
> > ---
> > v2:
> >  - Fix From and Signed-off-by email mismatch.
> >
> >  drivers/staging/sm750fb/sm750.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/=
sm750.c
> > index 8b93bfeb2..456b3da86 100644
> > --- a/drivers/staging/sm750fb/sm750.c
> > +++ b/drivers/staging/sm750fb/sm750.c
> > @@ -1023,6 +1023,10 @@ static int lynxfb_pci_probe(struct pci_dev *pdev=
,
> >
> >  release_fb:
> >       sm750fb_framebuffer_release(sm750_dev);
> > +     arch_phys_wc_del(sm750_dev->mtrr.vram);
> > +     iounmap(sm750_dev->vmem);
> > +     iounmap(sm750_dev->mmio);
> > +     pci_release_region(pdev, 1);
> >       return err;
> >  }
> >
> > --
> > 2.53.0.windows.1
> >
> >
>
> How was this found and tested?
>
> thanks,
>
> greg k-h
