Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794051665;
	b=gM2W0/aRd6yeMVOhTC9NLBwrTgd7+QlB2A1rgyXs99DHAgWi1WbkCoTWNcM9yK12OstR
	 3X3vjdnT5wq59PvAVzzFgECk7lB5hBhSPKNOgYOnkGZuMYyrsdC6tu60m/uEw4fO4O3ZH
	 bikNtP9NeFA0mYUo9Tq+t7KDKbtMrEPBRAQ398rw8x802GLWpQth6Ykm9youI4iJCx7Hb
	 BTjlhs5Pn5uLRHziBsuoO9DSG0uyQdBgEva0/o1ZcnOUzF5hOp/NHq0bMBpO7ZtZ1T0hI
	 p5RyM6uwOj+Vwp03DuDCFhXMt5a531kwFr3Rq4au4ptx0U3qrH+hKJG9VbaddbS0iNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794051665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6fTH6XXWW1XsqnJehduXCj5gyuC0EEdV5T9p2wxK7S4=;
	b=bLyBPUuaaby8xmH5JJFyyN/oN8440a1WD5hsa4kUxU4I0HXH0NZ7rQ8Jif9UQsUBQVRk
	 AXp04kPH4uRNHV1fPVU2OGi19FZNNYtFNTR1Nds323qOMIzMzasWaQcpQUC3eOaZozjdZ
	 AsLwECGCO//epoTqyqjUevM97XXQ9SmW8WwhfIeAYejxvT8HHNOfG4BjZu/z24ZVdYePL
	 XYmUMk1mqQuOxqmBVhQ9fXUPmHUxtaUiwkWjz44DMTP3T6ZWvjxRH3GhtypN/wlLB26lO
	 2XBsQytnHC72EIfhRztXuDwvWIZhb1/Uv0bSooTnmR3vhmCsTrng0cXCvbSKei8IQYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jY183eFp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493E8606A32C
	for <linux-staging@lists.linux.dev>; Sat,  7 Nov 2026 11:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 493E8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jY183eFp
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-675617e81f9so1200177d50.3
        for <linux-staging@lists.linux.dev>; Sat, 07 Nov 2026 03:41:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794051664; cv=none;
        d=google.com; s=arc-20260327;
        b=I7i8e5qIM8Bmdb64GFTSPoXSmSQifmecHxp60onEBl8vtmprvwtsDgautID5vsKcWH
         +it1iC3TdJDUJ3q70r8LL37iLFLQ9o8F/YtbSMx5Cof6M9jlybhky1Dzv1y0PVO4ffLy
         dndES9K10zDfc7GPDiFvDS1VVRco5iAqAwrCvdTX1rcOa00mRL7Rv8TcDouhIt9dsoIv
         fcj97P+wK1FKlnWnvMlnESQWlrk+lwn4MhBpUYMmUFWrCw2LkD8HFxzfwVjQqWZ/7C2r
         UTWJi2l0Jnl6A8oTJPE4rvdao354sR5OIdRkej4s69HGj4pwQnmr2KkkrPo3a+oeqmSx
         TEXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6fTH6XXWW1XsqnJehduXCj5gyuC0EEdV5T9p2wxK7S4=;
        fh=XinN/WNOIF3Tc9C1/K9ItKUw/8iT9moyHsrnQrLUcrM=;
        b=QA9DEEtQSf7p0GpSo3ccW/RROGy919Yy77TwiZ2L/7jL7jW13459uqPg+Z+QJMiIZ+
         G99f0i21TBhcbxHoRws2k7cga5UV4h7CXcwjGMUbn5JX+UF+YOEvGU9N/Vyif4UTOgEe
         Vp+qC8T466rIIrjExokWWKeOaB0bFJdHJB5HyzNdxGvfuEx636l83IhP9iGCkzuxiypf
         KpOS5qyT1X5hH5Gu6LaMO9zb9zTwf28zdWZFpwmxUxduXdTicMVJCvb2HUXt+zib1VPu
         kFHdqXN93AjruRyA8mCXVixF8aZOj96xA4zrmEuzZVNC5BbRUMfS2y3ySVcjcfr5mlmn
         6FUw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794051664; x=1794656464; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6fTH6XXWW1XsqnJehduXCj5gyuC0EEdV5T9p2wxK7S4=;
        b=jY183eFpU6uOg5qeK6VpxteyRG/2c6Gp3C1XJ734+C78Nd1CAYVhiuKhFzRhS0y0OR
         hQKCZSpLnTz2VYEWqgi9V4BZKD0pPvinYr/VFMaMJgm1hJNArfsi435q5CAzv5WBmXqq
         2QFH5PiTR4xf5YOkXgRA7avvsildQe9cVjK4iMqJ5GtjpZa0RTyK8aUH/tC8j6xVGq7I
         dOQXKCmpJuozYJ9B230chhMgOv64+seSjc9DRJCmzZ/Na7l423lpDplmj9RVfkD5YWc0
         jFLGuY1USu6tU6FpMknRDAGeCzz237imKlYYOhqDzvb6u0JMjRxMxsCN5PVmjpKfeUR3
         dYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794051664; x=1794656464;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6fTH6XXWW1XsqnJehduXCj5gyuC0EEdV5T9p2wxK7S4=;
        b=HIwIjNajld2TI6ABDsm4fPQEq26PdDH7N2vDDnyXfLTntf+iEBHDuGQKtAPA3BPJBA
         Od9OoArZcnK9dmMHw/erJ7ODKUau1ajYA6KKM8ar/s0atTsL/qyZD/09Hxzw+SpgPEYt
         /6a0MRK0PQyY36sd/dT0FN0xynzodhRo7n+JAIzFQY8Y5kx/lH8z+QNIhKRININ+1Wne
         27cjiJ3GQdKE0Ce1w7t/FPG9h127dxjDepiCGxCVOBYFeoCck6noWYk9vAVJEL39zMML
         leTD5iWCHYoNK3j9EFn3KeOHpBL1Lv7qTxyJGXsiI1s+C2To5r/6D3EAxOLPcXYey2mS
         pyfQ==
