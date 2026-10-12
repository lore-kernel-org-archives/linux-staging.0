Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E74324B22
	for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 09:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796994; cv=pass; b=UPehWvpzYptW+N9RLBmSG0weis9o4j1xd/wtjMhVVtoD28wINopfr6OFEogHWrDlVLkMa4jYM7vhJNMCwqy793EwXbvw61OYhnjlGnWKpOQBbr+IkUeYdbKrOqXQnzW1WkbH9I5VQd9550Dgckn8tWvi+GtUt0jxYgZ1hnAbXUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796994; c=relaxed/simple;
	bh=ll0F4+vG9+cFqrbPEv9fSbXH66s1+84h5qNxoLkrJMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S7/+nfMuO4w93S8zkWk8zEiWX8MFGr5q0suRrBMX/0ME7ozPsSMF2e7DI/PXZRaCnDSqwnbPF/8tXQhlRBci2du6Q/koWrZoLsyEt5TE2H4rQN70ujxRBfpLN8rRjxB66L3bRFE1RtHRD62ELSM8TojRetVd9ImiK+uZP6S97Qo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OEwXFLnp; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEwXFLnp"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a777d4f321so14859781fa.0
        for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 02:23:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791796990; cv=none;
        d=google.com; s=arc-20260327;
        b=j/7yLfJh9gsuwxuMOFzjb6bg8+Sl0VLup+FZWfUgn+J64n11MSsUOKPq2z/qEsSjkU
         ULoQjP9rxay1D6a00ncGIG2IEhIji4wLwaw3VkPvT6IPzLlogwAposk8cBpZQXkYYtF7
         69VvQeioeLNRaRe6srmzdoC4Mie6wB4g7GfxjalQlaBS3NwkQwaCahTcifg5YH4HFPla
         WKjMhzPBVm86bOcPAlw1U2l7KSZrJyMIgIFOqNGY1BywobTaem3cux43qEAEmk4ODSiJ
         lqSNv8I2X+wpnf7cyzq1FHZaSI0dswLz/gNg5WYJBPJdyGMEl0ZMAORd3Zflq8N08Osb
         sLQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GaBwRiwcU4T784679Mndr/YJsrU0LmmpEnBwPuOqAqk=;
        fh=VVZoVquoaoc+bSutjyoxOHTYQHBxxsVG8RvBdoDRuwQ=;
        b=F+MutyU5wXZ7ds2nGJNaiBO1wy1MBR9HBtUkubZTt1/br9dNhnIS5FP+s8vhRPFB4F
         uGC9RQaOpp4c5EqEcLn/VKCRUJqpqtk8dT8cxKEDNpRsDbUAZub1hwsgrVGNL+5UaE8C
         8BzOnrLBhrBnFivWIuNUsH1ZllaLpM04Ur+NpMjxOkigKZaXQ8yy8GHLiVHS1NRRwsro
         diPb5NkX1DMfhU2sxGnu48GBZp1KXqamApE9R7+kofm0SU4F3roUbY6u1FW3qIHNhtVe
         JbX7ahWHACwNtTsaSam/hE2hvm9rYqW+LCKvUAUDZLTyBOxa6x+c+zQbM65m1Calvw++
         eoVA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791796990; x=1792401790; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GaBwRiwcU4T784679Mndr/YJsrU0LmmpEnBwPuOqAqk=;
        b=OEwXFLnpG1oLrV0vr+epjV04a+ep1Z386EcxXTuxBizXmSqmaATE3D3Tg0Udk0PlYT
         pOT95cKU/G3rOXvGfUXTSndr3SnuFXkU7XjfYSgD6Zf171Db5PBxjwjnnlfj8oQWhM6u
         Yok52wF3A1n04D3H/5zK5k2b28PPW9c+GkYkTLfv3XUTxtc3MNkX0Vho+vXVpakNawVO
         Yy0Nne+Dl9aQXma8HQQIFLRbViUyGwewqSTGawOsVJVXj5snN8KsTo/GGXvkriOd3hOP
         WUqTGEiUJ6gozGJoxfwpxYNFKL1YpGtrF2pi/sfPbs3tCZyHq1YpD26QSV8ZsnHEqA8d
         a8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796990; x=1792401790;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GaBwRiwcU4T784679Mndr/YJsrU0LmmpEnBwPuOqAqk=;
        b=GHtJwCwtViCfXxqdzhijMrnVsKKY4Bz9b5awVT5u8s66UkM7RxXCZYGOlu8LOE/tfD
         6IWsetINYfxqJLXNU6oiv7XBMntz+qvevBFn/Vj1eJTyhksBWkJbePJWFA9TIaovvuvc
         IZ2rdaqaOxINpBmpRudgIXPDN+5BNjdhTO/9nFHXiy6J0BqOL17U9IiRS5NhsjcXkiw2
         jYspLOGyupLJfGR1dC3pC2IsQu9wwM5iCPKQ0JW0C8LjOoFebm+9nueCvqKSmOggIpQK
         5TJSMsLNdSbKPMFomHZ9anMNCf/j6tYShv8yXTJd+CrKIsUeklaFCAt2rx7te/wm18Q+
         JZyg==
