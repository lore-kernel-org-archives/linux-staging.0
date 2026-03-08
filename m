Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914CA28852B
	for <linux-staging@lists.linux.dev>; Sun,  8 Mar 2026 22:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773008024; cv=pass; b=e+tWkP2/U6khBOJmLz1wV3rmriLtjPbYTdRUtd/e9q6OkYlsnOqsSkNQogUcUBtym3DmNGTDauPLBbEUwWWhhmoBc7dPy1lNSs8ZUshVqmDGvcuU7vJD5Yeyzsm9NtT4P2tU6gotX2g+/Qw48EWim0tR2genMeIDDDt/zRPANLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773008024; c=relaxed/simple;
	bh=xNloVs6yOx1rSN8xWlshGdsR+uQp6/ScKdeAQSSOgJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BPmk5GKX7pYgT/Lc4co/CmJBp+sz97n6xdikY6jXjEdTLAsSvkOHzATf4QnQL+nD0VXS2DE+OtGesEEp6/1EP83buBd9pj+16UHbrgnVNA9S3uMmHCRob3dgwoxjoea+uVU9wYnZIbHxJ0HafxsPzbDaSBdApYu5qNbo4eIqMcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbC/gfzW; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbC/gfzW"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b96d7053073so192564266b.1
        for <linux-staging@lists.linux.dev>; Sun, 08 Mar 2026 15:13:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773008021; cv=none;
        d=google.com; s=arc-20240605;
        b=Ym1RsRn7ic/VD+9o9KDJQYwol6nsj7p9YIvBVhxeVAnm925mFAa50J8rUZFSQ1Hn1G
         KlDvBn2ZbOEQAJirYF2/j9gjjQ7euEvRZVX9YHAtdowYs09DtocloN5AqaZAfaZZxEGw
         tZjUjKqUlSM1ihd9LRTjJmegzKZ2yo2lJ1lbYnTM4YVB/ndD3NKYsi7Ua2NM4WldhBec
         d1japq1RzZOIGJW+3eNq3Bw+/KAWnEX+/X1aYkRjR9TeEP2BN+FcitI9HO2aFlTewugP
         xzdk5HxX81c0BpIx4bNv6KnUQtC3cKa7kB+PtKpiFZeeRmD/1Ch9/ajnHXB6n+2y2dsk
         dPhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LDhKTwFqhOYTwtXWK95p3D3irV3vbREvxRAD7ICMP0Q=;
        fh=nJDbSpIE1i2HZTj61J4LN7dxvhBzjzu76S5amXeQZL0=;
        b=Ne8MQ7lggB8PoEevIPWsEce8VjNYLUKAOPTJYpSYNXpuVWZpiOfJM5TujuOA8o/NEt
         1Zo0FwexdCVM1a9WDwnNdHff/NxZCxWcKaA/kK3T9uotexlIzmovuh9QmBHoVTsNhutz
         WKRyTzuMBwcPH4DQ3HEFuEju8bsWvC3Y0Bt6WDNw4iXSS/2BBJYkV0hxSlXHbvdnRu2G
         7pRoTISCH95QamCHGeRdTbUZOUexmUlpinwgE1xzkbuWChsy4/9zP2to+bqkaZ/kzApB
         XGBe6OKCSE8sICDM4pn+DDTTX622H7Gzc5LX1afsrUVJPcKaQ89Vuj5RdAy0p4O/jiFd
         FlXg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773008021; x=1773612821; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDhKTwFqhOYTwtXWK95p3D3irV3vbREvxRAD7ICMP0Q=;
        b=XbC/gfzWUhCDVyUfMLQlz5oe+KFKIz/TQtGlo6c3BCjTPmvLLl/kgyMLS56i3juTGI
         cmBSxdf1nX/OTqrK9ZyWW0xFVng2yrl19O0ppTdwJQKorQTYgmHIRio+0sGh3ImSwpT5
         TKjrTooxW73xLl6VC16A9Vz0muSfiAtlokAfkn60xpCMAKHDVUr5e3p9+Yx0k2e9v3oo
         pqYiunIzfugZ0VgXiWb8c2DPxQQWHbRLg4Jg9KvAu/gF1tdWUOs2GNu3T+YBsc27QGmJ
         6IGMgXE2qogA/PRtrm4z2/YkC9IziMMt91BQXS6MDN2f9wkjjnG7GapDyrn6/OdBwUbg
         s23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773008021; x=1773612821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LDhKTwFqhOYTwtXWK95p3D3irV3vbREvxRAD7ICMP0Q=;
        b=NG9FC3sbfUBrxZ+n1MrEtHFC7hIFtOpro/kQAQaTyIuRiosg10cRKsUsSiXtCVZiVq
         HOMh92JmvHDmcNR+xH9cRRt1E55jN9WB0OMljFponolfZNGRzLtQYEflKFrqWu6SkqOx
         2AO9HqoaccfQwPH9i8/FOWIKA1Kd0SQAyHcbAF0mkGH4JSu/4wvGEWyOqhrdHXpACAah
         KsptNCLfF39EgzhWevyNzepzYzfXnBThcR1mL3cnqfQE9vX6wgnwpLv7T5nHtJ9hEQiK
         I+XT+Jb9m7KYFNkPlvb6kpTarx2JS1YeLAvFJRhe42d5DcFByWB2czXu3nFrnACome0w
         SowA==