X-Forwarded-Encrypted: i=1; AL+hErFm7oR5Yf/Xj7ojNXhL3tGQnOsTVp0HmmLtMineUi6/Dcy8XCvwtytglw5P3+MeiAg3wKvXgrjpoD7KnAjj@lists.linux.dev
X-Gm-Message-State: APuU4Z/DwE1nwrrajz+bWtcvCwjT13MLgNzJMpPBZZcGAKNAWcTnBPW7
	j4Uw1+vTdCQV//woSKCsWeVPEvpqAf8fSmZpzUnIa2Ktxcf1wGzbPK2lUVQFuipq0QTN7POOwaQ
	Z3l601l6nbOJSbogd/3sGdcxmcWylNrk=
X-Gm-Gg: AYBFou2O3Bg6SJ/b8k4SJBI0LVScotcvhqsqhpTddS1ltaFP+cPfrg/VwSkbjIslh4c
	6C1WhzqSwRMcRDzANqfy12JxxjoT36Lc3cPrOtea7Jlevkqj7GmAQuMrJR+JLmJpNr4OIj87gjB
	T7cPj04QZt+VFW/HC7Ow4ZFSNt6hJOoA5POMsPZNA1XiIra92PfI37Fv609Dy0XDPloFQtfFDaI
	bJ43KtdDGj7P1jahhi7BejzpeagSmoA2fgFfYZzwSTGYiEnI4BFL9xTEjAWLlghBdTc5c2VkEgk
	keHaV0qUVmDdL6GxGGsP63fkH+6Bpn0xzYT1aiy+bzJW7ImhPB3ZBYFeKcs8D4TFlub2EDXvIDV
	olJxZVn3RGW81uVsxxpA2/GSmPj4mtQ8MpmJxwesW7CN0rdivkp9KaZANM2Kq3/U4ZUfjjA6bkS
	LIRqYwzjfhh8pl6TGBMF8t7WBEa3fyCEsk2TPQg8sxNeqxYOwz0nj07vu7ww6a80fMtxbQpXrWP
	3C5Yy2XU7MiO71Bk05WAG8GfZuGYUAs8nsTkK/AbWjYBmk68jNS4P/NjOQY0A==
X-Received: by 2002:a53:c056:0:20b0:677:c18f:7257 with SMTP id
 956f58d0204a3-67c141e4301mr2310364d50.23.1794051664343; Sat, 07 Nov 2026
 03:41:04 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105201154.37294-2-matyasdaniel006@gmail.com>
 <874idv2bol.fsf@yellow.woof> <au4J-0GOUuueHLZe@rabbit>
In-Reply-To: <au4J-0GOUuueHLZe@rabbit>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 7 Nov 2026 13:40:28 +0200
X-Gm-Features: AclHuK9O7PUmgPlP4zevfIOy9d0EnpN6X7geLvTsMFUAaD8AWKettmZPb3yRw48
Message-ID: <CAHp75VedGBBd8qk5fO9-DkGwmuLQk77_igefAwTbrfcPCMW8Fg@mail.gmail.com>
Subject: Re: [RFC] staging: fbtft: Moving fb_ili9341 (and others) to DRM
To: Daniel Matyas <matyasdaniel006@gmail.com>
Cc: Nam Cao <namcao@linutronix.de>, dri-devel@lists.freedesktop.org, 
	linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Lanzano <lanzano.alex@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-fbdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 7:10=E2=80=AFPM Daniel Matyas <matyasdaniel006@gmail=
.com> wrote:
>
> On Thu, Nov 05, 2026 at 10:47:06PM +0100, Nam Cao wrote:
> > Daniel Matyas <matyasdaniel006@gmail.com> writes:
> > > Questions:
> > >  a) Is removing fb_ili9341 acceptable, pointing users of other ILI934=
1
> > >     modules to panel-mipi-dbi? The KD233 node would then have no driv=
er.
> > >  b) Or should KD233 panel support go into a DRM driver first? I don't=
 have
> > >     its init sequence or physical size, or the board...
> > >  c) Is removal of all of fbtft already planned?
> > >  d) Several other fbtft drivers have drm counterparts. Should I inspe=
ct those
> > >  to see if removal is needed?
> >
> > IIRC the main reason fbtft needs to stay is because it supports paralle=
l
> > interface which is missing in the DRM drivers.
> >
> > Nam
>
> Thank you for clarifying. However, the fb_ili9341 driver uses only the
> SPI interface.

Only two drivers use that macro, indeed:
drivers/staging/fbtft/fb_ili9341.c, line 136
drivers/staging/fbtft/fb_sh1106.c, line 173

> Is it alright then to move (or remove) those drivers that only use
> SPI interface and have DRM counterparts?

You can suggest removing it, but it might break some users (yes, I
understand that FBTFT is a staging driver), but doing such only for
two out of dozens drivers seems to me a bit inconsistent approach.

> Furthermore, would there be a need to enable parallel interface support
> in the DRM subsystem?

If you can do it, I will agree on retiring the FBTFT drivers that will
gain such a support. I can test 8347d (IIRC I have that panel at
hand).

--=20
With Best Regards,
Andy Shevchenko
