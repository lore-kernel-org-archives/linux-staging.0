Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CC330C603
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 16:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760371396; cv=none; b=YldXQwAdrHVzhoFyvcSZIkJjeDf/MWuuLqVuoj/gri14MPFDEAYVxx/y3Eq75hyzxC+w4cwNnq+vp1NtDkNjDxC3ySMp6g5yqCF1jtxb1Hgz+KTpyd6UcJwXM3NXpNy4W45ESdOsPYbg6HsTeu3wMw+VW91yuvb3849U+wgcYM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760371396; c=relaxed/simple;
	bh=7pmScWeJxb/SA9LfgnIE+RSHfO7kt+ZDsVcv07zsRtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uVghoMn8678O2weJMNTPF0NWdkDkyryC8OcXpVh6n9SutzlFIZB4TTxQYWKVLXASJR0GDv6GBJm20IKbgMCH/E2rLPS+G8swDhnux9ZR/MsNLUBcGE5iExf4S3LVomr/BEYEh4lp7m7S7CmkNfGr4DPJAHowUeIsLSr8nqUPHiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H4g7xaE3; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H4g7xaE3"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-63bad3cd668so1772705a12.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 09:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760371390; x=1760976190; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=85zW8eAa0UUuhYK13qFSD0pz0Cqd0sUrz3cG+0d4BSc=;
        b=H4g7xaE3fPkRAEwMy1Q4IVELppOvrIAQKP7DU4Z/Et15Pjb/wH0x6QpDPolJRAhF05
         MLP+0Dv675buwZJ5Ct31MVkMh2f3FNCGm96gyWiDRBjd0Ji4eXkkummNJbvHKuNUnjrr
         6DAIhZC9EG/kkCIN0pL5cSq3psFTGPKjZDs+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760371390; x=1760976190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85zW8eAa0UUuhYK13qFSD0pz0Cqd0sUrz3cG+0d4BSc=;
        b=Zx1Tb1BKIgWnjyc3SEVPO3IjoTxc4ZJzBRzEASW/xACsUQXuUD8Ff/Aol54ZiNsbIo
         tVJGy+Jv0GCODdYDcUy9kk70lpjm7iEOitqMuPmzYkOEdmM6Fp1wUw+zx0/XPbjb6e+j
         tktZM+tSFBU02x0hg1Ov/Dj/xPbV8YECbXhtetisHyd+xdA8MZAQ8MJuPFgVJC10MQwL
         mzqG3+UqqDHWzuYEPas/0pjSkkhrCP6Sxmuiu3I2L3/tnfRvJ8qaGFvipfkNnSrtJbke
         /ioGFOTng0AspFp32hMS6g83lmFY5+K+rlhC6SGsNxLeSaj+Dtw3I71sueWuxJGMy9xs
         /RuA==
X-Forwarded-Encrypted: i=1; AJvYcCWVmhAnP3bU9IFFD12TnIrtEh9XArAPlscKdRH8iY5B/j3guxVDBeTSb40EZjxUmfbbP8ZcNsOvcEdleSTk@lists.linux.dev
X-Gm-Message-State: AOJu0YxGC5imrCBGvCVbYTg9wiNXczj9JZ6VzxnBMZgQ15Vp1trH7l6s
	xlbfESr/qkKQ+9UKCwDGCb5TH0jhUaaO8M6kYm/I5XCJtRg9C9MoDhUaKwe9EzTMSDbESbU4dch
	c8unsAU3D
X-Gm-Gg: ASbGncufNBqJhxsNnChIljvHJy7YU05MD4ixaezhAswvqLtqgdDHksKwqBm+LbbSglp
	WxObDbhOrtHiBtofIuscg+IzY32Z8pRoQyBgCG8E8Yex2gexiOyGanrVNZurLD0Ahihn6Thx6jR
	Z1zlCfK/Qi+RB7u9H90o4uakzCuMGxMdMoHiF0WbJup4gXdN6YUBhIlxveZ45wkn3BRA2Za7gdU
	oeaHJR5KVf23tvK7tYFZhK8jhhOVlkV7W+Rovm7eMkX9qs1Km81Bue0ekSFyGTzRRRdzr18YVRY
	vjPQRtYYx6MGAvw9f/PvA5WjyRzB2tgh92ozx7Skd3b2SCc/tQr7gmhwIaVSISzl4FZImq3FdKm
	3O0BcBQojKcVO3t5OU3bQ/Zwnhfd+u46DnYualUcegchrMwySmokGwRqf7QvG5yy1mnOBTU2Y/E
	+bRTEp9HrMdWj64w==
