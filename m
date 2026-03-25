Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D8A347BC1
	for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 09:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429396; cv=pass; b=BhxBS2feDPm7MNdJc8RJb20l8LptiCw60UNRfglrMOJn5l4w/DRGoXbzQkzsCEu5kZM4fhwIeDexdWecb/HyPokfHFSEccFZCHGO+ttXYkOOydeJqMp5MBy4UrX9nFTwXHrvgFdDSXuC4yyznQKq6zhc/25zEyRAmAhXGcI3jq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429396; c=relaxed/simple;
	bh=d6CS1LQ37E6e0nUl99csO8E0ASJYSwFy531gINcn11U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=omdIl9K1eu4D7mtML9mv7uUf8Ka9pdPngwY0IWQAhD7iiL5nZ4ircWqdSFot6QopTUkWvhJpRSavX0u4wqiX8XTMVI4O8lFNasQPyIGXB/6GwY9x1An607DSDpg8AiR3M9vFynjC6xFxBxIHHFcUi1TGu6dh5tyE/OEM8fdHrpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/jWj3zk; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/jWj3zk"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a277d9c5b2so786373e87.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 02:03:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774429392; cv=none;
        d=google.com; s=arc-20240605;
        b=RuTu9BLIW7qBtNWfx4je2WxxnV1MI7fL1D7X5xCTCP9wTiGqsaSvkX0EKoz28NlgPf
         KwcbPdEH1ecmfUDFCeeBE/NkujlqXoGmMkf4ENYK5yVuVZrPacdFxabwIiqc8q2JblzU
         VdxjcAMBcgtxPeUJpwkImrxvDjSs+aSgiXxmMlr+cWbQacUTnLUayf+m59R2sXItJ7CV
         36bphwE5RrIbNkMu7yqdi57T2YirUqO5oiCgC8FyO5wJ0Ayjm70zkEglyan2IL/mnUpg
         AgcGLSqJZiT/B9gZUZQXY5wYI2qY41pMr4PC6ZVRxnMQ+jAwoqTjI8dQa6+G1b2QMoad
         jqYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h5la0ycZ+nsnSWMYok2pKThVgosVYA8IsQBaAraQmBM=;
        fh=2CVTIkVPhg0KPB0MXJsQlUHJYqJp0iJnPh+zOrgPQrI=;
        b=dnUcGX1XuVHUkAVMhdjXOt444129LtdP81UjVb4/h/E3h6Romk8jh9Kj8kyTKRzwZ+
         GrdVW2hMDZNE5c0LHS09LvlfdgsKhBmytgBnBkSQGP4u7qAD1zpnK37clEQZi19EvlR1
         BJJmEtNn5qI4Qq37yC72AQDqfmripmz65jrTF7OMk84z56q63mrtcBBfDlOreCjZqpZH
         u3n8odBrQUIbRsTvOnlydDklq1SDa7AMIi4c/ldqFRMoD+tURjLMAm3ZqVTd4G1lTeLc
         xUn4rvnVqxSBQVMtSVtxBe2BV4wP5dLU9fOd1jVK7GtvnVuVAKAFtP6FZlkgqnfim6jD
         9/5Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774429392; x=1775034192; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5la0ycZ+nsnSWMYok2pKThVgosVYA8IsQBaAraQmBM=;
        b=M/jWj3zkd35uHg9cZO0Qsl0qPRTXAVPIlFKzUZ2ogaYS1jXgFdY9AjJP33m/qOlJ5g
         YaP02X4cOxZesjMUJf49fFkMp7Eas9E51X6M2aay43lQw+JGeChtiUjck6sy20hOT1S5
         8HkZ7M+mMmILVyUdyb0vefhM4BMarsl7TNGwFX/GpscjZeG+EE6cj/wcovVlZY/OFdRm
         8huCWY7Szt9xeqiX65N7umh/GCOxQFsUGGIUIyt9OhdbXTLvOMy7RqXfqcEO9XdF+WMF
         gKR7Yf4WeuNaBhV0t9zFqjlIljs2288SSYteqaI6KVWKh0XnjnxbiIjDQA31qCiJ3Z5i
         T7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774429392; x=1775034192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h5la0ycZ+nsnSWMYok2pKThVgosVYA8IsQBaAraQmBM=;
        b=dtwSFS3zKncntwaMY33+wLddtDA1t9us/kQdKfkuZ3BubtAgNlogf+ZIuTpSgGy1Tk
         9JzELutNtbnDDfQnhhn0e1ZvP6u+iL7iCrTFWC/fOUreDHcIzVLKtUxQ1y2vNB0EZt2G
         mF3iFI1kWSOQZoMfNgq+fPGMGBE1y8X0GNvoeRMW6ZkyXwhNc0F9GzLd7IJU+wbFKl2h
         yX9XCFOn/pXktVw+VLf3xGFyEyaQusxXAnd+L5uuZmLP/BZz0KT5UvgDUN1G37A5a2jt
         cnjDuDkL8Nf6nghrArMuyibMvVjxvT3Je+SUHg9nojpW1MZuvES5Y9SP15pWhaFkAJHn
         Epjg==
