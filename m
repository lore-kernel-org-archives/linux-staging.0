Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7034F21ABC9
	for <linux-staging@lists.linux.dev>; Mon, 22 Sep 2025 05:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758518031; cv=none; b=BEo8+XSbJ3FiFgxbIdSSoGbiKulbjiKadwig3vU0hbrG90ycrhlmMZpHBRt0gyA5ppu2R7GRCSYGcM4JFrddbraPcTynHSuntgqsWWZ1dMwQnNkC36PaFKVgNidbplHGWgWVkrDp6U2l0HICldK5GmesKlDC3J9dcaA9Bh/+060=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758518031; c=relaxed/simple;
	bh=XbdZ3X2+5yMq6r4xdUD49QnmshR3ghGKqHnmVMrTVPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=koQ0yILFZWUTk5pSM6Devtj6TG2BRxCjFWYhymiO2zAld4LK5MWeye850s10E1NiqZ4ywcdApyIgBV2Vd/itomhxwzB+Sq6sOeNQlYhEF0WmmEhsVPkgkfIunKQr/COwKltlCO+IRiJ1Y9qxy9p9+t6umj3X3XvlGPFfRz26JL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+ttCJO7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+ttCJO7"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-468973c184bso12724025e9.3
        for <linux-staging@lists.linux.dev>; Sun, 21 Sep 2025 22:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758518027; x=1759122827; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cVcrbVrlFJ/u7LnceUgCyaQR49hpzvnBzHLefl1ASM=;
        b=l+ttCJO7o6zbxpWYXjlt3DR4prQLwHzu7OLLEi3k1CHWBLPlsYUUCDSLHLIWRu3jB2
         1dm4EnYeFVtsmIJg1VC1pTULt9tFaY2fwf1TqjtYln7H7TNIxLEruEEIco1e4DnrLep6
         aBskJX8Q6tzh77p5Vh7H5EhEdGbxGI6Z7F5MJRlsOJNFLVl+PRTImE5bbaC8N83/uhLt
         M3Jsj3/Fx9N2V9DBQZ1T+A8dZx7FFXJVupbbNfPAM/SjTnaKWAL5cH1tw+uRSWvz2QHc
         2YZHTc5CguhxfAG33l1awsRwmFG3woInbkPAl4PX8XyOcaZIO/xNSA5HJUstr/THkDH/
         wvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758518027; x=1759122827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8cVcrbVrlFJ/u7LnceUgCyaQR49hpzvnBzHLefl1ASM=;
        b=XENrdwtxtAsWXBaB+kr8+nCT8pPDkdaPRPMe2Nc2SKllr8x3Pv6WUXrgpTaPiFy3oJ
         +kqYS2znL+0nO0NYFq3tVh34+SjkjBWQe/z570IH/QMQvO89yHhZPCnKtKH/4Y7J7eqx
         94sFOQ2ouzW91YMCiCfLGGwaHoIIaV0AE4MR8V2kElOhXrri93yWai70tmgpAPNf+du8
         /heagL3Wr2G8PpG70NvhWzNH6Kegu4W16cPNz81OlqQeGQKn2zQRsGb8vT+JdIbQL17P
         Gzsk4f8sjfcaP814JJobIx5RyjiaG4uPKyTT0FAgCTw/SCuMrx50vSq+9qvMJ+v1P95I
         0L7w==
X-Forwarded-Encrypted: i=1; AJvYcCVJIUXsagIt83hzq6mr90Sj+41MLgnOnwEapVIjg+thfc4x+fzKuy+FW1EMAw9gUwwxJGqh0FM4jALKoQY0@lists.linux.dev
X-Gm-Message-State: AOJu0Ywv0pxuuRYpLh7UfqF7854Np8J/qeH8/Znz+DZ9FG7qwWQlEAoB
	WS76gnTPTpvSGvTeXSIKupaHeETVB8vwcKuUIgUGf1UwHZtZd0d+eyNCQHKCj9Wdr6NocA3Hfhr
	Fd5RdyZUnNVbhzyFqK1vW/VvazBQNUbE=
X-Gm-Gg: ASbGncsDGi43KRAPg5ib0FtPBfyevZ2Ifayiyoufds7gb6IK9O0J90UHyEa0lAGxmok
	kZAcDa8DFJdmLQj97CZ7L58hcYZLzTPdnwOmeR+gMq159mGWX0f904gBKIq/5VfLj2hvqu/tI1I
	urn3ad5uLCoUx3k2w2MRTgnFI5/v6G4ULIPNfV9N0p1opoxR5/NIJwcMUWDIjquUe0gd9XYdut4
	b1sijTfaVFYWwJ+35M=
X-Google-Smtp-Source: AGHT+IE/Fsl/+qBhIIlSkzEByoPTTdUl1tcUn1Bq01NGCTY0K8X3R3age1GatKFOPLLpHcaYAbt21UikMo4QxIsUEbs=
X-Received: by 2002:a05:600c:1391:b0:45f:bef7:670b with SMTP id
 5b1f17b1804b1-467e63be470mr102282115e9.3.1758518026668; Sun, 21 Sep 2025
 22:13:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250906135345.241229-1-clamor95@gmail.com> <20250906135345.241229-17-clamor95@gmail.com>
 <25240767.ouqheUzb2q@senjougahara>
