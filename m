Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C992575;
	Wed, 29 Jun 2022 13:10:48 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id s1so22388805wra.9;
        Wed, 29 Jun 2022 06:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VlYfBx7EBUtDE6uBFY9byn1Ncu+EZBKbWlzwPeBiTVc=;
        b=frD1ngE13/en6394O8XepcZvUrZBA03m6xml3were+xCmvmDUuk1J0NNZRwyoKaZsM
         5+4VUSvngflolWxauJlu+LvSXiFmOUcfgeF2nk+hKLvW3M/lD+KAnQAe/K2tJyDJNegQ
         Ml4xaICVivn+SaBPSKOxO4SmTbW0RFR+qm9YIHEndJDANW5s32CjRG3ZqGqYACVr1zR6
         IBW3FQPZupJPgkXzmHbMjtbyyoh3Y9pEFiV7KvrmTrDSDw51VwJE0C5uxESvGhzsr89I
         E9VGjTtKiCGJQOwgLuXTvIGM2V5wOy6ufN5mi08u68das+YgUBakXmDUnQl5m6THNyEw
         AA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VlYfBx7EBUtDE6uBFY9byn1Ncu+EZBKbWlzwPeBiTVc=;
        b=cg0mngekJoKjjULLJpg4wpnGJCjCkVvozSNxD1G9DW2HB52oQ8nV5jPiHoQCTFwQ8q
         B6OWWVQT2vCpTkSkHUHS0zMMFexE21SUqDh7Bwu/qFHbf8+qxD5gRaCLjOnU8SWRIB4p
         U1PBoq0PAipn77blwiti4Ggn/f2QDOzm1y2JjDeDyg48bFYyGsQeHCZutf2U0SsS13+D
         FpRlXiGTGYX6mhKQXySAKhG4BmJXpzY3sTOKIc+6tZ2dROaz+xtntH2IJhE6K0rCqfKj
         LJRMSO7tKo/xPU4mFwfnZ3YjBEiAUsWeLO7LKSehTJZdwg3LIbUIpXVQAeD4EsE+0KZV
         65gw==
X-Gm-Message-State: AJIora8G64imaRFDforCz/ZE9jF0nwyHxTboTcnPRsZImbnC3i2RD/R2
	+BpN82Y65ifYkSKUcrmX9l6Q8IXS62ZyKhGfkFk=
X-Google-Smtp-Source: AGRyM1vJ4Bhi7JcB3Mk7ILH8mUAA6z2j2UT+Dyfz1mp+09MukaINS6AUVoLreV/hTUTvHyU7PGpRXM+ZDF1zXQd6nAY=
X-Received: by 2002:adf:f90c:0:b0:21a:3dcb:d106 with SMTP id
 b12-20020adff90c000000b0021a3dcbd106mr3045617wrr.448.1656508246749; Wed, 29
 Jun 2022 06:10:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de> <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Date: Wed, 29 Jun 2022 16:11:26 +0300
