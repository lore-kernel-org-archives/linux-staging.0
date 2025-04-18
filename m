Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1B786328;
	Fri, 18 Apr 2025 17:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744995676; cv=none; b=gPkH5iav75FUKDrlZCaEfZlHCX+CCB32WjSL80kGeK0JhPaQ2oPSLe+HDkdP82m6RJZbohRZIQttOc8FzOVr2kohnUKXtxMXl+SGRoa4On7m8TqJ0jCV8RL5yjrCWGILD/EpJsUGD/ScWPfpErL3QNP1OUKPDjUNDsAa0PR98W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744995676; c=relaxed/simple;
	bh=8w1HZbYIpGw2lsE8fxuZH0Z+2IIZJk+H61XsQgcKQao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=INaPPOw7GP2FMCHTGukqxZp+AQb/Rx1rwVjm92JARbcmyiCBh6j2vLEdZNBFqs1PXornPsz6sBGnMwAr6r7t7SM8uDwhqWaMu/HabWMSrsEpYwPTqGEvrS//DrxOIP3krX5KLuGXVEhPcv9iu4TPk+Nf5SbP8yWrJi9woVFEJDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EzS73T1S; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EzS73T1S"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-476ac73c76fso20890931cf.0;
        Fri, 18 Apr 2025 10:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744995673; x=1745600473; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4jOaTYIRWPNV5975r6TtN5MoRcAB00ZTyeDTKmI1wU=;
        b=EzS73T1S7diBVMuJQ6hLBI0kXLvDwvz73DcdowzsWBxZGAtemIa+Waxww4AOV5mU/i
         zilrwq2efBfSnIv7/7dMEV4kUPNOqePU4evKWudKby/Wap765g7Wo+C024CzrkeAfqYd
         2BjxJ1SLTV3vN8AqouQ16YPuFHbz+EzTAQKHk83pahcf97PvUEKNf9VV+l7KOBdhXSVW
         L+ZLz5ndROzu4HhHvCYifKkzY3bIF7eZZSvU5V6mKr+yt+77CrlfMwye9S2AuECFsxLt
         kS2+uxHFVFEGQ+NcAZOFS6EF5sZdjAxSEgOF6IEW4Otk5hMJ/PHEPQTKTqAIpTwQHMa4
         4xCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744995673; x=1745600473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K4jOaTYIRWPNV5975r6TtN5MoRcAB00ZTyeDTKmI1wU=;
        b=uvBq+c9fVxT58zwaijFZWCsQmCIWTdeZD7tEM9OmOCCIKuYHA2uvEDkPrqiCYebMVK
         ikqg/c7eQDl7tGfEL2pJzTAQjK2eTGx9M7Ks4A/LIVN4FtwXur5fgBwYhu5kBhYrrZ/h
         ac1BuWS/t/0H5Xq6seXP+7Z9c2C88MU8NJgKiLExbB41i3uaF20ufjTDfRkY+e8mB7wn
         kWoHP4tvI0MPc9ggvVAvPaJTN4wpZ+kc3Qqn+0ZAtALX9ND52J2ScwJdEvQPLCPiERi0
         7jd3NJYKh+iHTyN5usBqo2kaPgBvk3fhHI85cgQqrRbOMWsH18JGjrMNMwIWId6m17Al
         4yGg==
X-Forwarded-Encrypted: i=1; AJvYcCVg9/15/HGqUJwaC2TtLUz9/T4g0UNe3fJkWY5P0RJplpJhAm6ZFI+l1C6OkjYwLYZyMBvv+T0ZkCh+WzoyCg==@lists.linux.dev, AJvYcCW9aDvIiA3WCO6QcIIzTxkzXEcqzSVBoCOfaatxxDHo3uCtGOC79tyGvb9DieS1O8f8Cvplon8ET3auEMTufxoUX6f+Rw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJKeEoJ16JmnK0Mah1QyP9oI6WvdBoo6vP74fSR+dLc2pIMijP
	2J7TdCMSVIQrVdIWIOKgQPstHV+OEM6xPKNRjiyhDxdaLC/LNhXzLbPX2Jzxrh/ShMKMJVKFZug
	pRT6mRJva2bIdJcQNFpk+w1gbWj4=
