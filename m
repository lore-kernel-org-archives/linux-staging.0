Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946FF22257E
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 15:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760370664; cv=none; b=CT1o+ZVdJsgJqn49jB0MUGnx5ucY5tjx8kRy5xQ/tbgmeXik12Jm6T61OWv4DbIw4X6pQFms2l4Qo9BxiG2m2FVrDxnVBfghvxlLB6RywYYSlFQKHak7pOetu7gEVu29dtboqtkUEp4RoKwHH9RdA86XLfjjM5B5m4Nv1gYl6Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760370664; c=relaxed/simple;
	bh=cAB0kIpqj20tM7yHpaFoe3xcfA2AB5cxFaYcvZmpAuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qn5p42gFx304p6WRZExVhvxvuNOq7X1SFxB5SOCS5cIq52oTQ6yv0Qea4N0T14Mz1U+IqhrAztBqQ0T//Fu8psneVRAYgnjpXPoc9oPfwgek2B7Uds2Bnl0XQaWPUQC7zoVfSdfxo8woZmLmZsQJLTILgJMnWBg3NwkeLYkC0WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Boq+zGAO; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Boq+zGAO"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59093250a7bso2916790e87.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 08:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760370661; x=1760975461; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LK0kBaNkf30iNo8Y7sNwo/F78yA794Ns47GaxpHfRwE=;
        b=Boq+zGAOz5J2t7b/9Ag0ko/V8aCTfg1UeJzEmlpm6jMKu3S7OG/kqZ5c1wbzFnZ9vx
         +iqj4m6G/Y8vgB0Rf/zoH2QC7QrSVuAK45KHBQMXNQXx+wyscFlcb6Mh8Dq9SGbbyJpX
         A4OMpeiBLSjOGjJQmyOVpa/ulxl10WN2d5vco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760370661; x=1760975461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LK0kBaNkf30iNo8Y7sNwo/F78yA794Ns47GaxpHfRwE=;
        b=sdXtYfaQOUm/xslcsJ+oIbJGwHzdpOlQYMHt7Hlco4ZvNuSsL1kjC3Qy1ATtykiX/h
         5OnH2VEe6RWVIF8GlOW8xsQCDxLR3+tL4exvmK2Wxia4dR4u4QF/EeJrD0CxVL4E3gxZ
         tga8sRj4VR5bAJMsBVZl/1rZF+0b9pZtwfkcztI3Nv7Opkp1ekAfmQ62mUaq3YPTa+xg
         XAwlEdJx5/8JGy4EqnJmBwqxFZb9z9ahHfcLw+TGyT8NSlRyUIjJ2sW5gVVPgcI6JHr6
         WhCHOTIER8+/pdOyiZGApLjvXII30WDi88Mj/vGQ/0SeDsCLrWYnojZXVwITBpN4e9Hw
         ocSw==
X-Forwarded-Encrypted: i=1; AJvYcCVweNhaIJ6Vl+Lm7YxbJKSdpGf5PAbTSnmREeNh53pT1mCpLsAJL0QWoz4IPZLpakfBh+WFe2eUKqSkQ0pA@lists.linux.dev
X-Gm-Message-State: AOJu0YzydXFGAJOYyVlH+sy1O3c6ajflI2CuDu4Jehx8b9NHQKmCxLuV
	jKYgK8e5j8YxJxw8vmky/KV32GZ8YK6DyhK7aTadIM3cr/27as88ntiZcwpgEdlS/EvCHUZMX7M
	3UEpOkA==
X-Gm-Gg: ASbGncud5x3y92fF0x3G4o+T89+cvtS1F0QQ55q90t6yHN5Ty+jbbHqFYwLVFjJ/mur
	McSfUNPFZQ8rancLpFZMUucazhLQGl3xZ1DsUQMQapbGgNkct/oxbn/rLXV3kj2E9RbhTznsLKV
	OGribPC8RjfOQId8E0V2jriA5FHgpFerxaxihVDANFEGbTFBA9W1DSYUmDft73SGY791Ro3f/aG
	tFozsuQXzprJMU84pM++iqd+v9BPzz6jQX8bihbPLKLGmlc8GaFpk2qVc1TqP6cvvi+RpFlecNI
	J6pKutazdoE3CDVUmX26kO8WQezuxd2945cU9fZ9pY4jGVKUZWQATGnBK/MxTr7EwaCqKvLglhF
	IlVGLOjiiqsQU95VzsSHiEcGgiaZkjC3xQ/YuE9CcHNm80pDYYldEIdIAo/vurG+DBZLRTj4NR8
	k0fxT2fplj6+C/vw==
