Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516072EF64D
	for <linux-staging@lists.linux.dev>; Mon,  1 Sep 2025 13:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756733252; cv=none; b=f0bLW+q/1puoaCh1al9AnkGGUnhccpLo8VUHmdrwABCzuFTR4zz9W/0XZGAkb7xY2xY5nSo4xF6gvUBeDdGnN/YyFG9pqkPTzhu0wIgXNN+xeHlcnCYBSmTGe+HRlIsip8mvNO5JWPJrEcBmSlE2zKSqGXQ/vKqbHwb5o+8K/A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756733252; c=relaxed/simple;
	bh=fNzrzBOmUfUkL+rdi+LGLcpV5MZwfFh11U0nDpLmcf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sqC0MgAfybO1unQsVnmbuOVnoLQYLAreiTNzLrzZuV1nc5GU573qYkzwguFClFor6twUiW8w4lax+XlfhUx63W5WHBDAyl1FedrQlnAZE4lhAaYiKHRuHYejlz/xEZ0LkD01o3i44SoqBy0Yx8Rsftts9Piepoy1NqSSJnyM1a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PuwRvW/0; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PuwRvW/0"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-24aafd1c2a1so13603995ad.3
        for <linux-staging@lists.linux.dev>; Mon, 01 Sep 2025 06:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756733250; x=1757338050; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jV51K7A1stp0fFZW7EXTK5PI5DR7Ti0Q40zH30E1jgU=;
        b=PuwRvW/01Nhe/wqEQCZPOACpmliZrYDvJbpK9dAkWE9aE2dRheAprAjHNXG7WsrJkw
         Ve5F3l7W9entGADj5hUmoB+Vz+odKkQtT98viQLJJN25dlSffECtHXxfcxMjI+fkXwPx
         IzGCI8/STe4oDeOdOvDmHLBoiaZzQT4csL0FOpTIqm00jfjfD4l+bS6/iYq7exHuu2jl
         EtmJugQoE/assRaYHI8WDji6IwL8VRfRJCUJXPua9EqJhS3fSN1L4jS3M7Hyx8ZxgdvI
         WazrW9edsxkRW++3BjuQe/CXbQuD3p+YnaxprSnvn0lgdX0JqvYctaKz+HUxi4uiq++A
         bRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756733250; x=1757338050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jV51K7A1stp0fFZW7EXTK5PI5DR7Ti0Q40zH30E1jgU=;
        b=t88QpWKsGy0F0neEY/ROEagN/WQN41EZa5YvxfB0rptuUTnmDeZSQjOdRVEe29jIS+
         clyZj2PQU0wzfWMKj7tyhndOg1O9LfuiA0kBMdzlLNIioipGSAMAeJhKHbM1ZMKvUxWQ
         fINzAyMMeOiNFe+HKMIufxnL36RPq6kxHrY2DeYbbN1LW8FB1aP26jQD4rAXPbPV7Vm3
         jevnVFezqKmP34ao7iOy5+Uz4nFkURXjza+yXWb36Y49kCenJVRnkKdhpqgsKo9w2shp
         EDglECuNk0twY3ktkMiGruKukyzNFtnJbM+bMbYAqkLfy0cP9Hl8VHHI2J40ZlLU3NPg
         /SOg==
X-Forwarded-Encrypted: i=1; AJvYcCW3LareHHQ7pAbf2lFKQ7eHdDT9Xw1ieDXpGXQWfiYNqLMf8fu2Ltp6+H0YY3JoqjbmErpN51pBTwT854c4@lists.linux.dev
X-Gm-Message-State: AOJu0YzHVZe8/LxkGi05XdL3vJcU4ynLQEJbxw2EFQhmOd61pd56SVHG
	auofswRbXYAHvgL2g/gvJzrSmXlc2dzn0gfSTxBzCGeO1O2NBKPLKDc1Zrr7TeZRRFLBqCR10hi
	Gw25cRztNAyOu1YBfb9fkmyy3UToO0MfzolrcjGEb
