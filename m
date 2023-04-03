Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB528F6E;
	Mon,  3 Apr 2023 19:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83EEC4339B;
	Mon,  3 Apr 2023 19:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1680551445;
	bh=lOZoZur0dlMwg23s/E6ookGvEsUZzxEjsaf7n78uxD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nEBMvaSDo6Kx3uTTuk0gcIjpmL+QxmtvplsE3iV+Yad8oVUuYckRsG32R0nXIl7RF
	 df7SulQgWa+RfGcINl7HL+vcKeBJS6LuhRgnjoJDfbS2hMh3ZIjZ5Daw8Yc0FSZbkY
	 koEdBw32GguOTg412wDd6ymUfsqZp5iBNOEaSJDk=
Date: Mon, 3 Apr 2023 21:50:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Deepak R Varma <drv@mailo.com>, Yuan Can <yuancan@huawei.com>,
	Simon Horman <horms@verge.net.au>,
	Sven Van Asbroeck <TheSven73@gmail.com>,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Marc Dietrich <marvin24@gmx.de>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Adrien Thierry <athierry@redhat.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jakob Koschel <jakobkoschel@gmail.com>,
	linux-staging@lists.linux.dev, kernel@pengutronix.de,
	greybus-dev@lists.linaro.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
	ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 00/24] staging: Convert to platform remove callback
 returning void
Message-ID: <2023040305-drudge-scorer-b59c@gregkh>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>

On Mon, Apr 03, 2023 at 05:39:50PM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> this series adapts the platform drivers below drivers/staging to use the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver
> core doesn't (and cannot) cope for errors during remove. The only effect
> of a non-zero return value in .remove() is that the driver core emits a
> warning. The device is removed anyhow and an early return from .remove()
> usually yields a resource leak.
> 
> By changing the remove callback to return void driver authors cannot
> reasonably assume any more that there is some kind of cleanup later.
> 
> All drivers in staging already return zero in their remove callback, so
> they can be trivially converted.
> 
> The changes to the individual drivers are all orthogonal. If I need to
> resend some patches because of some review feedback, I'd like to only
> send the patches that actually needed changes, so please pick up the
> remaining patches that don't need changing to reduce the amount of mail.

Note, I can't take drivers/staging/media/ patches, those go through the
v4l maintainer's tree.  So I've taken the non-media patches from this
series now.

thanks,

greg k-h
