Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247E42F26
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 14:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A31C340E7;
	Wed,  9 Feb 2022 14:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644417280;
	bh=93WKM7v5/YychVKtJOLIyN7q2nD5WbrrQq2HCEIbMmQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=paJVL2ma/xQI1G5kTxwmnxYV40yVd6zAOk4T3bBsPOR20gskmG8K7ax28vyCSx/cu
	 GJ08Q8l0HASluTtO1CMEVwKINoH+YnA6iz+VEIQ7xNOYXef+j5AkR/kJVA/2T7tOk4
	 N4eiWAWnLTOnT9YBMgiDXegtl8Ru/BR6+fwYEqwSZZc3PrriaokxTuKZJCkgioNz1b
	 drZQFMz9EW2tPiE7O0Etq6wxP5PcE6FcMNn896QR2L8Ozq/NN4jjocf9JoHBXsXxFx
	 1Cour/Zh7lN44947sN/Sjpg3SOqFz5rFUTKB1fVUYMhqwEhVGfjancFyovYkIcUfTu
	 Fa3sg+IHf/UwA==
From: Mark Brown <broonie@kernel.org>
To: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, David Airlie <airlied@linux.ie>, Antti Palosaari <crope@iki.fi>, Varka Bhadram <varkabhadram@gmail.com>, Nanyong Sun <sunnanyong@huawei.com>, Marco Felsch <m.felsch@pengutronix.de>, Alan Ott <alan@signal11.us>, Solomon Peachy <pizza@shaftnet.org>, linux-omap@vger.kernel.org, Ronald Tschalär <ronald@innovation.ch>, Peter Zijlstra <peterz@infradead.org>, Dan Carpenter <dan.carpenter@oracle.com>, linux-mmc@vger.kernel.org, linux-input@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Jérôme Pouiller <jerome.pouiller@silabs.com>, Manivannan Sadhasivam <mani@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Woojung Huh <woojung.huh@microchip.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>, Benson Leung <bleung@chromium.org>, Jaroslav Kysela <perex@perex.cz>, linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Emma Anholt <emma@anholt.net>, linux-fbdev@vge
 r.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Hans de Goede <hdegoede@redhat.com>, Fabio Estevam <festevam@gmail.com>, Alexandru Ardelean <ardeleanalex@gmail.com>, Yang Li <yang.lee@linux.alibaba.com>, linux-can@vger.kernel.org, Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>, linux-hwmon@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Torin Cooper-Bennun <torin@maxiluxsystems.com>, Rui Miguel Silva <rmfrfs@gmail.com>, Minghao Chi <chi.minghao@zte.com.cn>, Jonathan Neuschäfer <j.neuschaefer@gmx.net>, Jason Gunthorpe <jgg@ziepe.ca>, Geert Uytterhoeven <geert+renesas@glider.be>, Jakub Kicinski <kuba@kernel.org>, linux-integrity@vger.kernel.org, David Rhodes <david.rhodes@cirrus.com>, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, netdev@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, Vivien Didelot <vivien.didelot@gmail.com>, linux-serial@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Claudiu Beznea <claudiu.beznea@microchip.com>
 , Vignesh Raghavendra <vigneshr@ti.com>, linux-wpan@vger.kernel.org, Alexander Aring <alex.aring@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Wei Yongjun <weiyongjun1@huawei.com>, Dan Robertson <dan@dlrobertson.com>, Noralf Tronnes <notro@tronnes.org>, Christian Lamparter <chunkeey@googlemail.com>, Eric Piel <eric.piel@tremplin-utc.net>, Heiner Kallweit <hkallweit1@gmail.com>, Jonathan Cameron <jic23@kernel.org>, kernel@pengutronix.de, Wolfgang Grandegger <wg@grandegger.com>, Jon Hunter <jonathanh@nvidia.com>, Vladimir Oltean <olteanv@gmail.com>, Richard Weinberger <richard@nod.at>, Jarkko Sakkinen <jarkko@kernel.org>, dingsenjie <dingsenjie@yulong.com>, linux-wireless@vger.kernel.org, Xue Liu <liuxuenetmail@gmail.com>, Harry Morris <h.morris@cascoda.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Randy Dunlap <rdunlap@infradead.org>, Ulf Hansson <ulf.hansson@linaro.org>, Davidlohr Bueso <dbueso@suse.de>, Charles Keepax <ckeepax@opensource.cirrus.com>, Andrew Morton <akpm@linu
 x-foundation.org>, Mark Gross <markgross@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, Marek Behún <kabel@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-media@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Florian Fainelli <f.fainelli@gmail.com>, Charles-Antoine Couret <charles-antoine.couret@nexvision.fr>, Julia Lawall <Julia.Lawall@inria.fr>, Tudor Ambarus <tudor.ambarus@microchip.com>, Antoniu Miclaus <antoniu.miclaus@analog.com>, Łukasz Stelmach <l.stelmach@samsung.com>, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, patches@opensource.cirrus.com, Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>, linux-gpio@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ajay Singh <ajay.kathat@microchip.com>, Kalle Valo <kvalo@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Aditya Srivastava <yashsri421@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, wengjianfeng <wengjianfeng@yulong.com>, Thomas Kopp <thomas.kopp@microchip.com>, Stefan Mätje
  <stefan.maetje@esd.eu>, UNGLinuxDriver@microchip.com, Matt Kline <matt@bitbashing.io>, Mark Greer <mgreer@animalcreek.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, linux-clk@vger.kernel.org, Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Felipe Balbi <balbi@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Heiko Schocher <hs@denx.de>, Michael Walle <michael@walle.cc>, platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org, Noralf Trønnes <noralf@tronnes.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, libertas-dev@lists.infradead.org, Mike Looijmans <mike.looijmans@topic.nl>, Will Deacon <will@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Kent Gustavsson <kent@minoris.se>, David Lechner <david@lechnology.com>, Support Opensource <support.opensource@diasemi.com>, Peter Huewe <peterhuewe@gmx.de>, linux-mtd@lists.infradead.org, Andy Shevchenko <andriy.she
 vchenko@linux.intel.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Sidong Yang <realwakka@gmail.com>, "David S. Miller" <davem@davemloft.net>, dri-devel@lists.freedesktop.org, Jean Delvare <jdelvare@suse.com>, Marcus Folkesson <marcus.folkesson@gmail.com>, Markuss Broks <markuss.broks@gmail.com>, Colin Ian King <colin.king@intel.com>, Jiri Prchal <jiri.prchal@aksignal.cz>, Yang Shen <shenyang39@huawei.com>, Gwendal Grignou <gwendal@chromium.org>, linux-spi@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, James Schulman <james.schulman@cirrus.com>, Guenter Roeck <groeck@google.com>, Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, Stephan Gerhold <stephan@gerhold.net>, Stephen Boyd <sboyd@kernel.org>, linux-staging@lists.linux.dev, Helge Deller <deller@gmx.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Michael Hennerich <Michael.Hennerich@analog.com>, Lee Jones <lee.jones@linaro.org>, Dmitry Torokhov <dmitry.torokhov
 @gmail.com>, Andrew Lunn <andrew@lunn.ch>, Zhang Qilong <zhangqilong3@huawei.com>, linux-stm32@st-md-mailman.stormreply.com, Pavel Machek <pavel@ucw.cz>, Stefan Wahren <stefan.wahren@i2se.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Nuno Sá <nuno.sa@analog.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Jingoo Han <jingoohan1@gmail.com>, Claudius Heine <ch@denx.de>, Lucas Tanure <tanureal@opensource.cirrus.com>, Thomas Zimmermann <tzimmermann@suse.de>, linux-iio@vger.kernel.org, Cai Huoqing <caihuoqing@baidu.com>, Maxime Ripard <mripard@kernel.org>, Daniel Mack <daniel@zonque.org>
