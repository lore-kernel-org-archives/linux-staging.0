Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7602F7AB0
	for <linux-staging@lists.linux.dev>; Fri,  5 Sep 2025 16:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757088331; cv=none; b=Dx3pIfScio308RI1rreiHKIX0YhnKS07857mI0eiy84IVfmTJMrI+7bimlxsmWDXSyKXBir0MKKtrmGGJFCbrdDKo7uPyupix3DgPjtqVj9QQmWihcCLFhr7Z5oRg/5TUSl21qVgBWEgp5aVzjsatV2PSkn2cKE7Qbjwu4oEKZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757088331; c=relaxed/simple;
	bh=FESAJV3RMtcE1Z/zKrWFGkbPFtqRO7/Jl8Cv0HWHt3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hpnbhrW1MAh6UAZhfvKeBtlYYUYj6EGJ6zx7a9a5VCmURhe/zYVNSoF1QbxUJfDCOqq/YOuczhi96mjqSTI7lgifu9qHXgPZCRifLiXz74vxPxoQ6TPAMLDb1A/2gO6zJxnNWdSfdnDg3f/U8Pbomq0GaJu1IKLQiQgAAoPTB4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVVcwI2+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVVcwI2+"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45dd513f4ecso11551385e9.3
        for <linux-staging@lists.linux.dev>; Fri, 05 Sep 2025 09:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757088328; x=1757693128; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ob2dOE5lLXVb6RqGFMwvVMJwP8tb3SAsPX4YiQh5IfQ=;
        b=QVVcwI2+3KZz64TUEPnF1ovFLQQ8JZLLBSmpeb4W5h60Dzr7KJmWwDM4vkNYbsbw2G
         K8iAP2FVq9cqbMfQVJFi1k9WSHDKbRuYKKj/8V8ZzyFCAGu6bm3+oHNjqmdUw8QusQvp
         CIRmgukmCYaAlLpxENEKfami/0V6I5eTPah6I8+ruH5ChG4AHwOark57S+fgqkWhiYrC
         p9VPZgNMzz9hY29IP8MJQzUr0DZgJXiOIjNNTZ+tID459AMpT3MkUtWG+nSf4L62knBR
         ewAuZFDYBA4YxwnNKXOVCSjhBn0i+tDwYZWJib0NR72UCrGLK+T3XnuYfx3vrbWyfUD2
         enMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757088328; x=1757693128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ob2dOE5lLXVb6RqGFMwvVMJwP8tb3SAsPX4YiQh5IfQ=;
        b=FYTl6La0RKkWJVF0Hw4CZiwT4hD31KvEmrSy0AsN0jiboW+VLRDWvY100jlri4CsGQ
         lpnh8c6DgNZs3G+GMFr4KiZnaLDUL/CT3NHAG6zaVX6gPwsI+xLa9fwnmfRYlUjZEALs
         7jazoXBGzEEFYV+nXJzfU9UWvGNnv2Ff2SRCc1wYH4XsHFDs8Tvv1EZUi55nhV/1+zoZ
         PMFQa9WL0moESvWRQcl8LHn2tvIgMD0UHe87fbX7w7lGbOoSjPvrAdRjSKr4atrXgESl
         uwMKA3YPG2YCvQxU3+EhMsEKSAvM2OoPq7KAR4prKftY3s4DrBiAW7Lwqnl9IexYlQOv
         Ybpw==
X-Forwarded-Encrypted: i=1; AJvYcCUnqvsidzITGlFuAw4ATO23cGLDKb4ZxDaucLmKSfSXFGmg5xGxwjCi1kNv0wGEpZn+oj0oGXXCxwpgg54D@lists.linux.dev
X-Gm-Message-State: AOJu0YwaLRns70t0wGIxOAXCFHODTl7QbkOLW0Uza3wamyYxm9e8n0xu
	XQHXrUyipMPjkdW40HXPO65VymxkV8te827ztUYbLRgGPZvdVm3d+N83rr1QSFX6+02HW7Q/Uhz
	dZaQR5p5bfciXyhSgTQqYFrkhlWNRbxY=
