Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993ED286D69
	for <linux-staging@lists.linux.dev>; Tue,  2 Sep 2025 05:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756789527; cv=none; b=kX2aPPfHs3ns5N27gwnDC0eOdrhprTiLusnNFbtIVYkKnHUVG/l1i7lNmdf8NjXmVdx/Fw5M8Q9nanKZj+DOUvS0g+YZhW9JyCJ8cdCV3HV2o+woLdLwWHD0gLAE6XUmgP87EXkFmCw5pScNR6l5Ta15fNVf3BClt0aPs32yTnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756789527; c=relaxed/simple;
	bh=vtfsb/s4s6Nsv/OIPvzrPK2PiISv3Kib0SJdMjxDr30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A39WlKtiHVeRVXpgs9FQ9rT2o38p56k3GEegjkuI0xi0RCPlzGa9065EUDN+3dywYdUbRAwzavkXesc/BwlEib/96okzZ8iC+kzJ4DUhBkNIbzb1a52spe7XwqhZpGoicNvHPdxm7m1CGW74axIamMUfDSe73VBlwx47R7wMWxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hli9HJBT; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hli9HJBT"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so33689155e9.1
        for <linux-staging@lists.linux.dev>; Mon, 01 Sep 2025 22:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756789524; x=1757394324; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsvxK8OTvjy6mRY2UF8u2ijfI8Gfv3ds+RCWrhu9dI8=;
        b=Hli9HJBTon/if1efc5xm8rHYw94epj+r/D04x5UePkE1rEXi4lOyIo7O4ft38UjqNp
         ZyFem1mmZhJDrqcOq50gkXw/0bSyoBGd7Z5SIhWnhcW9Hxu8GO/6jTYw57dtHMx9ryDU
         BVNZ4jluLLSdTzK+2NcIOTGcuH7WiJt6Qv5fx4GmxiF62bJ4WwnRpYWZiYTugpc7lKqh
         5xI71rHvJng9OC3LiWlaywDOudvgNlZcHSE7homlWMijrgobc+szLuwv/4fvbovhEJ/n
         MoP+sYrAEoYVRkzvXwI56nfJ47wtXDlMh69w2trwxIv8gYgkQvm5FpedpK7JWgeFWDoT
         U+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756789524; x=1757394324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UsvxK8OTvjy6mRY2UF8u2ijfI8Gfv3ds+RCWrhu9dI8=;
        b=lRrVaS8LVqtRWUPXKIC3ry3xnLUCS4Vces+dFP0Tx3/Es3qQxftxXF1sslFeZKs0HW
         OB6aaLgfnnGvtDiQwpN6r+khMVEfgRAU/CHvFALUaE7xQUPuJisSMVoFetFgUmeoo1Zo
         53BhBJX4ykqMU1pvWhawLisubNcj0U7fh5di8Upx2vXdG14KyL2F8Ja7qlv7ZioeO5Ex
         DF7IdQHrMpTmtIZv+oeOOHIqRw3CTu6tXz7v7YwVgR2gKayI3eRBF4ShT1bOGEwnWrEG
         DAq3pGiCoXfQXmW+cTzUxhknJPwohpndfKX/O85sc8nk0Vqk8/87bI7y6iZQ5XET5d7f
         hs/A==
X-Forwarded-Encrypted: i=1; AJvYcCWcp/XR8zudpR+gkz0KvdY68BQDk2VG3+JNhyYwqsOpr/7nennEaDGo1ZOTf+nnvoVlnyRNMGP9SqEchU4/@lists.linux.dev
X-Gm-Message-State: AOJu0YwGFtbxcKXidBf15D02Er6nUZl8AtVjtEL88aTZ24cF4La2PtPY
	gXofTZcPPJ009HXUYIrzLCUJdQBTLcqQyvlLVfqjXmUo47h/zAZDCShUXRSd09T8DcpBXcRsRoN
	ae5p1SezImy5LTRVXg5BW22XBZn789l4=
X-Gm-Gg: ASbGnctlMbjhWfwA2QMcEVEvD23Mc32BsIpTJ8lGHeD/VMP3P2is2CnOq3YyjlFxx18
	p5ONkjhWMeEH62RloDq7L4XIDaHxA0K/kB6Ni2zVGUeD1J76NgUDmUTPeFKvcz30qS8Tz7Jhg4x
	hrcY+c0wqLwtUkv0HysvuSq47uyo4gApqTBA0Zjmu+Uxq0664uLz8Rg+BqdLGFIp1IpTEVE8jjD
	Z4WRD2e
X-Google-Smtp-Source: AGHT+IFaLGWrhMd9gaUFsjIuhaYuop/TR0fhRThMUYmbG5VO5CB2x6zfi844hhIhJImP7arGJuqPWad7TwuKTeA/xGg=
X-Received: by 2002:a5d:5f95:0:b0:3d0:b3cc:c21c with SMTP id
 ffacd0b85a97d-3d1e06aff5bmr7629522f8f.55.1756789523601; Mon, 01 Sep 2025
 22:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819121631.84280-1-clamor95@gmail.com> <20250819121631.84280-8-clamor95@gmail.com>
 <6948375.lOV4Wx5bFT@senjougahara>