In-Reply-To: <20220123175201.34839-1-u.kleine-koenig@pengutronix.de>
References: <20220123175201.34839-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 0/5] spi: make remove callback a void function
Message-Id: <164441724879.1527840.5788097152300863157.b4-ty@kernel.org>
Date: Wed, 09 Feb 2022 14:34:08 +0000
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 23 Jan 2022 18:51:56 +0100, Uwe Kleine-König wrote:
> this series goal is to change the spi remove callback's return value to void.
> After numerous patches nearly all drivers already return 0 unconditionally.
> The four first patches in this series convert the remaining three drivers to
> return 0, the final patch changes the remove prototype and converts all
> implementers.
> 
> The driver core doesn't support error handling on remove, the spi core issues
> only a very generic warning when a remove callback returns an error. If there
> is really the need for a function call that can fail, the driver can issue a
> more helpful error message. I didn't find a single driver where returning
> an error code and error handling in the spi core would have been helpful.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/5] staging: fbtft: Fix error path in fbtft_driver_module_init()
      commit: 7d8e4c98d13b6b54655140d6b6a6a17fbc9b32f1
[2/5] staging: fbtft: Deduplicate driver registration macros
      commit: c222ea5d2f3361458672d1f52c78970aa021cb61
[3/5] tpm: st33zp24: Make st33zp24_remove() a void function
      commit: 316f569df766df9a49c36c052ec6afaf19cb6933
[4/5] platform/chrome: cros_ec: Make cros_ec_unregister() return void
      commit: afb0a80e63d67e957b5d0eb4ade301aff6e13c8c
[5/5] spi: make remove callback a void function
      commit: 2cbfa2128662c6b841f68cd2fe54df199457e38a

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