X-Google-Smtp-Source: AGHT+IF89i4F9ocDvTyoWAHunBiJ+ha5em1touHNgUXJbI/e1P1UzLfhrg59crcYeeNAj8jfh8F2Rw==
X-Received: by 2002:aa7:c54d:0:b0:639:7781:ea20 with SMTP id 4fb4d7f45d1cf-639d5b807bfmr13504108a12.11.1760371389207;
        Mon, 13 Oct 2025 09:03:09 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c134141sm9121184a12.34.2025.10.13.09.03.08
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 09:03:09 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b40f11a1027so785549766b.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 09:03:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULY0TEElxnmwuu1gj6IiXxLpaYWBJfqPzMjFAnpvXc3/L0K8mwfvzOzOLBxt8JYicn4nVmcBGxm5xw7X89@lists.linux.dev
X-Received: by 2002:ac2:4c50:0:b0:55f:4ac2:a58c with SMTP id
 2adb3069b0e04-5906dc0ff30mr6173104e87.22.1760370964286; Mon, 13 Oct 2025
 08:56:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <20251013-ptr_err-v1-10-2c5efbd82952@chromium.org> <176036780330.559803.287308146210017676@ping.linuxembedded.co.uk>
In-Reply-To: <176036780330.559803.287308146210017676@ping.linuxembedded.co.uk>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 17:55:51 +0200
X-Gmail-Original-Message-ID: <CANiDSCsuPkdz0=U2b_mNh4TWTNztAd9qEwJaiMRdGy1sf3UEbA@mail.gmail.com>
X-Gm-Features: AS18NWCmgLaH0rMvCIhheSPVtWPGKkpbEBd_aB_kzUyM4RaB_yHSiy8sRs-muw0
Message-ID: <CANiDSCsuPkdz0=U2b_mNh4TWTNztAd9qEwJaiMRdGy1sf3UEbA@mail.gmail.com>
Subject: Re: [PATCH 10/32] media: i2c: imx335: Use %pe format specifier
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Daniel Scally <djrscally@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Julien Massot <julien.massot@collabora.com>, 
	=?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Leon Luo <leonl@leopardimaging.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Purism Kernel Team <kernel@puri.sm>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Yong Zhi <yong.zhi@intel.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Kieran

On Mon, 13 Oct 2025 at 17:03, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Quoting Ricardo Ribalda (2025-10-13 15:14:50)
> > The %pe format specifier is designed to print error pointers. It prints
> > a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> > omitting PTR_ERR().
> >
> > This patch fixes this cocci report:
> > ./i2c/imx335.c:1013:3-10: WARNING: Consider using %pe to print PTR_ERR()
>
> Ohhh nice. Is this new ? First I've come across it.

It is actually from 2019:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=57f5677e535ba24b8926a7125be2ef8d7f09323c

I just learned about it because there is a new check in coccinelle :).

It is pretty cool, but you need to be careful to check IS_ERR(ptr)
before doing the printk, otherwise %pe will print the pointer value.

Regards!

>
>
>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/i2c/imx335.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> > index c043df2f15fb25b3a56422092f99a1fd9a508fa9..71ed9a0d84a252ee362621c4d38001508fb86d28 100644
> > --- a/drivers/media/i2c/imx335.c
> > +++ b/drivers/media/i2c/imx335.c
> > @@ -1009,8 +1009,8 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
> >         imx335->reset_gpio = devm_gpiod_get_optional(imx335->dev, "reset",
> >                                                      GPIOD_OUT_HIGH);
> >         if (IS_ERR(imx335->reset_gpio)) {
> > -               dev_err(imx335->dev, "failed to get reset gpio %ld\n",
> > -                       PTR_ERR(imx335->reset_gpio));
> > +               dev_err(imx335->dev, "failed to get reset gpio %pe\n",
> > +                       imx335->reset_gpio);
>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>
> >                 return PTR_ERR(imx335->reset_gpio);
> >         }
> >
> >
> > --
> > 2.51.0.760.g7b8bcc2412-goog
> >



-- 
Ricardo Ribalda
