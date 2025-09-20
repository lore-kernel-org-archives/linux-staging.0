Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378842F6563
	for <linux-staging@lists.linux.dev>; Sat, 20 Sep 2025 10:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758365379; cv=none; b=m8omd293bfUYGT5fN2N0GCg9Y1J7SZasGHgwkh+nOlK+a6Tii7+538HqRd06X+JD+E3G5bifLOaLYg/uLcgLPVRTNTHPmG/Qk4EUvJJ+MFH0NSqXTRoRCa+3HnEBbi0dgfK75bRa7K2Uk4rdshotx+2GSz0jLk/ytw8jrLo29Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758365379; c=relaxed/simple;
	bh=LeD+Kp6HPaiggwjhXT1KWVi4MySo4T2YgcXx0PkGZ0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OKNkuPi3k/uwpjFe2cOIR+7zmX+U6S8BpVEIlZ7jujKmvWfYQ2B6cbc3tiuFMyhUYSgheikYY5HYAjbcX8EQlk+DODNh82z2bwE9SlikrfhwXC9dH/99U9+WHUbjg7mvehUbAyfUaKMp6MB/XSTdRl1/Kn27+b4tBVV2YmddnYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdGGL++Q; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdGGL++Q"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b2381c58941so345843066b.1
        for <linux-staging@lists.linux.dev>; Sat, 20 Sep 2025 03:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758365374; x=1758970174; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJc0EGzS/+BK6QuDuFmI2nY7ewfLLXuJxl0wU299He8=;
        b=AdGGL++Qr7XfJxx84FGJOGK2guISw5ZFuXgAvTSfgBIEPKzyjPuq6Q0hjISoOne/MY
         AmISi9hpx4dNOLamtNpxg9dt+vv7btgqAnYilHBA33gyIw6A1jwNKqenCSfdXeA/NqDe
         ByKFYVCGcEYh0IeUVIRFHXvJkUFqFcGxRjReYsV3rF93MLbgTmZ5ZjFqziPjz9JAeZqO
         I7UZRt4vT7GuXkkDs+JPTRHgEf8+zeNVksY0RIJDZb2NnJtiu6MRRE5QGnhOkCs4LOf1
         VjbCLk1XXIhAlA3k04Fxuqpg27mP9y/VIMFkMAa43qqLWYnWioK8Vkqu6FhfiCywIxOs
         x99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758365374; x=1758970174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJc0EGzS/+BK6QuDuFmI2nY7ewfLLXuJxl0wU299He8=;
        b=p0cDFnbp5DWx+sABoX6uBQZvqaFDP3+ZgCbC9W8B3pED5jbghwB4DLpB/2KfBbieav
         8GcEzh22z029eufya16tFtjWsa+gmm/n7pEF/sUwC3n31mkDaLjZzZN8XvUzgOl0ZgHj
         P6mVcLO6NiVNKC9FM+PMgdk7WewTj7a05FjqS8XibN5xgFdcQ5by9+Ty8iWtZzEfXQ/8
         3u4gea/iiJzlyxssLdDjLkp6vb9Ul3d1qKwrsTIpgplOpc77/lKmHnjLl4BY+gix1Feg
         6APokbZdvATZzV2AqUvUEPopAjrHT6KSdI7I6ZQ6dCOdY5RnnEkgtjYZzEz0wH7l6QlJ
         n2fw==
X-Forwarded-Encrypted: i=1; AJvYcCXGipfM6P2Ta8D9xPwSTmwphsHnrMcZsu/uoLRL/5kFvjYR37r7iuLRjpEaO4syKNl8oAVInEYKnCZnj519@lists.linux.dev
X-Gm-Message-State: AOJu0YxLUM60z02+yli9S6elYQRycFNfXES4FkBZ8dx0+jPdB8Wr8yrB
	+tOdhfGWHcO9veIH35PVcOe5wLFOVqJtWYc30iLXBfIW0gX2ymahXunz9dZa8cNgWu6TFr9jO5r
	L2nadk1BvRNmO+9zqxscdgz5KRt08yR8=
X-Gm-Gg: ASbGncvsuJRSW9WYzjM6ODPOswOX4XVLIbP2j/weESzkySTA6g+PhehwzbCOHVsjbWi
	d3WW23A5fkG8S48b3Dd6IK2R8tAI2j3iW97pKCeJQoW4wWbxSBpzWcXttV/n15WaG+XzUbPDAfT
	xVlIko2ZrLKHUkMewFTmH7KHjd/HYZKArLUJTCDcHZ6tyOuWbX2QnUNaPSTqtPbrIE0jNsDwC8+
	uKHuFo=
X-Google-Smtp-Source: AGHT+IHHbhBTYGUaEQMbVjyA0lAj2luPxy2XsbzoJZ2rvsPEEjKDVfN8Ekg2zTb0h70UHa/ky/mxQ7DHX1RPk/WuHD8=
X-Received: by 2002:a17:907:2d86:b0:afe:f418:2294 with SMTP id
 a640c23a62f3a-b24f4cd1612mr662812666b.49.1758365373591; Sat, 20 Sep 2025
 03:49:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
