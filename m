Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B6D72
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 17:03:52 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id o15so4236391wmr.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 10:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oJSyVi1Ti8Nnw90fU6cpGrkDUh7d4poA+u+RmE9yClc=;
        b=WjO9vG1rxjOXSea0lggzneOK1T6brU84ws+V+SOshWtWLDtP8dw4z3PqYpbiYfKli1
         rXcVeuPjT7MJg7Hy5j8m3cd8kdbRkCEcM1Y80y8aKWqMDBpsEeU4BdtyUa/ON6dEIpuI
         ZH83YfvUPLz7N8Eucoioijep/MF/3w0IGFv19+kQ9bZgPKOHNPjpkkiiG7frHJKiLmhR
         PSWLWci5igVYTxBtqkvlj5fV5Gwf9+1XGIFKjnJNTLfzWugJ7siIAcnkXrphSw12V8Us
         vFqkDjmlPCNix0bh4GlaOKtAD+MVeEwQ6e6JDKcS6m84MivgDrAwN5keeZsMvCUxJPh5
         owbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oJSyVi1Ti8Nnw90fU6cpGrkDUh7d4poA+u+RmE9yClc=;
        b=LAHz1Wz1/Zljt5//6+LuQ8iJqGliM72dvDnWKNjnrOPeBr5u0mLQzP+0aMFAfr5pL4
         eKrX+mGy63pK76+0hSQZEQGStFwYk6M9TiANPzp/KzQRCWH5VeTvgyCIyW46GsH8H04Q
         cOFes/mbVPYtLGCzw2gXAXgbv+2nkk/j0rBG4qbZK7U2+Uv2rFZrC+pCNrYabs1G7Fqa
         PCOxRx4rZyvOFTMyJOAirvMBnxCchoVTDfvJDlcmmD9nhUoWKyL5utn6B6tu1sJ62iJU
         4Y6qJ6m8NxyRTrglcDGl8u+nVaDqUVJXv59A919xGXvhjUUKKelmVsIxIUDhMVWWaHFF
         w0Rw==
X-Gm-Message-State: AOAM531dEYrk8bj46OwD21puShtaliCoaNHdHDdIiA9f4YOHykmqBoP+
	frUJ3Xq9zwsaHPzPyyD+qyQ=
X-Google-Smtp-Source: ABdhPJzLX7hjX9RRU2YIQz+WOkf7C4KD77ZHazVOwLC50X1dVFEX0qYgndjCiaQPFM42jC66tRB3Yw==
X-Received: by 2002:a05:600c:3641:: with SMTP id y1mr14362707wmq.43.1629392630595;
        Thu, 19 Aug 2021 10:03:50 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id e3sm3493730wrv.65.2021.08.19.10.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 10:03:49 -0700 (PDT)
Date: Thu, 19 Aug 2021 19:03:48 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 20/34] mmc: sdhci-tegra: Add runtime PM and OPP support
Message-ID: <YR6O9Om+HzMMG8AR@orome.fritz.box>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-21-digetx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Zkl/ZGRNLhkdNGO0"
Content-Disposition: inline
In-Reply-To: <20210817012754.8710-21-digetx@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)


--Zkl/ZGRNLhkdNGO0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2021 at 04:27:40AM +0300, Dmitry Osipenko wrote:
> The SDHCI on Tegra belongs to the core power domain and we're going to
> enable GENPD support for the core domain. Now SDHCI must be resumed using
> runtime PM API in order to initialize the SDHCI power state. The SDHCI
> clock rate must be changed using OPP API that will reconfigure the power
> domain performance state in accordance to the rate. Add runtime PM and OPP
> support to the SDHCI driver.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/mmc/host/sdhci-tegra.c | 146 ++++++++++++++++++++++++---------
>  1 file changed, 105 insertions(+), 41 deletions(-)
>=20
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegr=
a.c
> index 387ce9cdbd7c..a3583359c972 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -15,6 +15,8 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/pinctrl/consumer.h>
> +#include <linux/pm_opp.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/mmc/card.h>
> @@ -24,6 +26,8 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/ktime.h>
> =20
> +#include <soc/tegra/common.h>
> +
>  #include "sdhci-pltfm.h"
>  #include "cqhci.h"
> =20
> @@ -123,6 +127,12 @@
>  					 SDHCI_TRNS_BLK_CNT_EN | \
>  					 SDHCI_TRNS_DMA)
> =20
> +enum {
> +	TEGRA_CLK_BULK_SDHCI,
> +	TEGRA_CLK_BULK_TMCLK,
> +	TEGRA_CLK_BULK_NUM,
> +};
> +
>  struct sdhci_tegra_soc_data {
>  	const struct sdhci_pltfm_data *pdata;
>  	u64 dma_mask;
> @@ -171,6 +181,8 @@ struct sdhci_tegra {
>  	bool enable_hwcq;
>  	unsigned long curr_clk_rate;
>  	u8 tuned_tap_delay;
> +
> +	struct clk_bulk_data clocks[TEGRA_CLK_BULK_NUM];

This doesn't seem worth it to me. There's a lot of churn in this driver
that's only needed to convert this to the clk_bulk API and it makes the
code a lot more difficult to read, in my opinion.

It looks like the only benefit that this gives us is that runtime
suspend and resume become a few lines shorter.

Thierry

--Zkl/ZGRNLhkdNGO0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEejvQACgkQ3SOs138+
s6GP7Q//aRZFqje0kEFRTOZPc/3kSiWj3ZUdkPxBKI8ZmISgrBH2orJG4ZW3OaNl
CdiK1hqqEgEsJHuHndJqfCjxgwTwO/0zcGEwU6XcpaP0Zdh/IsIE1Qc4pHPWN7oQ
Mcu5gLnbaDh+ej6Xpw09BpTDoZtuD20vxOf7g97ZmKlWpKS2sFL4HuKcaYWMxoM0
43Qh7BuDv4iyY4BFdiNhEsh/Yx/2fFMjU8DQRbggqmePZYAyNDRDqOZ8vBpjmcIe
Ub0niDGP+iEcPtw2F14RVjhAkVnnw1/v4G1PAZ62bzJ7ZosDM3CuVWs3kf189rXq
i4xS1NBcSyntT2PBB8aaH6pyu0zCqEHyV8Q2PsCl1B88KdWmvraBlzWSu4cRZeMR
eIGVeA2YXUhzPfwGUch8dprkivWN2OhHc7V+NFZJcHV16+WEgObbQV6j9MYVBbfO
ZAuKtQshaQyjY0WcVTEog97Jrb7SYMLlILYwaHey6bGra1sQGK3jl+CEetSjsM6G
Y3bk4uoBl0s0lsMSh0j1TSrKUOvbOk8xduyNrwloqaiAQRhX2idPvikM3f3OsVRL
ejSpVy00UNbkUR4xl4v8U2MAJBCGID7q84IqDTwso3xZZ1pgH/H6YMzn2Tw2tTd4
kDLfxr2aUamBe71mE2uLiEoEuiBCUvQXgl3/Uqkg1+ke17HCIMI=
=AV2X
-----END PGP SIGNATURE-----

--Zkl/ZGRNLhkdNGO0--
