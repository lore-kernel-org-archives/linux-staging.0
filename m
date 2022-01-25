Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF912CA7
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 10:43:52 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id m90so36646222uam.2
        for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 02:43:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KUBI31PDeAnUzGFlBJuIh4dmvfrE44RhBRVMq2wEYSI=;
        b=hSUa0evRb9/RSgT2MK0zFyKa6X22gu8CR6HOSelywkob2YbIOcSl0M9WJOivrvm3Ay
         iXek+br9EkkEIvl9omul3Nq5sV7r6tST/ADR2C+XVRAufANUdt+i/lwCYQQgnZeVOMRr
         WDQARBqRIX0DqizzypiEJEKdG+EEICJRFR/lotF4EOO39QK7V74983iZD/8kTw2rM92M
         UT8Y9KMzDTalEkdOBGYo2DKSlFqp5cjnyUdaxGJvKcJ0h6KLORlPVYimeZUYVE2t3V06
         RpR0sf3FRmfY0+1jE0O4fJc1yZFqG3UqI/qgfaXXd12Cl6YhzB89vL3a43PcifOC6Hnn
         XmuA==
X-Gm-Message-State: AOAM531vXHhKlm7Cp4KTZLVC9tgYbbl/LmG61YBwgSD4X5yAGyUKBRin
	F+LLhzj9n5rMkpTJhcyGtcnY02ZiNcSuPO5I
X-Google-Smtp-Source: ABdhPJzmRSafp6UN8u0JD6qUJampLVJPcTgIye+JJQt/lfcYtJgvnwlxBJ49EeCRNcsV7kZHuZOU3Q==
X-Received: by 2002:a67:8cc1:: with SMTP id o184mr52531vsd.19.1643107431552;
        Tue, 25 Jan 2022 02:43:51 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id d74sm3339791vkf.1.2022.01.25.02.43.51
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jan 2022 02:43:51 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id d189so12138875vkg.3
        for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 02:43:51 -0800 (PST)
X-Received: by 2002:a05:6102:34e:: with SMTP id e14mr295625vsa.68.1643107051968;
 Tue, 25 Jan 2022 02:37:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220123175201.34839-1-u.kleine-koenig@pengutronix.de> <20220123175201.34839-6-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220123175201.34839-6-u.kleine-koenig@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Jan 2022 11:37:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWCRyyq1=5+YnXgt2=B-qXMGWXC4XtnP_GHGvghdaH_XQ@mail.gmail.com>
Message-ID: <CAMuHMdWCRyyq1=5+YnXgt2=B-qXMGWXC4XtnP_GHGvghdaH_XQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] spi: make remove callback a void function
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Markuss Broks <markuss.broks@gmail.com>, Emma Anholt <emma@anholt.net>, 
	David Lechner <david@lechnology.com>, Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, 
	=?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Dan Robertson <dan@dlrobertson.com>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, Kent Gustavsson <kent@minoris.se>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@ucw.cz>, Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Charles-Antoine Couret <charles-antoine.couret@nexvision.fr>, Antti Palosaari <crope@iki.fi>, 
	Lee Jones <lee.jones@linaro.org>, Support Opensource <support.opensource@diasemi.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Eric Piel <eric.piel@tremplin-utc.net>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Thomas Kopp <thomas.kopp@microchip.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, 
	=?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, 
	Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, 
	Harry Morris <h.morris@cascoda.com>, Varka Bhadram <varkabhadram@gmail.com>, 
	Xue Liu <liuxuenetmail@gmail.com>, Alan Ott <alan@signal11.us>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Christian Lamparter <chunkeey@googlemail.com>, Kalle Valo <kvalo@kernel.org>, 
	Ajay Singh <ajay.kathat@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Solomon Peachy <pizza@shaftnet.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Mark Greer <mgreer@animalcreek.com>, 
	Benson Leung <bleung@chromium.org>, Hans de Goede <hdegoede@redhat.com>, 
	Mark Gross <markgross@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	=?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>, 
	Jiri Slaby <jirislaby@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Helge Deller <deller@gmx.de>, James Schulman <james.schulman@cirrus.com>, 
	David Rhodes <david.rhodes@cirrus.com>, Lucas Tanure <tanureal@opensource.cirrus.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Daniel Mack <daniel@zonque.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Stephan Gerhold <stephan@gerhold.net>, 
	Alexandru Ardelean <ardeleanalex@gmail.com>, Mike Looijmans <mike.looijmans@topic.nl>, 
	Gwendal Grignou <gwendal@chromium.org>, Cai Huoqing <caihuoqing@baidu.com>, 
	Minghao Chi <chi.minghao@zte.com.cn>, Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Julia Lawall <Julia.Lawall@inria.fr>, =?UTF-8?Q?Ronald_Tschal=C3=A4r?= <ronald@innovation.ch>, 
	Marco Felsch <m.felsch@pengutronix.de>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>, Jon Hunter <jonathanh@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Heiko Schocher <hs@denx.de>, 
	Fabio Estevam <festevam@gmail.com>, Colin Ian King <colin.king@intel.com>, 
	Dan Carpenter <dan.carpenter@oracle.com>, Tudor Ambarus <tudor.ambarus@microchip.com>, 
	Matt Kline <matt@bitbashing.io>, Torin Cooper-Bennun <torin@maxiluxsystems.com>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, =?UTF-8?Q?Stefan_M=C3=A4tje?= <stefan.maetje@esd.eu>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, Wei Yongjun <weiyongjun1@huawei.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yang Shen <shenyang39@huawei.com>, dingsenjie <dingsenjie@yulong.com>, 
	Aditya Srivastava <yashsri421@gmail.com>, Stefan Wahren <stefan.wahren@i2se.com>, 
	Peter Zijlstra <peterz@infradead.org>, Michael Walle <michael@walle.cc>, 
	Yang Li <yang.lee@linux.alibaba.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	wengjianfeng <wengjianfeng@yulong.com>, Sidong Yang <realwakka@gmail.com>, 
	Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>, 
	Zhang Qilong <zhangqilong3@huawei.com>, Will Deacon <will@kernel.org>, 
	Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>, Davidlohr Bueso <dbueso@suse.de>, 
	Claudius Heine <ch@denx.de>, Jiri Prchal <jiri.prchal@aksignal.cz>, linux-kernel@vger.kernel.org, 
	linux-integrity@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-media@vger.kernel.org, patches@opensource.cirrus.com, 
	alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-can@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wpan@vger.kernel.org, 
	linux-wireless@vger.kernel.org, libertas-dev@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-omap@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 23, 2022 at 6:54 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> The value returned by an spi driver's remove function is mostly ignored.
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

>  drivers/spi/spi-slave-system-control.c                |  3 +--
>  drivers/spi/spi-slave-time.c                          |  3 +--
>  drivers/spi/spi.c                                     | 11 ++---------
>  drivers/spi/spidev.c                                  |  4 +---

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