In-Reply-To: <6948375.lOV4Wx5bFT@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 2 Sep 2025 08:05:12 +0300
X-Gm-Features: Ac12FXyFWFQp9zyC-dC-muHX4hjhMNXKuUIlIfX1jsnphJFz8uYCWTVS01gjz_M
Message-ID: <CAPVz0n2dp7kdCWFLWQjQY+tGO_ayzxGW=zxx3FwX_yeeR9J2Bg@mail.gmail.com>
Subject: Re: [PATCH v1 07/19] staging: media: tegra-video: csi: parametrize
 MIPI calibration device presence
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

=D0=B2=D1=82, 2 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 03:47 Mikko=
 Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Dedicated MIPI calibration block appears only in Tegra114, before Tegra=
114
> > all MIPI calibration pads were part of VI block.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/staging/media/tegra-video/csi.c      | 12 +++++++-----
> >  drivers/staging/media/tegra-video/csi.h      |  1 +
> >  drivers/staging/media/tegra-video/tegra210.c |  1 +
> >  3 files changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/staging/media/tegra-video/csi.c
> > b/drivers/staging/media/tegra-video/csi.c index 74c92db1032f..2f9907a20=
db1
> > 100644
> > --- a/drivers/staging/media/tegra-video/csi.c
> > +++ b/drivers/staging/media/tegra-video/csi.c
> > @@ -485,11 +485,13 @@ static int tegra_csi_channel_alloc(struct tegra_c=
si
> > *csi, if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
> >               return 0;
> >
> > -     chan->mipi =3D tegra_mipi_request(csi->dev, node);
> > -     if (IS_ERR(chan->mipi)) {
> > -             ret =3D PTR_ERR(chan->mipi);
> > -             chan->mipi =3D NULL;
> > -             dev_err(csi->dev, "failed to get mipi device: %d\n", ret)=
;
> > +     if (csi->soc->has_mipi_calibration) {
> > +             chan->mipi =3D tegra_mipi_request(csi->dev, node);
>
> The way I would read 'soc->has_mipi_calibration' is that this device (CSI=
)
> contains the MIPI calibration hardware. I.e. the opposite of here. I woul=
d
> invert the logic and optionally call it e.g. 'internal_mipi_calib'.
>
> A cleaner way to do this might be to always call tegra_mipi_request et al=
. --
> on pre-Tegra114 SoCs this would just call back to the VI/CSI driver using=
 the
> callbacks registered in the MIPI driver as we discussed before. That way =
the
> CSI driver won't need separate code paths for SoCs with internal MIPI
> calibration and SoCs with the external MIPI calibration device.
>

So basically MIPI calibration device for Tegra20/Tegra30 has to be
created within CSI and when MIPI calibration is requested, CSI phandle
is used. Question: may I use a dedicated node for MIPI calibration
within CSI or it has to use CSI node itself? With dedicated node
configuration should be much simpler and can help avoiding probe of
entire.

> Cheers,
> Mikko
>
> > +             if (IS_ERR(chan->mipi)) {
> > +                     ret =3D PTR_ERR(chan->mipi);
> > +                     chan->mipi =3D NULL;
> > +                     dev_err(csi->dev, "failed to get mipi device:
> %d\n", ret);
> > +             }
> >       }
> >
> >       return ret;
> > diff --git a/drivers/staging/media/tegra-video/csi.h
> > b/drivers/staging/media/tegra-video/csi.h index 3ed2dbc73ce9..400b913bb=
1cb
> > 100644
> > --- a/drivers/staging/media/tegra-video/csi.h
> > +++ b/drivers/staging/media/tegra-video/csi.h
> > @@ -128,6 +128,7 @@ struct tegra_csi_soc {
> >       unsigned int num_clks;
> >       const struct tpg_framerate *tpg_frmrate_table;
> >       unsigned int tpg_frmrate_table_size;
> > +     bool has_mipi_calibration;
> >  };
> >
> >  /**
> > diff --git a/drivers/staging/media/tegra-video/tegra210.c
> > b/drivers/staging/media/tegra-video/tegra210.c index
> > da99f19a39e7..305472e94af4 100644
> > --- a/drivers/staging/media/tegra-video/tegra210.c
> > +++ b/drivers/staging/media/tegra-video/tegra210.c
> > @@ -1218,4 +1218,5 @@ const struct tegra_csi_soc tegra210_csi_soc =3D {
> >       .num_clks =3D ARRAY_SIZE(tegra210_csi_cil_clks),
> >       .tpg_frmrate_table =3D tegra210_tpg_frmrate_table,
> >       .tpg_frmrate_table_size =3D ARRAY_SIZE(tegra210_tpg_frmrate_table=
),
> > +     .has_mipi_calibration =3D true,
> >  };
>
>
>
>