In-Reply-To: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 20 Sep 2025 13:48:57 +0300
X-Gm-Features: AS18NWAsgghzm2kBTHVAUWgTvM4Rjv6fz5BEJyNeWi6WNSHflPsd2h04LFjYcyQ
Message-ID: <CAHp75Vfx9kyP-rVtfvyyMK4VH+oiRVjP1fZOtbVH14iLh98Jxw@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] media: Introduce video device state management
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, 
	Ricardo Ribalda <ribalda@chromium.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, Ma Ke <make24@iscas.ac.cn>, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Hans de Goede <hansg@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Nick Dyer <nick@shmanahar.org>, 
	Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Matt Ranostay <matt@ranostay.sg>, Andy Walls <awalls@md.metrocast.net>, 
	Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Dan Scally <djrscally@gmail.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>, Andrey Utkin <andrey_utkin@fastmail.com>, 
	Ismael Luceno <ismael@iodev.co.uk>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Corentin Labbe <clabbe@baylibre.com>, Michael Tretter <m.tretter@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Keke Li <keke.li@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Ming Qian <ming.qian@nxp.com>, 
	Zhou Peng <eagle.zhou@nxp.com>, Eddie James <eajames@linux.ibm.com>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Eugen Hristev <eugen.hristev@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nas Chung <nas.chung@chipsnmedia.com>, Jackson Lee <jackson.lee@chipsnmedia.com>, 
	Devarsh Thakkar <devarsht@ti.com>, Bin Liu <bin.liu@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Joseph Liu <kwliu@nuvoton.com>, 
	Marvin Lin <kflin@nuvoton.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Jacob Chen <jacob-chen@iotwrt.com>, 
	Heiko Stuebner <heiko@sntech.de>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Detlev Casanova <detlev.casanova@collabora.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	=?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, 
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>, 
	Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Ripard <mripard@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Yong Deng <yong.deng@magewell.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Shreeya Patel <shreeya.patel@collabora.com>, 
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Jai Luthra <jai.luthra@linux.dev>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Michal Simek <michal.simek@amd.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Michael Krufky <mkrufky@linuxtv.org>, Mike Isely <isely@pobox.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Steve Longerbeam <slongerbeam@gmail.com>, 
	Jack Zhu <jack.zhu@starfivetech.com>, 
	Changhuang Liang <changhuang.liang@starfivetech.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, 
	Christian Gromm <christian.gromm@microchip.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Plamen Atanasov <tigerment@mail.bg>, Sean Young <sean@mess.org>, 
	Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Jiasheng Jiang <jiashengjiangcool@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
	Matthew Majewski <mattwmajewski@gmail.com>, Yunseong Kim <ysk@kzalloc.com>, Chen Ni <nichen@iscas.ac.cn>, 
	Fabio Luongo <f.langufo.l@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Yang Yingliang <yangyingliang@huawei.com>, Ludwig Disterhof <ludwig@disterhof.eu>, 
	"Everest K.C." <everestkc@everestkc.com.np>, Stefan Wahren <wahrenst@gmx.net>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Akash Kumar <quic_akakum@quicinc.com>, 
	linux-input@vger.kernel.org, mjpeg-users@lists.sourceforge.net, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org, 
	linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	kernel@collabora.com, linux-staging@lists.linux.dev, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 12:57=E2=80=AFPM Jai Luthra <jai.luthra@ideasonboar=
d.com> wrote:
>
> Hi,
>
> This patch series introduces state management for video devices.
>
> Currently, V4L2 subdevices have a well-established state management
> system [1] that allows the framework to store the subdevice state
> at a central location.
>
> Video devices however lack this, leading to inconsistent state handling
> across drivers and making it difficult to implement features like
> hardware multiplexing in complex media pipelines [2].
>
> The series is composed of three parts:
>
> - Core Infrastructure (PATCH 1-4)
>         Introduces the basic state structure, try state support,
>         initialization callbacks, and driver helpers
> - Framework Integration (PATCH 5-7)
>         Integrates state passing through the ioctl wrappers and driver
>         implementations
> - Driver Examples (PATCH 8-10)
>         Use the state to store formats in TI J721E CSI2RX and Rockchip
>         RKISP1 drivers
>
> This should also provide a foundation for drivers to extend or subclass
> the state structure with device-specific variables in future.
>
> I have tested capture and format negotiation with the converted drivers
> on SK AM62A (j721e-csi2rx) and Debix Model A (rkisp1).
>
> [1]: https://lore.kernel.org/linux-media/20210610145606.3468235-1-tomi.va=
lkeinen@ideasonboard.com/
> [2]: https://lore.kernel.org/linux-media/20250724-multicontext-mainline-2=
025-v2-0-c9b316773486@ideasonboard.com/

When you add a Cc list., do it after the '---' (three minus signs)
line, otherwise that huge unneeded noise will become part of the
commit message.


--=20
With Best Regards,
Andy Shevchenko
