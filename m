Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132503BBFAA
	for <linux-staging@lists.linux.dev>; Wed, 19 Aug 2026 17:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787159239; cv=pass; b=i/QQBHZyzdH1bk4s0zBLWUEorXUvXmUnPWzwg5+bwhZn4q4hFQ2Y7rqwBw+gOOlnnHM5yyw6sWDsFq5DO+0tEC3n/p4bewIV+Fa8U0aZfR0ZvN2FT35KmKa/mNydbx37PcIqM+dT4fcJvb0Z1+V8ZfD2ZHEUNbwJj6eUrkjgYKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787159239; c=relaxed/simple;
	bh=fSAJ8Sb2eIq4+8sJL6s8v2TvLC008BJj5Lp/c0rDYWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aKUKLNLVIVsKvhoDYrKScaMr1wHsgUKU+LnBjgczNpwMh5W7FwvJ7aEbr2gprP4DlCPblJ5uhbJDtC5K83Hp0fwfgnpR80rvh7nSzbTSUtuSErser7/P/YIHu5Wysh7iu4AsEqEvzGFFI+RBHtABejvIu3mT9XG3X0IY4R51kgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLRUavVq; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLRUavVq"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so2106848a12.2
        for <linux-staging@lists.linux.dev>; Wed, 19 Aug 2026 10:07:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787159236; cv=none;
        d=google.com; s=arc-20260327;
        b=qrFkgl1H+CBPIkAjnhMoLH7ocf+mF9vh0hlByKVfKuOUGKFWNHe9ikR/w0G3vtJhDS
         9vJa6zXEA0Soe94kBlc7kZzLfsVet79J4Le1GPZW2fKHPM4A5AWY29DD8v4Cxct6GPDE
         oo5t8ELlcI7DxdGhfJ1A2yiolqXpXM0XzXb9ZRKb3OAFk8j2RI5JL+geU7V354eMlEYV
         d4HBg7fYF3VOiJlLfBwvbtF/1QXuJw048q6itIk/pRh0ekk+vsTNRiSJhe4E3255HcIx
         syQCmGmFWyUr2lX6KSQ53+lrC16JQk8nML1kCF3+ABaPPV0sVc3oNQymfeZ5iSngqA7Y
         EqRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jKlJ/iR1cPNwjtIJybzvfRzDBetXP7ZIN/hUGlzWzgU=;
        fh=x66git4fyswOUATNuK6jYF+esvmDS26ej1rpc9xHoPU=;
        b=pK/vpBK3O3Euauxuaf9NExgFrG6zYDSwXmSnARMWcEUkmgYF5Uh10ARwKPTRsQ51bP
         wPsAMb3zDRdXtawfUxc3eBJ/T/HDT0imuYRnypp920HK/ANPFlh8tL2JtnI3LUZM7qmD
         hUShlDRjvGCDoDOV0lypJna8phpMy2XPeKgstr3DesQUY3IKeFwY2hGNoKjZ6mbzEc9Z
         GR/unf4GtXI84KmiGNfCe2IKw7gg7Bd2iJ3M3HNgkK5d7hkmt05P+2qI9KllEoFAMkDF
         L/Fdvhu34NHmLuHf1D3qufM6HFAMtDEisfBIeyNK+GjvKE3x4b1K1wqmnfGyiIrED6oe
         FTWA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787159236; x=1787764036; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jKlJ/iR1cPNwjtIJybzvfRzDBetXP7ZIN/hUGlzWzgU=;
        b=DLRUavVqXKwyJCl7Wm5H/EY6mm2Op8YUVOMP2/nQd4KDEBrTKcjczM4FRiSRYDnlFT
         JkPzpLJMEua+QVtVCBT60ZLDAra58OmBcB+40bs/s4I0YurmNXjzMwzMLR8mP0cKMolC
         xmEPOceYGmHrvMoXf6PyDT/B/EzlRw9gw6WWTRCUcHTqf7zP8wxqipbITrHvtHyZgXN4
         JAGFp/BwndwL8/PQIuBYSfImqJRBU2mi2yjNvgnH1IDwF8k+kdRV6ss++ohaXjlu9Vln
         cOl5mdz0EdS8YsZ0gPGeDATM5TQb1C32n/kjMpj0JO/RlSJO+wC7NIlgQGUpstpdpr0b
         75rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787159236; x=1787764036;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jKlJ/iR1cPNwjtIJybzvfRzDBetXP7ZIN/hUGlzWzgU=;
        b=P7qURG7UXl5v718dKTkuBDyQNBYEPUi0vIb6Vi12/Ok1VeMH2wr0s2u3OLEXjtAjbS
         Z/Qt1AufnoON2PQW/LBXwDH0bk50d8L7t/OyzE5D69No8+cosC3tBIEuKSJyTK5i2ShD
         CdUuih9CgvNaURe1h5pB/JBrd0nZLOzWS+S1OH2ULvP+ngLqvSroE5l2+1gzGmJROzyM
         lEyyuYIYWnUkQ3zHrN579yYLj9FtbxWNCn0HtXXIfGM249LVNPox/QkySNGvQBjQvLj2
         66BCPoO6YZNjomcxjJc2V76Oq0C6Im1jt8eQ/qwxclu4/USh2/3IvS3rRIEdz3jQP2dh
         uVMA==