X-Gm-Gg: ASbGncsxxelBW62OpjpTriv6DT7RF6oqZdN6l4sWjwSbtIBnKi/jPESUtgQIXJKHRd1
	jmpOGxyZ7mq05XosWmzPupByVMErjvuaCsPMsns4p1gXswzE9YGL7M+bHJgj49KFaEPDeiKMxoV
	seXugbrOqJ6bYSg3MNKFpN/THD9cu2nJJkqhQQ7iKxG6V6umYR+q4IS5Iph3O3eDdgWO9Ps9OIo
	d3Ooqv1hjZGR08b/QE=
X-Google-Smtp-Source: AGHT+IHQFdT92ui+oOPmAAzcjKrst1A5X5grtZ18QdUjMPD7e/2IxfW8vgkJ8xIP5tdh0aCS17FWkqJxwRfpnaKU8Is=
X-Received: by 2002:a05:600c:1c0d:b0:45b:97d9:4127 with SMTP id
 5b1f17b1804b1-45b9973a7bfmr114115425e9.1.1757088328192; Fri, 05 Sep 2025
 09:05:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819121631.84280-1-clamor95@gmail.com> <20250819121631.84280-10-clamor95@gmail.com>
 <20250905175915.2d7e02a7@booty>
In-Reply-To: <20250905175915.2d7e02a7@booty>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 5 Sep 2025 19:05:16 +0300
X-Gm-Features: Ac12FXy8-gf4rqnnMixpiVUbphC0vtcMsbDHxj7dfCPkBooqcg0F62Ji9EeEqrA
Message-ID: <CAPVz0n0_DJh9M-h5a0bcBA8b6_7vzgOYSktGxAhFzuVncoJhmw@mail.gmail.com>
Subject: Re: [PATCH v1 09/19] staging: media: tegra-video: vi: add flip
 controls only if no source controls are provided
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, David Airlie <airlied@gmail.com>, 
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

=D0=BF=D1=82, 5 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 18:59 Luca =
Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hello Svyatoslav,
>
> On Tue, 19 Aug 2025 15:16:21 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > Add HFLIP and VFLIP from SoC only if camera sensor does not provide tho=
se
> > controls.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/staging/media/tegra-video/vi.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/m=
edia/tegra-video/vi.c
> > index 4f67adc395ac..61b65a2c1436 100644
> > --- a/drivers/staging/media/tegra-video/vi.c
> > +++ b/drivers/staging/media/tegra-video/vi.c
> > @@ -961,6 +961,7 @@ static int tegra_channel_setup_ctrl_handler(struct =
tegra_vi_channel *chan)
> >       }
> >  #else
> >       struct v4l2_subdev *subdev;
> > +     struct v4l2_ctrl *hflip, *vflip;
> >
> >       /* custom control */
> >       v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, N=
ULL);
> > @@ -986,11 +987,13 @@ static int tegra_channel_setup_ctrl_handler(struc=
t tegra_vi_channel *chan)
> >               return ret;
> >       }
> >
> > -     if (chan->vi->soc->has_h_v_flip) {
> > +     hflip =3D v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
> > +     if (chan->vi->soc->has_h_v_flip && !hflip)
> >               v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2=
_CID_HFLIP, 0, 1, 1, 0);
> > -             v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2=
_CID_VFLIP, 0, 1, 1, 0);
> > -     }
> >
> > +     vflip =3D v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
> > +     if (chan->vi->soc->has_h_v_flip && !vflip)
> > +             v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2=
_CID_VFLIP, 0, 1, 1, 0);
>
> Based on my understanding of V4L2, this should not be done.
> AFAIK subdevs should expose what the hardware block can do,
> independently from other subdevs. It is up to userspace (e.g.
> libcamera) to use the most appropriate control when there are redundant
> ones.
>

This driver is video-centric, interactions are done via /dev/videoX
not subdevices like media-centric derivers do. Conversion is possible
but it is not scope of this patchset and in case such conversion takes
place, one who will do that, will definitely know what to do.
Video-centric drivers expose all controls within single video device
and it cannot hold duplicates of controls, this causes error. So this
solution exposes camera flip controls and if camera has none, SoC
controls are exposed.

> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
