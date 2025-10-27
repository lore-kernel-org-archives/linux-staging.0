Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29CA313552
	for <linux-staging@lists.linux.dev>; Mon, 27 Oct 2025 16:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761583814; cv=none; b=GXKNtpy4tqrgcU1A8200UhSIddEEaQaQNRO6tFHiNv+hr8Lxer4nPPwIA3VyZ+Tby1OmTuguxzJKzadLWGyW25jPNgsfM3NS5XSsuiOK0FPmXDCvS0FZLW6KD0ELElVhm7SRWzt5HsmZtlUdVUH+lUi9+OoLUTzRtYhEwFHQ8m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761583814; c=relaxed/simple;
	bh=f9gyr+50VXCzFRqzh5h2Eocs+kwwPbsfidV5wgRt5Ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OhmGX65u6tnYdpdq03sOKvzqpHapeyKTHhEPq8/gfxO2Y/Akvl5DHxrPsBAk7Bx/jlhipEyS0BYwVwMiTbzzLEo2m+ypVS0ZtQMhrHJZkgExGv0BFoIkA4mIYvOlPZrIcYIPfn8vaWy3NO95jRugKcOHoZEEUHUcF7W3PM8whGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtEBQuLq; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtEBQuLq"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4270a0127e1so3895191f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 27 Oct 2025 09:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761583809; x=1762188609; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llXiWHJLf2syx3blZo0CXJGIyiry1LJYTByzcLi8/h0=;
        b=KtEBQuLqF54fO5mu/mXE8MsUp/13RzFlWMToiMpELZoLH/NcRwZ3qpCnmyRKNJQtU5
         ToqRlznBgSCkxCT9GzZyoQWi346NX78yOHPagctgspMxH0H5KIIsXz5WU+sRgx36NZjU
         IkhC3Mvc/BuFd9wEfJI04GQtBcqc9ZDKwPGApwUXmpUAuRKk26hW2FGlTExKWE9UuPhS
         Zt+ATHJkB7NzBz5202g7pNv75VU7i4ZJj6iTT6SD95HaXsnwYrT10BXNxmxhHKDxLGDE
         JA42lg9Fmfpa0YJLCmdGGk50APzRSUfL+ku3vZy0NoidS/QjqQ925oDxCX9hg/HVCHF8
         BRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761583809; x=1762188609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=llXiWHJLf2syx3blZo0CXJGIyiry1LJYTByzcLi8/h0=;
        b=KUWb9OjCckLh6Yi5QGmAelX6qLahkv5qk0YTO/Aw3Mndp+GlAonrE522rhH3uBe3Bk
         mA4l0sLlOuKMAXzMOceS0lMrVIDTBIENA4PaozyrtEK86Lr2DnwDF7ZfTsqPCd3wtfnt
         IbBbppE9SQ2OnNDF1BaL9vB+HyHBbG3E87iL2OdcezzmSpF8AoDKn0OCgLLzqsfaXFND
         dCFjqjabIhGZ6SvwRj3GitcLBJ1vSfxzrJNkW1Tei6StM9zWk1Ng8bvHO2djetvoA0NT
         TB3HB4yVd0loCfqEG6w8MCFkIwaaBBrgdyhsfH4/0YsiSFyVvvIFCcclF7okc+Gg8d+Y
         ETkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOLZp4UQSgn/VIpnPN5b4pm84QuGQynrZEFlLZyBIwNNYLJSZm4YjRsS/IwAFLrbJrGK7KSugo0FyO0gJZ@lists.linux.dev
X-Gm-Message-State: AOJu0YwCH7VVC6Qyq++e9YYPvKF+LDr4zfgFFWAQXna2vSCF8N99zUIm
	w7rwIWksK2giXJJ6zRwIIyVuwEb0juRDk5zJkbf+rPMyMvGsHSKibMNMQNq3ThPWC0kbWK3N/Z3
	wCbW3hRkITmPxOFvED4wsBGOYLTdmvQo=
