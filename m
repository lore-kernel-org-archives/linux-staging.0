Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B132FAE
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 14:07:06 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id q11so3722791wrr.9
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 07:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=i6nHV4Vzm5Umu6SJhmhoU8e3Ow8sOCfq6m4vf5vpOCg=;
        b=ZJdtuwUuQvNaAbdr9Fz2fAvktw5J/+5+vjt8im/pkRZqyKjHlmqluk+dpJgPv/GFEk
         rs7jlCk5NOlSnehipLU0nyzn/A/7FZS7QQCaIl7MSF6vAha+BX6LZBrQQREaflmjEitO
         dlEahiAy8zC6MjFccmUrLBYvfs88a8jl/uHALh0tSc5Nn+N5OqlxOYEPLAvMwQAyowns
         Ndkxrox4afb9mQcpEWWL0GiCRmTwzTOHCYxL6M4H8oWTYs7RmlUoqU0WistPX7vqT8pO
         6Su4Nkctsrk6dlh0F8i2tqudBygnvEpqj+ChJ3xGjixCFrJ6bgmI3P/HGSPs7QQyovGr
         4V5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=i6nHV4Vzm5Umu6SJhmhoU8e3Ow8sOCfq6m4vf5vpOCg=;
        b=qUNWKv7qbxYwnZ3F43DSgrL1hBk9N3E08eVLNXK+c4uuFEYzP94KqZjFMyU2hDYysS
         eu8J+oUm++Z/Nb3RvPmfnDfuBA94/wA2E5DUV3+Q9vOnNV3YQYL5L+1OuRBZAs8Y4NQG
         ob/h8fr5f7H+HBLwI4gR+Hrk9kRzq9ZVTjFfvXc+mwEQcR+2FFDVfmpK1WPJVteV9SZk
         cPbJ92WizwOLUgWN85AxoKRAoHeqXjboLudWc718Kz2+IT94+R1n+y7KhobdIvf0liaU
         ZeU8J8T33hC1PCrNbTysQ+72JRr8LGj8O1VS8sZuMP/IK0Xsz5Dt6/T5S6OdMYD1AyTv
         SRoQ==
X-Gm-Message-State: AOAM531AWY3neZ1DckyI2J6Q9DIDaHlUhTL2wby9AnTYsEKkQJ5TL81P
	Zsi3628jSz4DUOproRVaPfQ=
X-Google-Smtp-Source: ABdhPJyXq9/0R+WfXjdNLNbDmiuZklvSlQEBjFaDDAdAwgPSc6Y2VNRCrYkje8+AywzsdZxW8DAWow==
X-Received: by 2002:a5d:500a:: with SMTP id e10mr11157882wrt.332.1629295624742;
        Wed, 18 Aug 2021 07:07:04 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id e2sm6158851wrq.56.2021.08.18.07.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:07:03 -0700 (PDT)
Date: Wed, 18 Aug 2021 16:07:02 +0200
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
Subject: Re: [PATCH v8 07/34] clk: tegra: Support runtime PM and power domain
Message-ID: <YR0UBi/ejy+oF4Hm@orome.fritz.box>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-8-digetx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GjgnhAguwPYREA1d"
Content-Disposition: inline
In-Reply-To: <20210817012754.8710-8-digetx@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)


--GjgnhAguwPYREA1d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 17, 2021 at 04:27:27AM +0300, Dmitry Osipenko wrote:
[...]
> +struct clk *tegra_clk_register(struct clk_hw *hw)
> +{
> +	struct platform_device *pdev;
> +	struct device *dev = NULL;
> +	struct device_node *np;
> +	const char *dev_name;
> +
> +	np = tegra_clk_get_of_node(hw);
> +
> +	if (!of_device_is_available(np))
> +		goto put_node;
> +
> +	dev_name = kasprintf(GFP_KERNEL, "tegra_clk_%s", hw->init->name);
> +	if (!dev_name)
> +		goto put_node;
> +
> +	pdev = of_platform_device_create(np, dev_name, NULL);
> +	if (!pdev) {
> +		pr_err("%s: failed to create device for %pOF\n", __func__, np);
> +		kfree(dev_name);
> +		goto put_node;
> +	}
> +
> +	dev = &pdev->dev;
> +	pm_runtime_enable(dev);
> +put_node:
> +	of_node_put(np);
> +
> +	return clk_register(dev, hw);
> +}

This looks wrong. Why do we need struct platform_device objects for each
of these clocks? That's going to be a massive amount of platform devices
and they will completely mess up sysfs.

Thierry

--GjgnhAguwPYREA1d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEdFAYACgkQ3SOs138+
s6HeRQ/+On1vzXNiDk0hs4KISsGV+2p4XxyJVq/mvJWq4nwbzB0fnbltpnQGekNK
rv9LKvLwpMpikV4RHOysHn4hnusz+I3P/SOJVq8nB5ctz7QEcklxJNgaKIyY3Nri
JD8EiV936HB8R2Ecg5fEynk0MHmJ4+Pe1pFjfK/3i6l1Xx5Xy+jt/AwHXkTAJG6B
LilpaYxjeYK0xLVY0uy/3TWmSNj7zmA9NLYadLedHWKAIrmfdhL4qEn0keHZPjeN
wTRUkexp/mHpfwaNRpUvHM2sF6WuetFM6FrIIAEyVB4SSq3usTLtWtFWl3qca2Vi
f/LKNT+GlKsS7vs6/bokHE5CtOc1bbILItuJCunjCSnOgElWzJ+WV2oAdBodcDr9
AaDHCtN1kTr/1f0KYw3zKQHErq1Z9sRrTeETjAkYSE6agOOHm+eBIkPF38mdl7ZN
eI5syiX8NwgIHv4jp1YR6lbvplx9XhD9Se4EcrgNSytiYYWfZMDEyH3dFTzCjzyT
E5pNO8BuA8JHJWCUYtqjl+OccK0XhnR99XyHvsb1HM+jT0EqRjLc59PJlOwQeX2f
KwOX9DhOQf+ZyRegAHSh4uNpR2fySasbnBT7RwyG17MKbeoTEqTOTJ5QZmMXSqDa
kNchGN8JwMPpyDcw6adERGyrLYh0tFLdrM+1JjImnnDrLx9SuRo=
=yj83
-----END PGP SIGNATURE-----

--GjgnhAguwPYREA1d--