X-Forwarded-Encrypted: i=1; AKwUvBxfFh6RpgZfWUE6Ekm2HzpDusMtgnJ9QSfwRfKVzSDO00XzLoAfXsppM3odClD0MUAtj654BH0vplMuIQjH@lists.linux.dev
X-Gm-Message-State: AFq9FYLbq98fclfj3FVh9WbbUZuri7ptcP1KKzyJDuq0FnuxcX0woqpz
	YNZHXiF9IR751x/nazfxivYgBoJECGYy8nsPSwhcpbfiqrqWLyTgTUrVLsivSzLLTtIxP+Pg+3k
	dwEETM4mM14MaWw9SjRiOqPLuh+qGtVc=
X-Gm-Gg: AYBFou3JvUI1F+3dOqyplbO/Q3A4riKjXCejOAHWECFPbPNjV0zvOclPDJut4Cg+955
	EkrNQZCuOO3yXUtheNOkgiyK7xAGZQc6ZWx+sEcX+ahEvSXgP/Guw4xpnGEPFUO1ysEfBv1RN7y
	gkkoHhHPXQYHT+s/DKUfdvcPsB4Smpu5sgj5gOMRvZNEhfau4GgipZkyPEzg/fpTW/E1FPxIurM
	Q4JDkYIFStylqOA1eJdwPGhadTQfx/9c7v7uK06bCS642yJ0S5yXNNowZAEjMOQNpCrilYyugeh
	POkPY7IOBNoF0Og2Cx67NvfzrnT9Fv/uIUZoQyIZa26LBzOkWgHWZr0bnx8Q2cqA/pDH7aTG66I
	+jm7v8ho85xRwdJXKAKy9IFQmj2SC8SHld9QpKTtuHS/zzkOoNSIUapWZuNnVBAswGKoqBWjr9P
	z9uiZoX2exmsEcGlgqORnTrx2WnJkqoPWzk35JCCcH8hY5K6J99es=
X-Received: by 2002:a2e:a99e:0:b0:3a6:5b2b:c50e with SMTP id
 38308e7fff4ca-3a9c539af0cmr21768881fa.4.1791796990083; Mon, 12 Oct 2026
 02:23:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012044724.160902-1-mhun512@gmail.com> <CAHp75VcEZ0RiCYKde7aiw7tK=J1LEfSeA=91GOHdPK6479V=mA@mail.gmail.com>
In-Reply-To: <CAHp75VcEZ0RiCYKde7aiw7tK=J1LEfSeA=91GOHdPK6479V=mA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:22:33 +0300
X-Gm-Features: AclHuK8GqFu8wnVI0Mxk9MM920njTXHSZpz9wCgu1uvRmpNlSfdJXJ1wA6pAW-o
Message-ID: <CAHp75VfJu3mWgfBrKiiw59mVCCJOGEHZ-CCjtORV_CvfS4PjRQ@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: drain assert recovery before tearing down resources
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 12:21=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Oct 12, 2026 at 7:47=E2=80=AFAM Myeonghun Pak <mhun512@gmail.com>=
 wrote:
> >
> > The threaded IRQ queues assert_recovery_work, which can stop, reset and
> > restart CSS. Removal currently tears down CSS and the CPU latency QoS
> > request while recovery can still be running.
> >
> > Disable and drain recovery before atomisp_pm_uninit(), keeping the IRQ
> > available until recovery finishes. Then release the IRQ before CSS and
> > firmware teardown. Apply the same ordering on probe failure, and skip
> > the uninitialized recovery work in PM-only mode.
> >
> > This issue was found by static analysis.
>
> Nice, have you read the code that you sent?

Next time, please also test this on real HW.

...

> >  error_unload_firmware:
> > +       disable_work_sync(&isp->assert_recovery_work);
> >         atomisp_pm_uninit(isp);
> > +       devm_free_irq(&pdev->dev, pdev->irq, isp);
>
> ^^^
>
> >         ia_css_unload_firmware();
> > +       goto error_unregister_entities;
> >  error_free_irq:
> > +       disable_work_sync(&isp->assert_recovery_work);
> >         devm_free_irq(&pdev->dev, pdev->irq, isp);
>
> ^^^
>
> >  error_unregister_entities:
> >         hmm_cleanup();

--=20
With Best Regards,
Andy Shevchenko
