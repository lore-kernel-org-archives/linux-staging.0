Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76A71C5496
	for <linux-staging@lists.linux.dev>; Wed, 27 Aug 2025 10:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756291543; cv=none; b=YYpZ8gyWt/D/90aho7FSMvt2rjbmoXlv8TU+6fI6eA9dFTlX23u4Ht72fjsDE8GXWDeB82ixgFHtjUivnlVa00cqbIk5r+etiyVGRntzaPA0ZbqaiRBcODk3qOXaMgorWDkKuorIxtT9RUtRW8LYNDGfNpqrrYnnC5tC2fmrSnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756291543; c=relaxed/simple;
	bh=ZpGh8FURfNBFRxpWoGhtdsBg8oR3Yo8/IMlZBZL39CQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X7350c2gr3EgHenQCxbvBKYCmxRrlVkyYugYckxdP7RklUeCL9rGhaFO3vau6+QVI7LlN5Y7lkD3ACz8bwOfjbUSqo9tukvOm9EUcFoFAuLJ1oC/7Iv+vMX1oMfYnRsYm3f+cLmOtqmQqqiynjV9NEGDY1WIbyDMxoT/HD/l8cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LiG4lXVP; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LiG4lXVP"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3c6ae25978bso3389485f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 27 Aug 2025 03:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756291540; x=1756896340; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywFtIUPgkefEyFmx2NKt2azET6uVxnWh9aDDLWNj8mM=;
        b=LiG4lXVPi/jyVY6C2WCP0PECbXuosEL+68ghUzn5GduKbHeSKRLuyx6oczfECE0OTa
         /XHXzO+UMvDH1zFFX4khe3neEPpDSkvFd+pFtwTr3wzVzjexRtaEGixkSnf944NP4xpL
         V1Cueg/XXg2ElNCSGlej0q5RHRlRsVC1xt1hd6C9SFitVcpPCy3wrMrEaZ4N4uG+VcXV
         ChDQHYlmLcOVFRY21Gfi7SIvTczyFIyUDmPFy2dHhb6GKRo3mXTUOXyh9ekwHIBJI0NP
         oFru6GwchzIYF4Bhefi6AYqlAGwHqF3upvyXuZx69ooj3TziCV1H5cw5PXN+CudxbmRE
         k/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756291540; x=1756896340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywFtIUPgkefEyFmx2NKt2azET6uVxnWh9aDDLWNj8mM=;
        b=s4n509TQAYuFvALqxdb+BFs27jkx7X9kRq2RYGlrJSgfog0HMzlsNWLcAv2+QlmJu0
         AC733gwU55C9tgl7NpHxKU+tU8sbkev6xdKWhAjTMNMLe8v8+j+/81/EtUVA34cFq4Hg
         2NPGJ+b1obZ8jPyHZpkRR2hzvcSNi4DXe2qSKq453vCF1Bdwyp+IarSwkTsLf/+I1/U5
         oNM+3V5e3CxaoxNlzLiEZcSb20g+qydZqVaFXM+OtfaVcpoESzIYTEDqUgZYFxUvsUZ/
         d9k2bwDrl7AWzHOu1FPPzY1D+Iq2da3e+R1NDdYfON5HUe/cy/sSpJk7w2JZLmPeZF1b
         8H5g==
X-Forwarded-Encrypted: i=1; AJvYcCXzJZRx3eyoAjD6zV5DREhOy3RcWCWUkr1WFEwnKTXjvIe2SPBNY3qMzEF6mzQGULpqAF+YP9V/PqDdlWE5@lists.linux.dev
X-Gm-Message-State: AOJu0YyLvz/ypzpnlrQ71FaNu23E9oqgX7YKKLYHQH0GUqeKxNRkwHg6
	1h7AwZ2sx2bb3fEsr9XXb9qn6uvmzZOBq8P6ohsqiJvjSOuvB9a0VlR3z3pbLidzaFigwn2sIhq
	ea2MH1zcEcWVBocswTEi9MVz2FNDqjyI=
X-Gm-Gg: ASbGncuS4CL4gfB/nz7UE+ZM+t1GE4nAQqlAWxIJl7k9NvlYPuDhoroDy+ybmH9i4u9
	c0EG8jOdRony0dDSEUE23hhWli7KilvVdDkhUwYSAdcJRi4yLF62M7LqtfwJTTjknS+cblo6/mU
	griRf96LGtNeXUaZv2K6rqtlwxm1BV073wK3iQC79MrNPxYfVBSIhkNQQfkcR3QFg5RSWMdbrzG
	5Xk1oi+j+N7QlCAOt4=
X-Google-Smtp-Source: AGHT+IHJqbTQlZxQrSzgsn7uAhDMaT3ieXLEx/3wOIxur6z+DYM0qqrydbeR13Y1wCHEumVIHPbjQZcDuzqpaIwgUiU=
X-Received: by 2002:a05:6000:2407:b0:3c8:9cfa:c178 with SMTP id
 ffacd0b85a97d-3c89cfac400mr11428571f8f.25.1756291539709; Wed, 27 Aug 2025
 03:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819121631.84280-1-clamor95@gmail.com> <1909286.atdPhlSkOF@senjougahara>
 <76B1EB6D-B149-43C2-AA56-A15C9DCCA3AF@gmail.com> <14287352.RDIVbhacDa@senjougahara>
