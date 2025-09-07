Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2456D1DE2C9
	for <linux-staging@lists.linux.dev>; Sun,  7 Sep 2025 09:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757238215; cv=none; b=p2y/oqQJoChE5dDDR+m09nxKnXh84inRLRVawNDQU3WN5+1gXJyz1bk0gOz1/zdZsiebZAaiyzATd6yfAMc7G8Xwvo9EqEFPemPMoJR1zqcNcw64fLRsklujcCretEN8PCrAxt9ydpqmsfRN9Zm+eBXtCgpW85ojhOO3bA5NZnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757238215; c=relaxed/simple;
	bh=TDwoEokmsEniRL5mzV7C3NbddClADMi8vSACqfJXWVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JfvoL7T+N5Am72/49hapkLyV8cc8ft8t+9Gm4Z2HdoTULHNrF4oz6R1lXqjx7wxc16PRXuPCMVeUYWBaCL+wu5Aj+qR/HBb7oQoQwYU4XdR1+YK52u8PdwJZsDx93V9f8EwLD2cl9Q5GYxzKyMbplkHvw6T1QSxF8VQlZ/zzqNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=by2Ki3gb; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="by2Ki3gb"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45dcff2f313so20450605e9.0
        for <linux-staging@lists.linux.dev>; Sun, 07 Sep 2025 02:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757238212; x=1757843012; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZ/X6GOEUsW9+IFkzRBAiysCMqpUBrDHjoEhck1HoOk=;
        b=by2Ki3gb3sG+Nh5xBPkJ1zIbEixULUZ7ux2u/4dAlHe207TAgUXYX+v4FGx2vYeg+0
         +X4PPyYx3a+L7H/YFPiJwoqLiMziGkSqQh6UZtz4eIht8YL+7fB9EIfE8aYhLvrbitir
         jTLERp6fKOhTsx3SEhWbJko972UznTQxng6qTQM0gqo8StytOQReASxQyw9/EBCKG5GO
         DEDt/JUyLsnrkyYN8Qu6qKE8OeBxGCFmSBDW2mnvh49n1l7Yhivs2cxP8EYMeknFczyO
         yhzgS4Hke6GqO7L3LVm/8lGVe6DnaxC7ek06hG9hU0+D6wJ4tZJ3lMX9ItVmxr0cxcm0
         PwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757238212; x=1757843012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZ/X6GOEUsW9+IFkzRBAiysCMqpUBrDHjoEhck1HoOk=;
        b=mJ9mM/Y5pQMdcZzN9A2lvqd4Vbsa0gzdaMm9xpENS2Jx8BMxre8HZwDX3wv8EOV5Yl
         XwHh/IZkzrKede/n/GfNN67ZGEWxHORXSXROW0NJAYOpUJNVGBMXNZreD8Gpbuhc2c/G
         n67WbGgvLj1oYHFFB2TeZmlJsgUBMxT8Ng8ixTei6W0P+HBs68sC9ODxrLnZFElk+l3b
         czMiTuOlZX6A480tQ8RHn4H7LoRXGUPTeayfmhBg/ADhyGzkRV/iLHWnw1W+Oc3UeeGC
         eRAkrm2dyxMSXvPwTchTgjAeu2e+E50yNWb3DjI8C5qz1B7GePyXzeGzlhzwbLZozpEV
         td/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0DFXuaS1NL0Jem6tDsaS8WE8COKjFWrMbo5NmyRT3zj6ky+qS3mZx1vzGVniifoZ0E4HuLdePecfaYDk9@lists.linux.dev
X-Gm-Message-State: AOJu0YzdIlCo4M+jLV1Gxvcrrgnz/sAwA4VYeqoF7Difjj3iPFcxMLtd
	ho+iVF38TbdzBgcw+BeDHfpRDg2Es/DK5DJgQ7HP9yofCz8VSK/alBA7gW7FzHyxtdWFUDTOgdj
	zWW+sMNifi15VuzG2EkXbNvP7RyEBowU=
X-Gm-Gg: ASbGncto+irFF0SSXmbNn4onhyALFGJggBNb0Ks2FKpa1KeTpgCndnAHg4KgJOxXTn/
	8fdZgcz756HMvFEkrE/S0wukPRb6TTB6KZOlzc2EAajE4SRay+7iLOFAyPn1AJo30By3ikOMIUm
	jEc+idk0oPIOH60B7hFKFT3x9gHSDN0x/zRZxvs/IdGCngtk7AdPT20Nz8v5S08FE57bu5MH7gT
	U6RdCPh
X-Google-Smtp-Source: AGHT+IFPqig/UhEDyt4I8/2ZJlpITCSmd+DYWg5033ITXHJTPMBD050/gyXsr+9sNyIaTUs7NwKlwoEiYgPtX0PKgHs=
X-Received: by 2002:a05:600c:3b25:b0:45b:9a41:5d58 with SMTP id
 5b1f17b1804b1-45dddea60cbmr35564895e9.4.1757238212151; Sun, 07 Sep 2025
 02:43:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250906135345.241229-1-clamor95@gmail.com> <20250906135345.241229-3-clamor95@gmail.com>
 <20250907-arboreal-aquatic-gopher-686643@kuoka>
In-Reply-To: <20250907-arboreal-aquatic-gopher-686643@kuoka>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 7 Sep 2025 12:43:20 +0300
X-Gm-Features: AS18NWARBXRzhLtN6n3ce6WfDFCnzLq5yKlMbMSeV1CuL4QdfN0Ud8kVvzMMu8Y
Message-ID: <CAPVz0n0obwSFDup2n9R9SQNsOZw1Dm0G=2ifv=D7zyw=89+uYQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/23] dt-bindings: clock: tegra30: Add IDs for CSI pad clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Osipenko <digetx@gmail.com>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 7 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 12:34 Krzys=
ztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Sep 06, 2025 at 04:53:23PM +0300, Svyatoslav Ryhel wrote:
> > Tegra30 has CSI pad clock enable bits embedded into PLLD/PLLD2 register=
s.
> > Add ids for these clocks. Additionally, move TEGRA30_CLK_CLK_MAX into
> > clk-tegra30 source.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/clk/tegra/clk-tegra30.c         | 1 +
> >  include/dt-bindings/clock/tegra30-car.h | 3 ++-
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-te=
gra30.c
> > index ca367184e185..ca738bc64615 100644
> > --- a/drivers/clk/tegra/clk-tegra30.c
> > +++ b/drivers/clk/tegra/clk-tegra30.c
> > @@ -53,6 +53,7 @@
> >  #define SYSTEM_CLK_RATE 0x030
> >
> >  #define TEGRA30_CLK_PERIPH_BANKS     5
> > +#define TEGRA30_CLK_CLK_MAX          311
>
> Unused define drop.
>

Specify, your comment is not clear.

> Also, don't mix bindings and drivers. You cannot create such
> dependencies.

I literally did what you told me to do! TEGRA30_CLK_CLK_MAX was
removed from binding, but it is used by the driver, so how you propose
to handle this without redefining TEGRA30_CLK_CLK_MAX and breaking
build with missing TEGRA30_CLK_CLK_MAX?

>
> Best regards,
> Krzysztof
>