Message-ID: <CAPAsAGwP4Mw_CJfsi7oapABdTBwO1HfiQux6X4UahspU74VjtQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Wolfram Sang <wsa@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>, 
	Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>, 
	Scott Wood <oss@buserror.net>, Michael Ellerman <mpe@ellerman.id.au>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, 
	Robin van der Gracht <robin@protonic.nl>, Miguel Ojeda <ojeda@kernel.org>, Corey Minyard <minyard@acm.org>, 
	Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Luca Ceresoli <luca@lucaceresoli.net>, Tudor Ambarus <tudor.ambarus@microchip.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Michael Hennerich <michael.hennerich@analog.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Robert Foss <robert.foss@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Phong LE <ple@baylibre.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, Peter Senna Tschudin <peter.senna@gmail.com>, 
	Martin Donnelly <martin.donnelly@ge.com>, Martyn Welch <martyn.welch@collabora.co.uk>, 
	Douglas Anderson <dianders@chromium.org>, Stefan Mavrodiev <stefan@olimex.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Florian Fainelli <f.fainelli@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Jean Delvare <jdelvare@suse.com>, 
	George Joseph <george.joseph@fairview5.com>, Juerg Haefliger <juergh@gmail.com>, 
	Riku Voipio <riku.voipio@iki.fi>, Robert Marko <robert.marko@sartura.hr>, 
	Luka Perkov <luka.perkov@sartura.hr>, Marc Hulsman <m.hulsman@tudelft.nl>, 
	Rudolf Marek <r.marek@assembler.cz>, Peter Rosin <peda@axentia.se>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Dan Robertson <dan@dlrobertson.com>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Tomasz Duszynski <tduszyns@gmail.com>, 
	Kevin Tsai <ktsai@capellamicro.com>, Crt Mori <cmo@melexis.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Nick Dyer <nick@shmanahar.org>, 
	Bastien Nocera <hadess@hadess.net>, Hans de Goede <hdegoede@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, 
	Jan-Simon Moeller <jansimon.moeller@gmx.de>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Colin Leroy <colin@colino.net>, Joe Tessler <jrt@google.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Antti Palosaari <crope@iki.fi>, Jasmin Jessich <jasmin@anw.at>, Matthias Schwarzott <zzam@gentoo.org>, 
	Olli Salonen <olli.salonen@iki.fi>, Akihiro Tsukada <tskd08@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Dongchun Zhu <dongchun.zhu@mediatek.com>, Shawn Tu <shawnx.tu@intel.com>, 
	Martin Kepplinger <martink@posteo.de>, Ricardo Ribalda <ribalda@kernel.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Leon Luo <leonl@leopardimaging.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bingbu Cao <bingbu.cao@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>, 
	Michael Tretter <m.tretter@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Heungjun Kim <riverful.kim@samsung.com>, 
	Ramesh Shanmugasundaram <rashanmu@gmail.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Jimmy Su <jimmy.su@intel.com>, Arec Kao <arec.kao@intel.com>, 
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Shunqian Zheng <zhengsq@rock-chips.com>, 
	Steve Longerbeam <slongerbeam@gmail.com>, Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Wenyou Yang <wenyou.yang@microchip.com>, 
	Petr Cvek <petrcvekcz@gmail.com>, Akinobu Mita <akinobu.mita@gmail.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Mats Randgaard <matrandg@cisco.com>, 
	Tim Harvey <tharvey@gateworks.com>, Matt Ranostay <matt.ranostay@konsulko.com>, 
	Eduardo Valentin <edubezval@gmail.com>, "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, 
	Lee Jones <lee.jones@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Support Opensource <support.opensource@diasemi.com>, Robert Jones <rjones@gateworks.com>, 
	Andy Shevchenko <andy@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tony Lindgren <tony@atomide.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Eric Piel <eric.piel@tremplin-utc.net>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, 
	George McCollister <george.mccollister@gmail.com>, Ido Schimmel <idosch@nvidia.com>, 
	Petr Machata <petrm@nvidia.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Matt Johnston <matt@codeconstruct.com.au>, Charles Gorand <charles.gorand@effinnov.com>, 
	Krzysztof Opasiak <k.opasiak@samsung.com>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Mark Gross <markgross@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Tobias Schrammm <t.schramm@manjaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Alessandro Zummo <a.zummo@towertech.it>, Jens Frederich <jfrederich@gmail.com>, 
	Jon Nettleton <jon.nettleton@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Felipe Balbi <balbi@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Helge Deller <deller@gmx.de>, Evgeniy Polyakov <zbr@ioremap.net>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	James Schulman <james.schulman@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Lucas Tanure <tanureal@opensource.cirrus.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Oder Chiou <oder_chiou@realtek.com>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Cernekee <cernekee@chromium.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Maxime Ripard <maxime@cerno.tech>, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	Lucas Stach <l.stach@pengutronix.de>, Jagan Teki <jagan@amarulasolutions.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Alex Deucher <alexander.deucher@amd.com>, Lyude Paul <lyude@redhat.com>, 
	Xin Ji <xji@analogixsemi.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	=?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
	Yang Li <yang.lee@linux.alibaba.com>, Angela Czubak <acz@semihalf.com>, 
	Alistair Francis <alistair@alistair23.me>, Eddie James <eajames@linux.ibm.com>, 
	Joel Stanley <joel@jms.id.au>, Nathan Chancellor <nathan@kernel.org>, 
	Antoniu Miclaus <antoniu.miclaus@analog.com>, Alexandru Ardelean <ardeleanalex@gmail.com>, 
	Dmitry Rokosov <DDRokosov@sberdevices.ru>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Stephan Gerhold <stephan@gerhold.net>, 
	Miaoqian Lin <linmq006@gmail.com>, Gwendal Grignou <gwendal@chromium.org>, 
	Yang Yingliang <yangyingliang@huawei.com>, Paul Cercueil <paul@crapouillou.net>, 
	Daniel Palmer <daniel@0x0f.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Marek Vasut <marex@denx.de>, 
	Jose Cazarin <joseespiriki@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, 
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, Michael Srba <Michael.Srba@seznam.cz>, 
	Nikita Travkin <nikita@trvn.ru>, Maslov Dmitry <maslovdmitry@seeed.cc>, Jiri Valek - 2N <valek@2n.cz>, 
	Arnaud Ferraris <arnaud.ferraris@collabora.com>, Zheyu Ma <zheyuma97@gmail.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Oliver Graute <oliver.graute@kococonnector.com>, 
	Zheng Yongjun <zhengyongjun3@huawei.com>, CGEL ZTE <cgel.zte@gmail.com>, 
	Minghao Chi <chi.minghao@zte.com.cn>, Evgeny Novikov <novikov@ispras.ru>, Sean Young <sean@mess.org>, 
	Kirill Shilimanov <kirill.shilimanov@huawei.com>, 
	Moses Christopher Bollavarapu <mosescb.dev@gmail.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Dongliang Mu <mudongliangabcd@gmail.com>, 
	Colin Ian King <colin.king@intel.com>, lijian <lijian@yulong.com>, 
	Kees Cook <keescook@chromium.org>, Yan Lei <yan_lei@dahuatech.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Jonas Malaco <jonas@protocubo.io>, 
	wengjianfeng <wengjianfeng@yulong.com>, Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
	Wei Yongjun <weiyongjun1@huawei.com>, Tom Rix <trix@redhat.com>, Yizhuo <yzhai003@ucr.edu>, 
	Martiros Shakhzadyan <vrzh@vrzh.net>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Hector Martin <marcan@marcan.st>, Saranya Gopal <saranya.gopal@intel.com>, 
	=?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
	Sing-Han Chen <singhanc@nvidia.com>, Wayne Chang <waynec@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Alexey Dobriyan <adobriyan@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Vincent Knecht <vincent.knecht@mailoo.org>, 
	Stephen Kitt <steve@sk2.org>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Alexey Khoroshilov <khoroshilov@ispras.ru>, Randy Dunlap <rdunlap@infradead.org>, 
	Alejandro Tafalla <atafalla@dnyon.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Seven Lee <wtli@nuvoton.com>, Mac Chiang <mac.chiang@intel.com>, David Lin <CTLIN0@nuvoton.com>, 
	Daniel Beer <daniel.beer@igorinstitute.com>, Ricard Wanderlof <ricardw@axis.com>, 
	Simon Trimmer <simont@opensource.cirrus.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Viorel Suman <viorel.suman@nxp.com>, Nicola Lunghi <nick83ola@gmail.com>, 
	Adam Ford <aford173@gmail.com>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	openipmi-developer@lists.sourceforge.net, linux-integrity@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	chrome-platform@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
	linux-input@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-leds@vger.kernel.org, linux-media <linux-media@vger.kernel.org>, 
	patches@opensource.cirrus.com, alsa-devel@alsa-project.org, 
	linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, 
	linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	kasan-dev <kasan-dev@googlegroups.com>, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 6/28/22 17:03, Uwe Kleine-K=C3=B6nig wrote:
> From: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
>
> The value returned by an i2c driver's remove function is mostly ignored.
> (Only an error message is printed if the value is non-zero that the
> error is ignored.)
>
> So change the prototype of the remove function to return no value. This
> way driver authors are not tempted to assume that passing an error to
> the upper layer is a good idea. All drivers are adapted accordingly.
> There is no intended change of behaviour, all callbacks were prepared to
> return 0 before.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
                                    | 2 +-
>  lib/Kconfig.kasan                                         | 1 +

> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index f0973da583e0..366e61639cb2 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -149,6 +149,7 @@ config KASAN_STACK
>       depends on KASAN_GENERIC || KASAN_SW_TAGS
>       depends on !ARCH_DISABLE_KASAN_INLINE
>       default y if CC_IS_GCC
> +     depends on !ARM
>       help
>         Disables stack instrumentation and thus KASAN's ability to detect
>         out-of-bounds bugs in stack variables.


What is this doing here?
