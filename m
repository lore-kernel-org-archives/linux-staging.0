Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F47C2F80
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 08:41:49 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 2B0BBC439A
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 08:41:41 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B00621C0014;
	Tue, 17 Aug 2021 08:41:24 +0000 (UTC)
Date: Tue, 17 Aug 2021 10:41:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar
 <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Peter
 Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>, Lee Jones
 <lee.jones@linaro.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@pengutronix.de>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, Lucas
 Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>, Adrian Hunter
 <adrian.hunter@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 21/34] mtd: rawnand: tegra: Add runtime PM and OPP
 support
Message-ID: <20210817104123.1854cf17@xps13>
In-Reply-To: <20210817012754.8710-22-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
	<20210817012754.8710-22-digetx@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Dmitry Osipenko <digetx@gmail.com> wrote on Tue, 17 Aug 2021 04:27:41
+0300:

> The NAND on Tegra belongs to the core power domain and we're going to
> enable GENPD support for the core domain. Now NAND must be resumed using
> runtime PM API in order to initialize the NAND power state. Add runtime PM
> and OPP support to the NAND driver.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/mtd/nand/raw/tegra_nand.c | 62 +++++++++++++++++++++++++++----
>  1 file changed, 54 insertions(+), 8 deletions(-)
>=20

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
