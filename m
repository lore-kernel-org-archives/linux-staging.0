Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B040335C1A9
	for <linux-staging@lists.linux.dev>; Sun,  7 Jun 2026 07:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780818190; cv=pass; b=FT7TIFiqQwQ+nuULGqXewwBS5cKMg2mFq6WzH4w1spjvnCUrAaVJjEoxRHC4uEn0bf2N/e6F0/MFDjnFEMbY0ITMlBaeZjKRyvsSn8/xUzF9NcbU1LTcbLCUdQUaQbbvD6/dsiRdERcJMtnJcP6J/XBcbrvN/FOvgEIDTbfB4H0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780818190; c=relaxed/simple;
	bh=TgNqtslVOWQaI7JpBjzhjj0WSlRFelSr9zDeeTbQVbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i5YP6McwxkK0h3I8XIXjh0JXmSXTWktyGaFLvWfdDKAJvCafUjGcWaGi88sOYFkz3RQket0IlC3Wo6PT4N/v4GmcwKIZTILL/2uLfO0dknDIehvXEyoxONQTyU0OH/nLkpCBIs+Qp+8AbMsKcfpv6airDvt6+mUZk0u+VaCt2oI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eE6yZM+l; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eE6yZM+l"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-68c1630159bso3591880a12.2
        for <linux-staging@lists.linux.dev>; Sun, 07 Jun 2026 00:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780818187; cv=none;
        d=google.com; s=arc-20240605;
        b=OY3SNllpqujq83mkeMKPAsqWswyt7WjVqCj6H5lmzAKBenIVIkgj5AhmHYtIfc2pwg
         Zff1wE9JWI9qlZfPH8oIzhmcVbHHrQbYDe6/HqzAGj65BAavKO57peyTW3xRpFclwkBq
         9HYFVOYd8tWS8CmdpaRwUV8+OLLyv0Vu+E3+yAvU/i/sBTadFb7HEXnFgR26kThhOtjK
         PXkHsf5gdVHopQa0zSbfdH+pnAmRQd1m+kI/lGalFZ/3LpPd9Oz5nkj9U9bwTVKKGKed
         g31i7aIQHt4EHDS9bojPEnsM0BtrGxwG9G+eEbaFg6PAPuwouwjDxXCZ3ZrPAbjHZC5t
         ex2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TgNqtslVOWQaI7JpBjzhjj0WSlRFelSr9zDeeTbQVbM=;
        fh=pJJLPfLVVYNtDMOdgSZ9VhR2hnQ7/2seUcrk23saOIg=;
        b=DGBTc3nEaclS/DLp2LMgZxGCtCPpCTDLunlGF4ActUbS8GoqKuxGeHuoBw+hPDSq7K
         BfuBQqb2U8co6woyXWGfhvIJ5T242K6H0ra/jUKYZAi7evoTrIv1PZc1oZx+Sd4FMZ2S
         bkiHgetE3I68D/70hDdrHmNCvKr/xQYeU+fXST44yCMRJqIh8fbTSbSUbeVyWMOaSOKK
         KUGYRA6L8C1ieEd72HNRrCd4F/7ui8IcCTAQYHfe1894bYbGNVAhDNRfnVSSjGcy97rK
         W7NpzxRX/vs4bcZWmuaN+EAJT5YL67GVoJp625QFW/kYgoe6wsLEAp74aKK2yLlZTBEG
         iSsQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780818187; x=1781422987; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgNqtslVOWQaI7JpBjzhjj0WSlRFelSr9zDeeTbQVbM=;
        b=eE6yZM+ldZWLs8KRpAyNZwBOB6VcMmez1qzOG52u0SIqeNt1m06y+Fc91GKXIDmx/0
         BbugwXbZdbHe6ZQJvalU7+Q4vJgQksjyrYvxgLmYzcN06bvoh1wsjsrZE8NQ4E0hGZbe
         muFy+UW0LRT83fFaEJYqE23uQPQhXZJ+38QyeLT/QgjHdGCeAqQ0xo8ienEK4C5up3ZB
         JFnafVdfbj2oAlXoCOxkkQJqZJeiQipXmJyS97UxI7YYahvfNJNEkyT16/QUqTO0h0C8
         0NCm2aYzjIKDynGBoPkJyFrFRIc9ZfBLtg2aeEZ1r7/dunf/UF8q8D2b7zcTNpStBkzk
         C7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780818187; x=1781422987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TgNqtslVOWQaI7JpBjzhjj0WSlRFelSr9zDeeTbQVbM=;
        b=rsYaXCO/XhWbr9LYvWoUtL3ENoUDwT+YKJ4elHnNK/1Uk9FTA97w7VbZ8muoVaS3B/
         f1vtpMrIf4HMYPj6vi/xj7teR8WI9YF4cM7fnCbb4X3gm+ciRsOJkM4+Efs4ELFUqQV6
         Zj/Upw0CeMgtHlra9uK7T/z6ieBIP0Fu82kknKbT49Wyl59IhhJ5/ElM1F8gOQIzyLaW
         +37Psl9EiLT5pDmJJrXj93WZRpuCT3B7B29JvY+zz+w/pfEcweGPgTqUVxB91+roEMGG
         +Map2jNNPojBO3eThXaZZVnpr9pWCQkj7rTWWMXAUisP4F7jA+Jnb9CR5En092fW4LW8
         Y0Sw==