X-Forwarded-Encrypted: i=1; AJvYcCUz8f/cD6S1jioZQ+wREsmlsU0JVknWL4Pcggl7Mcm+7Kpa6NCgLNsFIpUtrw2O7t0z/6miD8Cr2NDRS000@lists.linux.dev
X-Gm-Message-State: AOJu0YySNvmg5dpLGcjv33hiPdZTycrPRn/pUXo8gL5QKOqcCYGzI//G
	mC7fyC2Q3Mfd8LPYv2Zm++pSJQfNKp8hTwEXy7jLBQTpslCvYQF1bXrPGTMqzgnsOhbtlza8F7h
	62plp+7x9rK2UztFzMikbhl5JUfkFHks=
X-Gm-Gg: ATEYQzzu7Whls2RqIXZ2QwEZKiCWQ1Ir8pjhmWNiMDZZMkh6sZ5Igz0TIjDmMSZDnbX
	2w4BzrcIK/48IkntdVVFtqUtyNBBWotVyhz6PFXfk+ixLbsaPZGnMYcx4nykkumaU3qVtL7JHqA
	5ckf/H+J0ck/rQnQID9qIEGL8+VUaT0u5tp74dDCGHbV/IypDa6HAY/UwqSiyL0/iu94+rPHEDq
	bl8pp89GSUt4P+SATj4CqNq/+5h7ZFLYVcQKlYC0wnd8NQCZhHMro3GBLTaX6iTW6lD6HcXCANp
	f/GwkCgpBjbtjAkQXrpyWSm5fhhsPqrRauBP5jWVP0MInwyiF5vSVhNdYD2xelpx6NsKQku1qiS
	RUoQUQzc=
X-Received: by 2002:a17:907:968e:b0:b8f:f136:20f6 with SMTP id
 a640c23a62f3a-b942dbaaa82mr585310066b.22.1773008020677; Sun, 08 Mar 2026
 15:13:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308215840.31197-1-laurentiutopai2004@gmail.com>
In-Reply-To: <20260308215840.31197-1-laurentiutopai2004@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 9 Mar 2026 00:13:04 +0200
X-Gm-Features: AaiRm51lgjLYCWGmF6xsDsxoigCuuB_TjArwvWcdHeb2JPXY3T0nR31j6HyYJTE
Message-ID: <CAHp75Vd0O+Bj-LJWu7JsSbacdcBmEjp4aArA4fb6Kd4Qge_BOA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: comprehensive coding style cleanup
To: Laur <laurentiutopai2004@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2026 at 11:59=E2=80=AFPM Laur <laurentiutopai2004@gmail.com>=
 wrote:
>
> Clean up atomisp_cmd.c to comply with Linux Kernel coding standards.
> This patch addresses multiple checkpatch.pl issues:
> -Fixed block comment formatting(trailing */ on separate lines).
> -Replaced hardcoded function names in logs with %s and __func__.
> -Fixed comma spacing and converted leading spaces to tabs.
> -Removed redundant else branches and void return statements.
> -Merged multiple line dereferences to improve readability.

At least some of the pieces may be split to separate change(s).

...

> @@ -1024,11 +1022,9 @@ v4l2_fmt_to_sh_fmt(u32 fmt)
>                 return IA_CSS_FRAME_FORMAT_RGBA888;
>         case V4L2_PIX_FMT_RGB565:
>                 return IA_CSS_FRAME_FORMAT_RGB565;
> -#if 0
>         case V4L2_PIX_FMT_JPEG:
>         case V4L2_PIX_FMT_CUSTOM_M10MO_RAW:
>                 return IA_CSS_FRAME_FORMAT_BINARY_8;
> -#endif
>         case V4L2_PIX_FMT_SBGGR16:
>         case V4L2_PIX_FMT_SBGGR10:
>         case V4L2_PIX_FMT_SGBRG10:

You need to understand the code you are modifying. Blind follow of the
tool that has tons of false positives (checkpatch is a recommendation
tool, it doesn't mean it's sometimes correct or useful) is not good
idea.

NAK.

--=20
With Best Regards,
Andy Shevchenko
