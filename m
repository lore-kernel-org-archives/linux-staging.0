Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24373173
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 15:49:07 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id x27so42240618lfu.5
        for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 08:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fG8UNioj9Gykdv3jKLDDqlFZPR9Bq4ObXeUmu51BqTw=;
        b=qCj8PB2xsh0Gwhg/Mz8T/C3RsrPHTbLP+N4lR2Yg2TB3ET2WkMAO1wgbBYR2q7lO68
         Pc49VlqXQ3dpjJrNlM2C3tPYEqqyhTGSf8sYJWR5lp0WvXn++4GF++0cA3bUAvac9XRG
         g9ViFPs99qgAUHDXdueeQwSgYGDFI/IeqfENUgVVD/rI4Q1ZQoN06DvNSee5A4aKmCOu
         S+uE5zA5q9Snqs4dlpyOLydNmfB2J5W4GujW2PkG6xWyoiPHtLSNJ/LrYoAzYXP3c7VD
         AfB16sdCF6PcILWyGV5dGRZGFQ3HUP80m2Rig47x3ImvxaecyvAZWvXPV2nsoVl7dQ3l
         YRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fG8UNioj9Gykdv3jKLDDqlFZPR9Bq4ObXeUmu51BqTw=;
        b=lg/6CxNFBiw3dABUns81K3sZaoC6kg/rZtE5NL6AVI3+bSigFMMzFJx2A+GSTtblCb
         F0qb5mGk6d3xbdklA0FnQmXDHQE1TRRH3DuI5tYbgSAC3I+FECX6x3iiCl7kGPCf9cx8
         XqxHd8cl0+aLjcungE7yLDw1sXkLp+6hZ8WtMKkZ+m1zRuf3W2S29ziiySNxIVCudTtH
         4iFGa6NCL4FWohUIFnzXq4JztK9CCn0cXv6p5jQBnF4/K/PqdREm7fYk0PsAlRDYIjwb
         1U1tCWfMk6vZohrLgm5ZUheGBHbviunWksGyTf7vp/PJGOQwo7mQt8hqeMkuENuco8St
         7UYQ==
X-Gm-Message-State: AOAM531bn6GbZGNxmznYUvXK9YFz2ClcOz4okKzyIJB+MM+d+OgkqBrx
	5n28fMExTRO9td+Vf4pWlVY=
X-Google-Smtp-Source: ABdhPJxH1hLTa5AxArOQ97RRWFvJ/qFdnD++u1srz4ssoaY8ztFeO7SrfDBXxb0r5VIrFxPoMPyxwA==
X-Received: by 2002:a19:7603:: with SMTP id c3mr2817435lff.543.1629215345270;
        Tue, 17 Aug 2021 08:49:05 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru. [46.138.85.91])
        by smtp.googlemail.com with ESMTPSA id k1sm221767lfg.187.2021.08.17.08.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Aug 2021 08:49:04 -0700 (PDT)
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
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
 <20210817012754.8710-2-digetx@gmail.com>
 <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
Date: Tue, 17 Aug 2021 18:49:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

17.08.2021 10:55, Viresh Kumar пишет:
...
>> +int dev_pm_opp_sync(struct device *dev)
>> +{
>> +	struct opp_table *opp_table;
>> +	struct dev_pm_opp *opp;
>> +	int ret = 0;
>> +
>> +	/* Device may not have OPP table */
>> +	opp_table = _find_opp_table(dev);
>> +	if (IS_ERR(opp_table))
>> +		return 0;
>> +
>> +	if (!_get_opp_count(opp_table))
>> +		goto put_table;
>> +
>> +	opp = _find_current_opp(dev, opp_table);
>> +	ret = _set_opp(dev, opp_table, opp, opp->rate);
> 
> And I am not sure how this will end up working, since new OPP will be
> equal to old one. Since I see you call this from resume() at many
> places.

Initially OPP table is "uninitialized" and opp_table->enabled=false,
hence the first sync always works even if OPP is equal to old one. Once
OPP has been synced, all further syncs are NO-OPs, hence it doesn't
matter how many times syncing is called.

https://elixir.bootlin.com/linux/v5.14-rc6/source/drivers/opp/core.c#L1012

> what exactly are you trying to do here ? Those details would be good
> to have in commit log as well, I haven't really followed V7 of your
> series.

I'm initializing voltage/power state of OPP table in accordance to the
clock rate, bumping voltage before clock is enabled by device driver.
I'll improve the commit message.

An alternative to the explicit syncing could be something like a new
dev_pm_opp_resume/suspend helpers that will take care of
enabling/disabling the OPP table clock/etc and syncing the OPP state
with h/w.