X-Forwarded-Encrypted: i=1; AFNElJ/7AJ3OmjzGxBNuKbOtILwOqeuVMPNejV1WMBGWciGHqGmJ26Hvmpto8bfV96nK1PXXAHZfikZWdmeOPE81@lists.linux.dev
X-Gm-Message-State: AOJu0YylVRCfAlUHD2DmNfk/+CsoUbiq1gEf9hio9TraM8cgeuHGM8UC
	AAGFqr+5jfjwXjT2emhrCOZpt/xuhixaHZpFsPf70tPxpxvgzYwAQt8GnMd3pOisFPfq/hglqp5
	NDtNVhRfSfKa/vmI1UgfNrtlIsZCrmBR5+QKKPlc=
X-Gm-Gg: Acq92OF3fCEdzcV8l+paKgVcuAo7r2Hb5bhLj6GuHfvwY6PT/igqHu0pNAgzVBWoGcL
	F0fTer//mCPQWJysxh6dULajH8COTjw69QvHscxi/dYBmN1eat1jQRAbFTEJpDqQ0voYcHrb9HV
	zqdj5JxU7zKZUGbPjvH946G49bhgf2Abg6uf6lvN3xatKAAwymTlTjV0flxhoL4wuOnETrgH9Gt
	TJjDEJ081ObhALGEnu+4YaarGg/r0moHM4A0AJLRxtSmWHC/Kxkr8CueJ/3u44+YSNvGKdj+ELo
	NcdO7UcuUBcCL6Yz5E7foRwlsf2uat+aKC1PJqrrYgqeOXltLmd7k3GAGA98KdEC0kwBvoqte4f
	q13btYU2xbqvjoT2m3YeamHzgG0fTwXICnAac5s+cxlP+WamsNE6Z/XL/bvuROnw2A4pgo4UkaO
	5zDxE=
X-Received: by 2002:a17:907:96a7:b0:bef:87ca:aec5 with SMTP id
 a640c23a62f3a-bf3739fa0e0mr567495066b.47.1780818186761; Sun, 07 Jun 2026
 00:43:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260606234427.9902-1-linux@notrealandy.dev>
In-Reply-To: <20260606234427.9902-1-linux@notrealandy.dev>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 7 Jun 2026 10:42:29 +0300
X-Gm-Features: AVVi8CdUXMbcmABhYEwV86mzX6FLo8NwWkKEvQxLcoB_FgApNOTYsjY_xA7HtlQ
Message-ID: <CAHp75Ve_U0RmodQ8FzOXuSs95FwzN0fvBAQ5OX8ZTMp_U1PQsQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: prefer kcalloc over kzalloc with multiply
To: Andrew Soto <linux@notrealandy.dev>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 7, 2026 at 2:45=E2=80=AFAM Andrew Soto <linux@notrealandy.dev> =
wrote:
>
> Optimize memory allocation layout in sh_css_params.c by replacing the raw=
 multiplication inside kzalloc() with a type-safe kcalloc() array allocatio=
n wrapper.
>
> This prevents potential integer overflow vulnerabilities by validating th=
e array size calculations before interacting with the kernel heap allocator=
, aligning the driver with modern kernel memory allocation standards.

Wrap the commit message around 72 characters per line.

...

Is this the only case like this in the entire driver?

--=20
With Best Regards,
Andy Shevchenko