X-Forwarded-Encrypted: i=1; AHgh+RqkDeTL/IyZJ8cIowDHLMHxRmwQvfdUEAGzp9wGXHyTuWfjyRMtQ8SHOZmLMG4agitfggMiKpKEFff3rGyX@lists.linux.dev
X-Gm-Message-State: AOJu0YwGa3YKDhFOv4CnbzIcbS2LR7E9lihndfGN3QlAZTWypFyp7nVu
	AiT96akNk5VDLCNPpqFV6mKVEALpm1viDBcq2TSFoPRKI9Clxr1Fz1vsdb+G5lTvHxy6uASROvo
	45q6TehqUrfGjNxLXgnxHqCzU8W8Zobk=
X-Gm-Gg: AR+sD13dByUP1cni3pK09lEOvJsIBLD3iqIfkfzEi7j66TOVeu7jfYrHcqJEl8Arn74
	epDyGu+Eno/5xnQ/Ccv2EVjMr09eShOAz7aP8hTQ56wKM9wqLEZePFLDdn2gLSPRcy1qixtyjRH
	BsZjWSVuoa0fx6JCePSYa9htHv0KfV2Op4W8ke3QZKwqER+YG/+JK6yCOVhXe+vV6Phg9zCGVnb
	NdYfRQfCgiU3tuGSgEYS/YjPt4toHJtt7K994RPGu5L/c4Ut/X3/3gKre8r/XlDZPG9R+HCk7eH
	q3V0s1qTrOqVQiyb4iieykNeuIzfdrEb6URp9hy/FFri6FZTUraf50zahdjQDuamgr7Ttkkywfx
	WOgk5wmbldHwFwcNQ9G1CH6/DLNi4j+zIAR0jsF3S8K5waahIAXexGcDZJuFHgebDjkz5f3dtan
	IRFUWMNAwBb79wMliY/AjEOkq5Q6W1sw==
X-Received: by 2002:a17:907:d26:b0:c16:84dc:9607 with SMTP id
 a640c23a62f3a-c242e242a7bmr386522966b.19.1787159235944; Wed, 19 Aug 2026
 10:07:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260819-fbtft-core-scnprintf-v1-1-842c0603634c.ref@yahoo.pl> <20260819-fbtft-core-scnprintf-v1-1-842c0603634c@yahoo.pl>
In-Reply-To: <20260819-fbtft-core-scnprintf-v1-1-842c0603634c@yahoo.pl>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Aug 2026 20:06:39 +0300
X-Gm-Features: AcwNN1XtphdklIb1Xh2EgzEMsoGcQxR0A6TVYdMP1qLtFEyfNntG_muiTXDLy_c
Message-ID: <CAHp75VcGmmz6EZYjG871V+sYmJn=iGOFxj+D1oe4rtguWkipRw@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: prefer scnprintf over sprintf in fbtft-core.c
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 7:45=E2=80=AFPM Tomasz Unger <tomasz.unger@yahoo.pl=
> wrote:
>
> Using sprintf has potential for buffer overflows if the formatted

sprintf()

> string exceeds the destination buffer size. Replace it with
> scnprintf, passing sizeof() of the fixed-size stack buffers

scnprintf()

> (text1[50] and text2[50]) so the write is always bounded.

> In practice an overflow is very unlikely here: text1 only needs
> room for a size_t value from an SPI TX buffer length, and text2
> formats three small integers (bus number, chip select, and
> frequency in MHz) that always come from real hardware ranges far
> below the theoretical worst case for their types. This is
> therefore a defense-in-depth hardening rather than a fix for an
> observed or easily triggered issue.

This paragraph is not for the commit message, rather for the comment.

...

>         if (par->txbuf.buf && par->txbuf.len >=3D 1024)
> -               sprintf(text1, ", %zu KiB buffer memory", par->txbuf.len =
>> 10);

The 64-bit number takes up to 20 decimal digits, the rest here is 20
and one for NUL terminator. 50 is more than enough.

> +               scnprintf(text1, sizeof(text1), ", %zu KiB buffer memory"=
, par->txbuf.len >> 10);
>         if (spi)
> -               sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->b=
us_num,

For this it might be worse, 3 32-bit integers that may take up to 10
decimal digits + sign, so 33 altogether and the rest is 13 and one for
NUL terminator, so still below 50 in the longest case.

> -                       spi_get_chipselect(spi, 0), spi->max_speed_hz / 1=
000000);
> +               scnprintf(text2, sizeof(text2), ", spi%d.%d at %d MHz", s=
pi->controller->bus_num,
> +                         spi_get_chipselect(spi, 0), spi->max_speed_hz /=
 1000000);

Taking the above (and if there are no compiler warnings currently
present) this change is an unneeded churn.

--=20
With Best Regards,
Andy Shevchenko