In-Reply-To: <14287352.RDIVbhacDa@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 27 Aug 2025 13:45:28 +0300
X-Gm-Features: Ac12FXzDJMFwSyCznjWDvhfBWLuEGGUDton2Z3d8Y-Yt9F2wgfNpu5x2X_82XmI
Message-ID: <CAPVz0n0kCBAh7W0R766A_dXbcM3E=EoSXemuc0_rOm+Qch-a+Q@mail.gmail.com>
Subject: Re: [PATCH v1 01/19] clk: tegra: init CSUS clock for Tegra20 and Tegra30
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 27 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 13:3=
6 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wednesday, August 27, 2025 1:32=E2=80=AFPM Svyatoslav wrote:
> > 27 =D1=81=D0=B5=D1=80=D0=BF=D0=BD=D1=8F 2025=E2=80=AF=D1=80. 07:09:45 G=
MT+03:00, Mikko Perttunen
> <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
> > >> CSUS clock is required to be enabled on camera device configuration =
or
> > >> else camera module refuses to initiate properly.
> > >>
> > >> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > >> ---
> > >>
> > >>  drivers/clk/tegra/clk-tegra20.c | 1 +
> > >>  drivers/clk/tegra/clk-tegra30.c | 1 +
> > >>  2 files changed, 2 insertions(+)
> > >>
> > >> diff --git a/drivers/clk/tegra/clk-tegra20.c
> > >> b/drivers/clk/tegra/clk-tegra20.c index 551ef0cf0c9a..42f8150c6110 1=
00644
> > >> --- a/drivers/clk/tegra/clk-tegra20.c
> > >> +++ b/drivers/clk/tegra/clk-tegra20.c
> > >> @@ -1043,6 +1043,7 @@ static struct tegra_clk_init_table init_table[=
] =3D {
> > >>
> > >>    { TEGRA20_CLK_GR3D, TEGRA20_CLK_PLL_C, 300000000, 0 },
> > >>    { TEGRA20_CLK_VDE, TEGRA20_CLK_PLL_C, 300000000, 0 },
> > >>    { TEGRA20_CLK_PWM, TEGRA20_CLK_PLL_P, 48000000, 0 },
> > >>
> > >> +  { TEGRA20_CLK_CSUS, TEGRA20_CLK_CLK_MAX, 6000000, 1 },
> > >>
> > >>    /* must be the last entry */
> > >>    { TEGRA20_CLK_CLK_MAX, TEGRA20_CLK_CLK_MAX, 0, 0 },
> > >>
> > >>  };
> > >>
> > >> diff --git a/drivers/clk/tegra/clk-tegra30.c
> > >> b/drivers/clk/tegra/clk-tegra30.c index 82a8cb9545eb..70e85e2949e0 1=
00644
> > >> --- a/drivers/clk/tegra/clk-tegra30.c
> > >> +++ b/drivers/clk/tegra/clk-tegra30.c
> > >> @@ -1237,6 +1237,7 @@ static struct tegra_clk_init_table init_table[=
] =3D {
> > >>
> > >>    { TEGRA30_CLK_HDA, TEGRA30_CLK_PLL_P, 102000000, 0 },
> > >>    { TEGRA30_CLK_HDA2CODEC_2X, TEGRA30_CLK_PLL_P, 48000000, 0 },
> > >>    { TEGRA30_CLK_PWM, TEGRA30_CLK_PLL_P, 48000000, 0 },
> > >>
> > >> +  { TEGRA30_CLK_CSUS, TEGRA30_CLK_CLK_MAX, 6000000, 1 },
> > >>
> > >>    /* must be the last entry */
> > >>    { TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0 },
> > >>
> > >>  };
> > >
> > >I looked into what this clock does and it seems to be a gate for the C=
SUS
> > >pin, which provides an output clock for camera sensors (VI MCLK). Defa=
ult
> > >source seems to be PLLC_OUT1. It would be good to note that on the com=
mit
> > >message, as I can't find any documentation about the CSUS clock elsewh=
ere.
> > >
> > >What is the 6MHz rate based on?
> >
> > 6mhz is the statistic value which I was not able to alter while testing=
. I
> > have tried 12mhz and 24mhz too but it remained 6mhz, so I left it 6mhz.
> > >Since this seems to be a clock consumed by the sensor, it seems to me =
that
> > >rather than making it always on, we could point to it in the sensor's
> > >device tree entry.
> >
> > Sensor device tree uses vi_sensor as clocks source and sensor drivers d=
on't
> > support multiple linked clocks.
>
> AIUI vi_sensor is an internal clock so the sensor cannot be receiving it
> directly. Perhaps the sensor is actually connected to csus, and the reaso=
n we
> need to enable it is to allow the vi_sensor clock to pass through the csu=
s
> gate?
>
> That leaves the question of why the csus pad would be muxed to vi_sensor =
by
> default, but perhaps there's an explanation for that.
>

From downstream T30 sources csus and vi_sensor are always called in
pair (6MHz csus and 24MHz for vi_sensor), naturally I assumed that
latter is used as camera reference clock since most sensors has
reference clock around 24 MHz

> > >Cheers,
> > >Mikko
>
>
>
>
