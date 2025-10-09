Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D01025DAFF
	for <linux-staging@lists.linux.dev>; Thu,  9 Oct 2025 05:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759986746; cv=none; b=B9lekzDu6dFcIiVhNhwz81nR7hzyNApCE10bNScUtMMGe/OktjNThdSxVydilcuW/+SLRf+AI2U9HcRC+EoTH33InBxz4SvJHpPYmwM6+qG8iDkkJWIkYeXYLALWYFxmzEZbF6yRa85gcOWDsColNZpgE9DlPDL1DBozEhYve64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759986746; c=relaxed/simple;
	bh=g69ct24MmjxArPvb4htIE2j+DUcuAxYXbKaKt9nNwNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J22c/Z2NJWU4kJD/MOl6cHFm0zvzba45lpe+sH6vtXBntB9ZFLhrC3vNOWEvbmmJ79JEWyplBVqXeYaAOtNOetyHKwFXL4eYjzW0DByt1PXJPcWYl3Pr5L95EYCI0CMQClXG2IlvZIn582sxz4lnmUdUO3RoSs0BRajquDWiWLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mc1+tvlE; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mc1+tvlE"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4060b4b1200so602643f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Oct 2025 22:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759986743; x=1760591543; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAc4vwDFuA0RvRFYPmaQPlYUcz1xA/Dd48r7PtXPvic=;
        b=mc1+tvlEt+fY2njlO/Iz8dvHnYOlWdtPYoITylo/trZuMQdiODHGf4M5S1zdiZ/THC
         Y6STnZ3b5qzRR7COyGSBbpYQEg9d486QrLA+ZpzAp7bkX/LsK/xuBr1gOyJNuGkZgya4
         rQDzy2tjIv+CJMzAHKSrqC8A5UR5Sf+8P+23wtrJJ3OHLnUIzwgw8d43eDqlCFl4dF72
         pZpJtbii1v0TkKDzJxs0bdS20I2Sm8mmUm+ZkbWwc6zrWoSpiSu6M43CknRznL++Lvnx
         68TUq9MU+6vHMVA6HlRYgq7QoOqcVUxApPEA724VkE3T4qOJQ0mDnmDexFTwAkkClEy0
         KOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759986743; x=1760591543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MAc4vwDFuA0RvRFYPmaQPlYUcz1xA/Dd48r7PtXPvic=;
        b=lDY/DvKY5uCKptaBdmyRaHB3IdVx3yZERIjkcSfBqpaqXMu67YIegLJOrseWGfkAkO
         u8ou8zqx7d+wmluCWeQE2TyGQE+3eOPGofTMFxiXF0muQL4BRE+6zrdjzy53t9T/j8rd
         yt88i2KMQYD2ACeJasQnmCh7ODfNSzPhhE4CdQTyZo0zeNDv2xZWP5A8n/mXJsO8BhDQ
         mT/ZQQcDiEItLSZLEdw+FoJ16emmf84sr0PxcOTqVeN2ipaAtep5pTFY72JEMgZ2o+oh
         VpDuGpD1vWWT1H9VaxWt7NEUXvigyM0vs88LIWALHsk4WjKtHByJsWyCSARVyFxFlhM3
         d4Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUBagrKBIsxg5wENfnJ5bjVoGILw4dVqcrwDyKIPtrW8Sluo9fK5+ghxbJUDwDMYkn5+qAEIJpXIQ7eu3Od@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/GoQysKltKoKAVVT4KqkCALQzAR9mOaL1i9yv2Svpds8RFQek
	nTR8qAxNWz5QxJc8tpdGzgYsDDTTeNFnWbP/Y3oKUwCaxE2iYbxJkqO3Iv3G85KasBX4dNQD9fg
	wDZp/ymHrOKxOYzW7YLGy4sOiWX8IrOE=
X-Gm-Gg: ASbGncuSWdmpWuo8W6xP6BwslDLznkd8DjWTSvDgr1k/3qFnObFx9T+gk6hUUhosMoc
	ZvtOp4vn7A8H7NIC5HBW11zGJ/Tme4lDjbwk1vMCM/7UZ8Il9mJlqJU5wF2qpQl19Cl/ivLnQ6w
	rt5UYXQBbxFMb2kp5R36Xnn9lkDl5W6NJZh/OLRxRkn6rYl3fcI/WsErPL1oSZhSIy3BMiwpJ09
	xF59USy8mz90yR9DMgWjJJgRT9ot9Ic
X-Google-Smtp-Source: AGHT+IHEqPFGpsLkjdTJExInkzeCUrYeoBDzsTotN3s9CHFAoYRfgbeWdXnEHXE7zwgYrarYKck5hazoT/ajbub9quM=
X-Received: by 2002:a05:6000:1a85:b0:3eb:60a6:3167 with SMTP id
 ffacd0b85a97d-4266e8f7f02mr3364005f8f.32.1759986742670; Wed, 08 Oct 2025
 22:12:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251008073046.23231-1-clamor95@gmail.com> <20251008073046.23231-12-clamor95@gmail.com>
 <20251008-craving-composite-81aa70b6e882@spud>
In-Reply-To: <20251008-craving-composite-81aa70b6e882@spud>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 9 Oct 2025 08:12:11 +0300
X-Gm-Features: AS18NWCooDACEZg9v1dc4kKxxOAalz7xHeMkJMNqgQiJE_XE0BU4PgbUW_JYKFI
Message-ID: <CAPVz0n1OEA=WHTzBtVBLQ=6vTAwG_uP1tC3Vbrb67wZDUtyVYA@mail.gmail.com>
Subject: Re: [PATCH v4 11/24] dt-bindings: display: tegra: document Tegra132
 MIPI calibration device
To: Conor Dooley <conor@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 9 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 00:14=
 Conor Dooley <conor@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Oct 08, 2025 at 10:30:33AM +0300, Svyatoslav Ryhel wrote:
> > Document MIPI calibration device found in Tegra132.
>
> Could you explain why a fallback is not suitable? The patchset is really
> too big for me to trivially check that the change is correct.

First of all, this compatible already exists in Linux kernel, I have
just documented it to satisfy warnings. Secondly, each Tegra SoC
generation has unique set of registers which should be configured.
They all differ, hence fallback is not suitable here.

> With an explanation,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml  | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra114-mipi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,te=
gra114-mipi.yaml
> > index 193ddb105283..9a500f52f01d 100644
> > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-m=
ipi.yaml
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-m=
ipi.yaml
> > @@ -18,6 +18,7 @@ properties:
> >      enum:
> >        - nvidia,tegra114-mipi
> >        - nvidia,tegra124-mipi
> > +      - nvidia,tegra132-mipi
> >        - nvidia,tegra210-mipi
> >        - nvidia,tegra186-mipi
> >
> > --
> > 2.48.1
> >