X-Gm-Gg: ASbGncuWEC7Up+wGtsuis7ffINxXpMisHPGBFnEHLXWhviXJN43O9/r5W3PCYhH166C
	PHNhN4yEz342uSPYiRi6tPmHCdkr5xTwyCQceSP7Id8YO8mDyOgxUX60We9D2PItFSaEAVSLbkT
	mjuAsDulRZimGWtE80T4meZ9uRjuJcZFV+f6LB9QBnWIW+YU1qtoqyiv7q0WKXkiI=
X-Google-Smtp-Source: AGHT+IGfRaxUib4vxMeg5ZHVwz3sTnnqydjjr+BZWaabAYNvr6HBK0qxHxLDmk+tzoqUGiqm3k5sVAVmzeMakuDT4ZI=
X-Received: by 2002:ac8:584f:0:b0:476:af62:8532 with SMTP id
 d75a77b69052e-47aec4ba327mr49626361cf.45.1744995673373; Fri, 18 Apr 2025
 10:01:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250417135434.568007-1-gshahrouzi@gmail.com> <20250418164040.0f103380@jic23-huawei>
In-Reply-To: <20250418164040.0f103380@jic23-huawei>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Fri, 18 Apr 2025 13:01:02 -0400
X-Gm-Features: ATxdqUHYpoK_uf-3FQX72Xc5r4NMTYfDz6xHt0YdITsiYSrcp9t89ZozAiI7UVo
Message-ID: <CAKUZ0z+kr1ToeOJaRihbfQyKoJ+vgOF7YjK811TbEcyd-43a-Q@mail.gmail.com>
Subject: Re: [PATCH] iio: frequency: Use SLEEP bit instead of RESET to disable output
To: Jonathan Cameron <jic23@kernel.org>
Cc: gregkh@linuxfoundation.org, lars@metafoo.de, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Michael.Hennerich@analog.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 11:40=E2=80=AFAM Jonathan Cameron <jic23@kernel.org=
> wrote:
>
> On Thu, 17 Apr 2025 09:54:34 -0400
> Gabriel Shahrouzi <gshahrouzi@gmail.com> wrote:
>
> > According to the AD9832 datasheet (Table 10, D12 description), setting
> > the RESET bit forces the phase accumulator to zero, which corresponds t=
o
> > a full-scale DC output, rather than disabling the output signal.
> >
> > The correct way to disable the output and enter a low-power state is to
> > set the AD9832_SLEEP bit (Table 10, D13 description), which powers down
> > the internal DAC current sources and disables internal clocks.
> >
> > Fixes: ea707584bac1 ("Staging: IIO: DDS: AD9832 / AD9835 driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > ---
> Seems reasonable but I'd like some more review of this before picking it =
up.
> So feel free to poke me if nothing happens in say 2 weeks from now.
Sounds good.
>
> >  drivers/staging/iio/frequency/ad9832.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/i=
io/frequency/ad9832.c
> > index db42810c7664b..0872ff4ec4896 100644
> > --- a/drivers/staging/iio/frequency/ad9832.c
> > +++ b/drivers/staging/iio/frequency/ad9832.c
> > @@ -232,7 +232,7 @@ static ssize_t ad9832_write(struct device *dev, str=
uct device_attribute *attr,
> >                       st->ctrl_src &=3D ~(AD9832_RESET | AD9832_SLEEP |
> >                                       AD9832_CLR);
> >               else
> > -                     st->ctrl_src |=3D AD9832_RESET;
> > +                     st->ctrl_src |=3D AD9832_SLEEP;
> >
> >               st->data =3D cpu_to_be16((AD9832_CMD_SLEEPRESCLR << CMD_S=
HIFT) |
> >                                       st->ctrl_src);
>
