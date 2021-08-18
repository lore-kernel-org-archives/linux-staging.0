Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EF76D17
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 17:11:06 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id g13so6040691lfj.12
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 10:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jqE9ClhGb0c32X3v7BncGGF0woKsX2XgQIGx9qgWIH0=;
        b=pzxMEO2UMuT/mHPfPLSjCbX3ZOkDKV6nZIXJP5/zPjCNpAmYvVuFYDC5xhuzIXGAng
         k06Q5T/VtECFuIzWKjrForzIl4lzYGT5926+k7EPC9XdDRz2131oKSvSnQpNDCIjUZeV
         vAmDMRNzl3coOfWSZz4CU+fD10VCYBpA5I6tzFaCdMPL/E4hBdGPJ8T64iETHNj36g5/
         4Zr7nRwBnt0A/FIqmj1kKX08k9xT8d+vmEYX1QK+8VovTTlsqt2R6xS22Go2zElhhlPR
         euQHMQkRAQQ2VSVWBb0NpqmpPCycMssSiywU+Zr1oEUGDcugw9A5VFVSxFxuj21XbpAw
         m+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jqE9ClhGb0c32X3v7BncGGF0woKsX2XgQIGx9qgWIH0=;
        b=oAAhpJeVE4I01J1SuGSylJ39jRmhgRjCMiYnsKI+gkSnG77rdkRrQSfMjcRXG46xNj
         /X2MDfaNeJ+bTFUW/oRrUC1mciQ7DTLJpVsu7mR3vL66TdZP5vS/RulXQbkow+uyI9v7
         s+7ljTV5jx8EJulJ+3ERCeczgO3Cp+AuZWlL80L8GRzxRRLSzyXnKSWSZaNwqykeG46H
         urwmkvSr8AdVTRidHRwit0v3NZmO1EeZ3byOYGRTauE9LsF/SrlesDlaPk+JpRrvQc1K
         JYBlGSJqDhlF7c8iymE/sUY8O7+6KWPhmN3MyC0+VSA2ORif1Ty2YbDoRNySN7SDVMD/
         ngMQ==
X-Gm-Message-State: AOAM5337H6hDmOhNn+ZM7PlENA+zv08OlqeQf8ewQmB4yC1ZhbOQAfB9
	/QxcvLdbZ5Cnmen7XbJBJUQ=
X-Google-Smtp-Source: ABdhPJx8mXn6y5y5nU5HWp3Gqd9IJG4zaBOIqyrwTbYskADisL9LhAfipeaTsyrerunkulv/neb4gw==
X-Received: by 2002:a05:6512:2149:: with SMTP id s9mr6957434lfr.365.1629306664851;
        Wed, 18 Aug 2021 10:11:04 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru. [46.138.85.91])
        by smtp.googlemail.com with ESMTPSA id x191sm25857lff.29.2021.08.18.10.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 10:11:04 -0700 (PDT)
Subject: Re: [PATCH v8 07/34] clk: tegra: Support runtime PM and power domain
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-8-digetx@gmail.com> <YR0UBi/ejy+oF4Hm@orome.fritz.box>
 <da7356cb-05ee-ba84-8a7c-6e69d853a805@gmail.com>
 <YR04YHGEluqLIZeo@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ad99db08-4696-1636-5829-5260f93dc681@gmail.com>
Date: Wed, 18 Aug 2021 20:11:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YR04YHGEluqLIZeo@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

18.08.2021 19:42, Thierry Reding пишет:
> On Wed, Aug 18, 2021 at 06:05:21PM +0300, Dmitry Osipenko wrote:
>> 18.08.2021 17:07, Thierry Reding пишет:
>>> On Tue, Aug 17, 2021 at 04:27:27AM +0300, Dmitry Osipenko wrote:
>>> [...]
>>>> +struct clk *tegra_clk_register(struct clk_hw *hw)
>>>> +{
>>>> +	struct platform_device *pdev;
>>>> +	struct device *dev = NULL;
>>>> +	struct device_node *np;
>>>> +	const char *dev_name;
>>>> +
>>>> +	np = tegra_clk_get_of_node(hw);
>>>> +
>>>> +	if (!of_device_is_available(np))
>>>> +		goto put_node;
>>>> +
>>>> +	dev_name = kasprintf(GFP_KERNEL, "tegra_clk_%s", hw->init->name);
>>>> +	if (!dev_name)
>>>> +		goto put_node;
>>>> +
>>>> +	pdev = of_platform_device_create(np, dev_name, NULL);
>>>> +	if (!pdev) {
>>>> +		pr_err("%s: failed to create device for %pOF\n", __func__, np);
>>>> +		kfree(dev_name);
>>>> +		goto put_node;
>>>> +	}
>>>> +
>>>> +	dev = &pdev->dev;
>>>> +	pm_runtime_enable(dev);
>>>> +put_node:
>>>> +	of_node_put(np);
>>>> +
>>>> +	return clk_register(dev, hw);
>>>> +}
>>>
>>> This looks wrong. Why do we need struct platform_device objects for each
>>> of these clocks? That's going to be a massive amount of platform devices
>>> and they will completely mess up sysfs.
>>
>> RPM works with a device. It's not a massive amount of devices, it's one
>> device for T20 and four devices for T30.
> 
> I'm still not sure I understand why we need to call RPM functions on a
> clock. And even if they are few, it seems wrong to make these platform
> devices.

Before clock is enabled, we need to raise core voltage. After clock is
disabled, the voltage should be dropped. CCF+RPM takes care of handling
this for us.

> Perhaps they can be simple struct device:s instead? Ideally they would
> also be parented to the CAR so that they appear in the right place in
> the sysfs hierarchy.

Could you please clarify what do you mean by 'simple struct device:s'?
These clock devices should be OF devices with a of_node and etc,
otherwise we can't use OPP framework.

We don't have driver for CAR to bind. I guess we could try to add a
'dummy' CAR driver that will create sub-devices for the rpm-clocks, is
this what you're wanting?
