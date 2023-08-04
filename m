Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA0118026;
	Fri,  4 Aug 2023 18:52:28 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6bca3588edbso1896544a34.0;
        Fri, 04 Aug 2023 11:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691175147; x=1691779947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HItNTIMvCIXfonBezfurR93L/l9UQl6IcmZ4tatzJA=;
        b=mlUliX93F5qFHHI1eoLLCSxrP0sRwTu71E0+0iF7A2cwIL58bh7yKQ2Zd6VhPOrrVR
         4WdI+88TPtQ+l7NhMMov1wuxD/H4Wfpqib7Yg1CqBoLVgI9m47L6ZB6NS2aAqZe2o87V
         jYs5ldnsb607oh+VfEDrtHDLtwbY6DO6R6Ugm+ofDucq4j8Xc5ioeiscE+q98v0yR9a3
         RDVFTtbnWiWvOcsAhM3mLGK8JySKNDA30p9zWKdJUEpFB63B4SH4l7UsNu010WqETrWY
         l4LdvmiG2xu7jdQFyaLi3vGEmIrG+6Q/NS66/vkYPDGplv0UaIiAPepVwHTI+A+HM11B
         lAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691175147; x=1691779947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HItNTIMvCIXfonBezfurR93L/l9UQl6IcmZ4tatzJA=;
        b=GDTaM8jNCK46EnMVgwPft3Nmsm4qNeoOhGa81Dcl5qn3dxIYuwp05O/Kg3WXUiA+Vu
         n6r3WT9m+5PZzm3yfD9NNZx7vf3rzEh4WThkHcikGpCbrsYDMTaHdbCMJcT0MES2lImi
         OZL6X6E57fbtJeSuYg3qHTS2JG9Ea6e5ShiRREHYER1/tPUmWO/AkoSYig36vPePDFOQ
         RtmJkX6vEMRptGIluwd0laz1KPdaxIiK3PJpZ0KMGJuO+yZ0kVJX7PK1gcbSUguYrh4p
         jThKBg4uoWrGjpb1rDRSbx+qO9Hx7qPl10wEc2XS9/ku21t1SAPSA/1gEBf9mXjgQctq
         WBDQ==
X-Gm-Message-State: AOJu0Yz2CJdbIRaIM/HhLMC6PBaW6TdFJ5XrHLkmnIT7J2ArvloBqA1Q
	je5fQOYBBEREZCl+x4f2YbrLGUURZqD1PIU33iA=
X-Google-Smtp-Source: AGHT+IGzp9pVDMXWry56NsZy1Wlu+pLORC3ORFvtBGhMu6TYOCe+P8wMbQo5bZqDncwUMYd/rqllnaxHLBBvOMv3P6I=
X-Received: by 2002:a05:6870:ac2a:b0:1be:feb0:33ff with SMTP id
 kw42-20020a056870ac2a00b001befeb033ffmr2969895oab.6.1691175147496; Fri, 04
 Aug 2023 11:52:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de> <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 4 Aug 2023 21:51:51 +0300
Message-ID: <CAHp75Vfr2VrKXiOnM7=+K6MvOdCdy52xb5PB+dzKMeHonF04eQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pwm: Manage owner assignment implicitly for drivers
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Alexander Shiyan <shc_work@mail.ru>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Paul Cercueil <paul@crapouillou.net>, 
	Vladimir Zapolskiy <vz@mleia.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Michael Walle <michael@walle.cc>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
	Hammer Hsieh <hammerh0314@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Sean Anderson <sean.anderson@seco.com>, 
	Michal Simek <michal.simek@amd.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Anjelique Melendez <quic_amelende@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Luca Weiss <luca@z3ntu.xyz>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, linux-pwm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 4, 2023 at 5:28=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Instead of requiring each driver to care for assigning the owner member
> of struct pwm_ops, handle that implicitly using a macro. Note that the
> owner member has to be moved to struct pwm_chip, as the ops structure
> usually lives in read-only memory and so cannot be modified.
>
> The upside is that new lowlevel drivers cannot forget the assignment and

low level

> save one line each. The pwm-crc driver didn't assign .owner, that's not
> a problem in practise though as the driver cannot be compiled as a
> module.

...

>  drivers/pwm/pwm-lpss.c                |  1 -

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com> # Intel LPSS

--=20
With Best Regards,
Andy Shevchenko