X-Gm-Gg: ASbGncsKOkBAGedsJYPkt+l3MMK/Ux1MjWga7iYm0bA1sHDeVFO4fjmnDXYpR43vZ6m
	A8a9vEwmEDunCFUpWm8cEo6GsQZ263M/mpYDGmnAPaIXi6E5tVWSx24LKpmVG8qdTIvlWeawEBl
	DHS0kmEQWQX+uBS+IdpvFg7w7akZudkDFJD3vq1Kyyxaq7xOIRPErC/zE6LwrKHMY9xvLUuNTaq
	ubAvoQTAkNP4P31HyYBxFDJ1IZM3vE5fuAC299+BeplaKoAD2xD0ug27ESCxQ==
X-Google-Smtp-Source: AGHT+IH4XlaBzxcnNj5YFZ0kloDrzQaT1eJpLjTjeIpDU2XpK4VeABDkTozkzcR3WZnwD6TgVQ+f15BePNjDYvfetA4=
X-Received: by 2002:a05:6000:186e:b0:428:476e:e0ab with SMTP id
 ffacd0b85a97d-429a7e97661mr333005f8f.60.1761583808872; Mon, 27 Oct 2025
 09:50:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251022142051.70400-1-clamor95@gmail.com> <20251022142051.70400-7-clamor95@gmail.com>
 <bd6262c6-a31c-43a6-8ec5-2735fb2fe0d2@kernel.org>
In-Reply-To: <bd6262c6-a31c-43a6-8ec5-2735fb2fe0d2@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 27 Oct 2025 18:49:57 +0200
X-Gm-Features: AWmQ_blgGtMyE7YToN26_Q2JZoB8VDufuUc2Jv2Dui7Z-P7sPMVoiu7__HneWyw
Message-ID: <CAPVz0n277DZ8S5wX5n0gCaOpng64uEfx3VVue4Zp0n5bsDevqQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/23] staging: media: tegra-video: vi: adjust
 get_selection op check
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 17:4=
4 Hans Verkuil <hverkuil+cisco@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On 22/10/2025 16:20, Svyatoslav Ryhel wrote:
> > Get_selection operation may be implemented only for sink pad and may
> > return error code. Set try_crop to 0 instead of returning error.
>
> Can you mention why try_crop is set to 0 instead of returning an error?
>
> That would be good to have in the commit log. And in fact, it's not
> clear to me either why you want this.
>
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/staging/media/tegra-video/vi.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/m=
edia/tegra-video/vi.c
> > index 7c44a3448588..856b7c18b551 100644
> > --- a/drivers/staging/media/tegra-video/vi.c
> > +++ b/drivers/staging/media/tegra-video/vi.c
> > @@ -476,15 +476,11 @@ static int __tegra_channel_try_format(struct tegr=
a_vi_channel *chan,
> >       fse.code =3D fmtinfo->code;
> >       ret =3D v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, =
&fse);
> >       if (ret) {
> > -             if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
> > +             if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
> > +                 v4l2_subdev_call(subdev, pad, get_selection, NULL, &s=
dsel)) {
> >                       try_crop->width =3D 0;
> >                       try_crop->height =3D 0;
>
> This looks all a bit magical. Which subdev is queried here? I.e. what is =
the corresponding
> subdev driver that implements get_selection?
>

Camera sensor subdev, Tegra VI driver directly interacts with camera sensor=
.

> >               } else {
> > -                     ret =3D v4l2_subdev_call(subdev, pad, get_selecti=
on,
> > -                                            NULL, &sdsel);
> > -                     if (ret)
> > -                             return -EINVAL;
> > -
> >                       try_crop->width =3D sdsel.r.width;
> >                       try_crop->height =3D sdsel.r.height;
> >               }
>
> It looks odd (esp. setting try_crop to 0), and I wonder if this code path=
 has been tested.
>

Yes it was tested.

Original code checked if the camera sensor has get_selection
implemented and if such operation is supported then it applies width
and height from get_selection, else zeroes. This works just fine with
most cameras and v4l2 compliance tests pass fine, with most but not
with mt9m114 which implements get_selection only for its ifp source
pad while sink pad always returns -EINVAL, hence VI driver fails with
-EINVAL too. To address drivers like mt9m114 instead of just fail with
-EINVAL if get_selection returns error try_crop width and height will
be set the same as get_selection is not implemented.

> Regards,
>
>         Hans