X-Gm-Gg: ASbGncuwTZwGRGRkNOlBvYwcenyu6AG6QhKLm9W7bbNa3kSswiMwOzozSdkfdaJKlcv
	vCvWl5s1/NoKD++AybSarzL7nF5tyI1M2IOwhil+ZrmXyfxDojQ3+GyBHXR0QgnDr3vFCk9ovbV
	AMEL+xneyfXuqCfoWLq2u1hBuGVSdBe71nj50fzdSIcJKyAmXKp+qBmiFMsRPSKI9cv3WCgykJj
	6xyfIlPKO7l51QpIT/VeeNWI9g12XChAjAhOZ3h3sUvRFOQEzh5t7IaWKN9rwtq
X-Google-Smtp-Source: AGHT+IE69FGO0OzzXMwhaoMRS2q4IeFD8qIfXTVJo75C49xHY1FRbDwJQDcNEfx9CtcjyMh4JkjZAHZ3bTFwzj9tY+A=
X-Received: by 2002:a17:903:3c45:b0:248:f762:865b with SMTP id
 d9443c01a7336-24944b196e1mr101515255ad.28.1756733250370; Mon, 01 Sep 2025
 06:27:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250901091050.1935505-1-abarnas@google.com> <20250901091050.1935505-2-abarnas@google.com>
 <aLWS9QsvmzZW4Bak@smile.fi.intel.com>
In-Reply-To: <aLWS9QsvmzZW4Bak@smile.fi.intel.com>
From: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>
Date: Mon, 1 Sep 2025 15:27:19 +0200
X-Gm-Features: Ac12FXzx9PEJF0qZBZJFJPWNQrrMGW9HgVOcnLKTWsob1RafNAi2Th3uDaSy3dU
Message-ID: <CAATBrPFnSnxwzBQTOdbt0h=epXW7G5Rj8Sr_erKKzUzCH6xC5g@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: media: atomisp: Remove typedefs for basic
 types in vmem.c
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 2:35=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Sep 01, 2025 at 09:10:49AM +0000, Adrian Barna=C5=9B wrote:
> > Cleared typedefs hiding unsigned long long type, to align with
> > kernel coding style.
>
> ...
>
> > -static inline hive_uedge
> > -subword(hive_uedge w, unsigned int start, unsigned int end)
> > +static inline unsigned long long
> > +subword(unsigned long long w, unsigned int start, unsigned int end)
> >  {
> >       return (w & (((1ULL << (end - 1)) - 1) << 1 | 1)) >> start;
> >  }
> >
> >  /* inverse subword bits move like this: MSB[xxxx____xxxx]LSB -> MSB[xx=
xx0000xxxx]LSB */
> > -static inline hive_uedge
> > -inv_subword(hive_uedge w, unsigned int start, unsigned int end)
> > +static inline unsigned long long
> > +inv_subword(unsigned long long w, unsigned int start, unsigned int end=
)
> >  {
> >       return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << sta=
rt) - 1));
> >  }
>
> Also consider to simplify the above (in a separate change).
>
> static inline unsigned long long
> subword(unsigned long long w, unsigned int start, unsigned int end)
> {
>         return (w & GENMASK_ULL(end, 0)) >> start;
> }
>
> static inline unsigned long long
> inv_subword(unsigned long long w, unsigned int start, unsigned int end)
> {
>         return w & (~GENMASK_ULL(end, 0) | GENMASK_ULL(start, 0));
> }
>
> ...if I'm not mistaken, so double check all these.
>
> At least in my case the end =3D=3D 64 is not allowed while it seems the o=
riginal
> code allows it to be equal to the end =3D=3D 63 case. Needs testing anywa=
y...

Those functions works odd:
when (end =3D 8, start =3D 0) it affects bits 0...7

This should make the same results, will check twice if i not missed
anything and post v2:

static inline unsigned long long _subword(unsigned long long w,
unsigned int start,
unsigned int end)
{
return (w & GENMASK_ULL(end-1, 0)) >> start;
}

static inline unsigned long long _inv_subword(unsigned long long w,
unsigned int start,
unsigned int end)
{
return w & (~GENMASK_ULL(end-1, start));
}


Thank you for a review
Adrian Barna=C5=9B