In-Reply-To: <25240767.ouqheUzb2q@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 22 Sep 2025 08:13:35 +0300
X-Gm-Features: AS18NWCNN61ET19mfhbYdyg4DyevVg-p7VGKHH4-aLmM_YtmDE97vrkspo3o0lY
Message-ID: <CAPVz0n1Tur0YY7yOYAyUFvyTxie4OteyzGhzv487L+aA-YY+wQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/23] staging: media: tegra-video: tegra20: simplify
 format align calculations
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
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

=D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 07:44 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Saturday, September 6, 2025 10:53=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Simplify format align calculations by slightly modifying supported form=
ats
> > structure.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/staging/media/tegra-video/tegra20.c | 41 ++++++++-------------
> >  1 file changed, 16 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/stag=
ing/media/tegra-video/tegra20.c
> > index 6e0b3b728623..781c4e8ec856 100644
> > --- a/drivers/staging/media/tegra-video/tegra20.c
> > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > @@ -280,20 +280,8 @@ static void tegra20_fmt_align(struct v4l2_pix_form=
at *pix, unsigned int bpp)
> >       pix->width  =3D clamp(pix->width,  TEGRA20_MIN_WIDTH,  TEGRA20_MA=
X_WIDTH);
> >       pix->height =3D clamp(pix->height, TEGRA20_MIN_HEIGHT, TEGRA20_MA=
X_HEIGHT);
> >
> > -     switch (pix->pixelformat) {
> > -     case V4L2_PIX_FMT_UYVY:
> > -     case V4L2_PIX_FMT_VYUY:
> > -     case V4L2_PIX_FMT_YUYV:
> > -     case V4L2_PIX_FMT_YVYU:
> > -             pix->bytesperline =3D roundup(pix->width, 2) * 2;
> > -             pix->sizeimage =3D roundup(pix->width, 2) * 2 * pix->heig=
ht;
> > -             break;
> > -     case V4L2_PIX_FMT_YUV420:
> > -     case V4L2_PIX_FMT_YVU420:
> > -             pix->bytesperline =3D roundup(pix->width, 8);
> > -             pix->sizeimage =3D roundup(pix->width, 8) * pix->height *=
 3 / 2;
> > -             break;
> > -     }
> > +     pix->bytesperline =3D DIV_ROUND_UP(pix->width * bpp, 8);
>
> Assuming the bpp is coming from the format table below, this changes the =
value of bytesperline for planar formats. With this it'll be (width * 12) /=
 8 i.e. width * 3/2, which doesn't sound right.
>

Downstream uses soc_mbus_bytes_per_line for this calculation which was
deprecated some time ago, here is a fragment

s32 soc_mbus_bytes_per_line(u32 width, const struct soc_mbus_pixelfmt *mf)
{
 if (mf->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
 return 0;

 if (mf->layout !=3D SOC_MBUS_LAYOUT_PACKED)
 return width * mf->bits_per_sample / 8;

 switch (mf->packing) {
 case SOC_MBUS_PACKING_NONE:
  return width * mf->bits_per_sample / 8;
 case SOC_MBUS_PACKING_2X8_PADHI:
 case SOC_MBUS_PACKING_2X8_PADLO:
 case SOC_MBUS_PACKING_EXTEND16:
  return width * 2;
 case SOC_MBUS_PACKING_1_5X8:
  return width * 3 / 2;
 case SOC_MBUS_PACKING_VARIABLE:
  return 0;
 }
   return -EINVAL;
}

V4L2_PIX_FMT_YUV420 and V4L2_PIX_FMT_YVU420 are classified as
SOC_MBUS_PACKING_1_5X8 hence we get width * 3/2

> > +     pix->sizeimage =3D pix->bytesperline * pix->height;
> >  }
> >
> >  /*
> > @@ -576,20 +564,23 @@ static const struct tegra_vi_ops tegra20_vi_ops =
=3D {
> >       .vi_stop_streaming =3D tegra20_vi_stop_streaming,
> >  };
> >
> > -#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)    \
> > -{                                                    \
> > -     .code    =3D MEDIA_BUS_FMT_##MBUS_CODE,           \
> > -     .bpp     =3D BPP,                                 \
> > -     .fourcc  =3D V4L2_PIX_FMT_##FOURCC,               \
> > +#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP, FOURCC=
)      \
> > +{                                                                    \
> > +     .img_dt         =3D TEGRA_IMAGE_DT_##DATA_TYPE,                  =
 \
> > +     .bit_width      =3D BIT_WIDTH,                                   =
 \
> > +     .code           =3D MEDIA_BUS_FMT_##MBUS_CODE,                   =
 \
> > +     .bpp            =3D BPP,                                         =
 \
> > +     .fourcc         =3D V4L2_PIX_FMT_##FOURCC,                       =
 \
> >  }
> >
> >  static const struct tegra_video_format tegra20_video_formats[] =3D {
> > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
> > -     TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
> > -     TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
> > -     TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
> > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
> > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
> > +     /* YUV422 */
> > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16, UYVY),
> > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VYUY),
> > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YUYV),
> > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
> > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
> > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
> >  };
> >
> >  const struct tegra_vi_soc tegra20_vi_soc =3D {
> >
>
>
>
>