X-Gm-Message-State: AOJu0Yx/Wa68kROgDPDuEvyl5CfEQAYoqtwcTOXHcmO0GDjuxnZmr2SS
	Iw01baD4P7p7b5/iJg9StxBlYNhicoTVJjXCBl2/UA1VemNiKkrYGuunm4B0O/f3d6pk+eTQiCs
	4nIBvAY/7PHiyoKnMWKCSjo5lid3vVhXcbL2iQsi0UQNY
X-Gm-Gg: ATEYQzxVTdLjFNdNWHYIzy19fCKSdsWRI78wEeXAgt06Ls+0Lmjkp5A+BWaQslwFH4N
	6rL0l2xKBDqTAb0aU8hpkVQU1hBD0qBNcMp9NWOl6J2WdLa3Gqa5aNbpVPm71V2KXX+N5wo9Qt7
	szkPGFG67RhJYgbpFuR6XGjF4VJGZB/eDPTD9p5/fIvVgQWMS+B+beVGDwxK3GIW/94lQgdht17
	Q23KyCOTZhjf8K3lO3NLMN0VdtKNUDrqAHEzTQnJ636eUp1dlKHts43TzL4ggBdJ2eOKuuk6kWZ
	lbdhj5gDEuuWxS25J0cET+YW01f0EgKPgxCNHIKI6A==
X-Received: by 2002:a05:651c:546:b0:37e:566d:7fb9 with SMTP id
 38308e7fff4ca-38c42ff6b6amr5077791fa.1.1774429391991; Wed, 25 Mar 2026
 02:03:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260324133029.82764-1-ayushmukkanwar@gmail.com>
 <20260324133029.82764-4-ayushmukkanwar@gmail.com> <2026032445-squad-breeching-23ed@gregkh>
In-Reply-To: <2026032445-squad-breeching-23ed@gregkh>
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Date: Wed, 25 Mar 2026 14:33:00 +0530
X-Gm-Features: AQROBzBenohp_OlPgtO47fbc5MpbUM5ze0knqJbLu8-r4TOjAsUS2xzDZWRvuLA
Message-ID: <CABJ81bhLibj0_VzShMp_n7DCh+zhyHPAn=SV=9Oo8uy_+Kt-EQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] staging: octeon: ethernet: add pr_fmt macro
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 7:58=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, Mar 24, 2026 at 07:00:29PM +0530, AyushMukkanwar wrote:
> > Add pr_fmt macro to prefix log messages with the module
> > name for easier debugging.
> >
> > Signed-off-by: AyushMukkanwar <ayushmukkanwar@gmail.com>
> > ---
> >  drivers/staging/octeon/ethernet.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon=
/ethernet.c
> > index eadb74fc14c8..5bb8c303f88b 100644
> > --- a/drivers/staging/octeon/ethernet.c
> > +++ b/drivers/staging/octeon/ethernet.c
> > @@ -5,6 +5,7 @@
> >   * Copyright (c) 2003-2007 Cavium Networks
> >   */
> >
> > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> >  #include <linux/platform_device.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> > --
> > 2.53.0
> >
>
> How about working to remove the existing pr_*() calls with the proper
> dev_*() and netdev_*() calls instead, so that pr_fmt() is not needed at
> all?  That is the more "correct" solution here.
>
> thanks,
>
> greg k-h

Hi Greg,

After investigating, the pr_*() calls in ethernet-mem.c and
ethernet-spi.c are inside functions that only receive hardware pool
indices or register structs with no net_device or device pointer
available, so dev_*() and netdev_*() replacements are not possible
there.

For ethernet.c, device pointers are available at most call sites and I
can replace those with dev_err() and netdev_err()/netdev_info()
appropriately. The two calls where no device pointer is available
would keep pr_err() as is.

Should I proceed with replacing what is possible in ethernet.c and
leave the pr_*() calls in ethernet-mem.c and ethernet-spi.c as they
are, or is there a preferred approach?

Thanks,
Ayush