X-Google-Smtp-Source: AGHT+IEcPeV7QpFo4ceOFwCxpLYdLMamUxZWlgyCds5/V4HqTJv5XoGC8eD2fqcyw6cxipG2UDthqw==
X-Received: by 2002:a05:6512:3e27:b0:55f:6db5:748d with SMTP id 2adb3069b0e04-5906db0d3e3mr6328790e87.4.1760370660571;
        Mon, 13 Oct 2025 08:51:00 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088584921sm4254324e87.125.2025.10.13.08.50.58
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 08:50:59 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57bd04f2e84so4783315e87.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 08:50:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWbJyx+4iAJGvCxHZEgJAHHKf4KJk14hFfKrIwRMhEMrIrf/3OOxfG0JvWM5ztYzbo5VT6N23jT8JN7h6AX@lists.linux.dev
X-Received: by 2002:a05:6512:1095:b0:58b:75:8fbc with SMTP id
 2adb3069b0e04-5906dd8ef00mr6030162e87.50.1760370658194; Mon, 13 Oct 2025
 08:50:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <20251013-ptr_err-v1-1-2c5efbd82952@chromium.org> <aO0cXYeGLwwDABP6@lizhi-Precision-Tower-5810>
In-Reply-To: <aO0cXYeGLwwDABP6@lizhi-Precision-Tower-5810>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 17:50:44 +0200
X-Gmail-Original-Message-ID: <CANiDSCtxnR-ydCquhH1=g-XwZ9DN=eeJNxRBOGiqufS_DMYzUg@mail.gmail.com>
X-Gm-Features: AS18NWAjEedfD0tRDHHy9p2HIYCpNxcTQpn_Xf2f0oNW4TLvTJ881tcLSkxWDmQ
Message-ID: <CANiDSCtxnR-ydCquhH1=g-XwZ9DN=eeJNxRBOGiqufS_DMYzUg@mail.gmail.com>
Subject: Re: [PATCH 01/32] Input: cyttsp5 - Use %pe format specifier
To: Frank Li <Frank.li@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Leon Luo <leonl@leopardimaging.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Julien Massot <julien.massot@collabora.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Daniel Scally <djrscally@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi <yong.zhi@intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Frank

On Mon, 13 Oct 2025 at 17:36, Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Oct 13, 2025 at 02:14:41PM +0000, Ricardo Ribalda wrote:
> > The %pe format specifier is designed to print error pointers. It prints
> > a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> > omitting PTR_ERR()
> >
> > This patch fixes this cocci report:
> > ./cyttsp5.c:927:3-10: WARNING: Consider using %pe to print PTR_ERR()
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/input/touchscreen/cyttsp5.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Suppose it will go though input subsystem intead of media.
> Need post seperated at difference thread?

Indeed, it belongs to input. if there is a v2 I will move it to a
different thread.

Thanks!

>
> Frank
>
> >
> > diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
> > index 071b7c9bf566eb0b58e302a941ec085be1eb5683..47f4271395a69b8350f9be7266b57fe11d442ee3 100644
> > --- a/drivers/input/touchscreen/cyttsp5.c
> > +++ b/drivers/input/touchscreen/cyttsp5.c
> > @@ -923,8 +923,8 @@ static int cyttsp5_i2c_probe(struct i2c_client *client)
> >
> >       regmap = devm_regmap_init_i2c(client, &config);
> >       if (IS_ERR(regmap)) {
> > -             dev_err(&client->dev, "regmap allocation failed: %ld\n",
> > -                     PTR_ERR(regmap));
> > +             dev_err(&client->dev, "regmap allocation failed: %pe\n",
> > +                     regmap);
> >               return PTR_ERR(regmap);
> >       }
> >
> >
> > --
> > 2.51.0.760.g7b8bcc2412-goog
> >



-- 
Ricardo Ribalda
