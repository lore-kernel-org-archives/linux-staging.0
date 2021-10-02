Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771503FEC
	for <linux-staging@lists.linux.dev>; Sat,  2 Oct 2021 20:44:50 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id i25so53292221lfg.6
        for <linux-staging@lists.linux.dev>; Sat, 02 Oct 2021 13:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=T5NA95fXjewFVQZ7RXmQGjvZaYL3KLG4ILjTuHYXm9E=;
        b=VInxURP7xctDXfL0Dl1Z5iIuI8Z57STPldPnyJ+NEoakoMviQJJZLMTDvRJajSYeUA
         L6hAx+33fXvlxHQdSLAb2swwYgCSXcm4IHTOs4QNGPXy0n+3kc1PaSRsPOeccYBdBeZd
         i/GVKW6ch0QjgR5Al9izKnsKjtkLP9b6WFxxbgQj5xOtMJ+SSJ3vI3nxrqadHVRi/RnA
         W6QxtWyfIbdShJzgMDhIpqfX5qzkmNQXHlvgGM11cFUopWEMKunpWxyqUcwKJKYvFAG5
         +vztm6uVxmXOzcI8Wt5yVr3CSoQmJa2Le0PpZjwLrPdDyp4eM6GhDyuSByQAckD1zOgW
         c3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=T5NA95fXjewFVQZ7RXmQGjvZaYL3KLG4ILjTuHYXm9E=;
        b=3XbfQvJd5TnrYw0M66aq3baKX7EC+1VeW5F3SqMisUGlR9tq+B8ARDti6NjrnoR/W9
         XqIaggHKCwG3nj517tRmxIFTVyr9+IglTGznc6sjVJp8/fnzT7Ng1aBExIAEDnvJEiTj
         vtFM6uR0dOBmLN4ETFIwY1/qsxSUDKmQp78/izArzUmZ9BCm76TMVYCq00vbfogOx/Fk
         sFmQOj9haOeYzkfEaUFbZ2q1GsCNh+I/MId6szAWRx5qFUJvSFji+7YtfsjpUp5goLo3
         Gn7z251ujScXiyedoJfD7+ImJKCUysyLQRDI8U40fW5Vw/qQOLAxVI7pPxhBarjKtN3o
         gRDQ==
X-Gm-Message-State: AOAM530SbPmUB0G6soqeu5fpGRarEuuSYRO7KvEas7AXbQs2YevTbNau
	jq3IgrL7KbFuCbN3xCo1iU4=
X-Google-Smtp-Source: ABdhPJzClEAya5hcn4TqFZQoHIn0mpgv86q3zG4rhbGd/Hwr0saEHFeEJIpz6XM0cCQNRVK631z4Mw==
X-Received: by 2002:a2e:80cd:: with SMTP id r13mr5454584ljg.415.1633207488462;
        Sat, 02 Oct 2021 13:44:48 -0700 (PDT)
Received: from [192.168.2.145] (94-29-52-238.dynamic.spd-mgts.ru. [94.29.52.238])
        by smtp.googlemail.com with ESMTPSA id v27sm1233535lfp.0.2021.10.02.13.44.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Oct 2021 13:44:47 -0700 (PDT)
Subject: Re: [PATCH v13 06/35] clk: tegra: Support runtime PM and power domain
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 Linux USB List <linux-usb@vger.kernel.org>, linux-staging@lists.linux.dev,
 linux-pwm@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
References: <20210926224058.1252-1-digetx@gmail.com>
 <20210926224058.1252-7-digetx@gmail.com>
 <CAPDyKFq+LS4Jr1GyC-a-tGWPzGH0JxfJ9wKY=uQEBGYm952azw@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <24101cd6-d3f5-1e74-db39-145ecd30418b@gmail.com>
Date: Sat, 2 Oct 2021 23:44:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAPDyKFq+LS4Jr1GyC-a-tGWPzGH0JxfJ9wKY=uQEBGYm952azw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

01.10.2021 15:32, Ulf Hansson пишет:
>> +static __maybe_unused int tegra_clock_pm_suspend(struct device *dev)
>> +{
>> +       struct tegra_clk_device *clk_dev = dev_get_drvdata(dev);
>> +
>> +       /*
>> +        * Power management of the clock is entangled with the Tegra PMC
>> +        * GENPD because PMC driver enables/disables clocks for toggling
>> +        * of the PD's on/off state.
>> +        *
>> +        * The PMC GENPD is resumed in NOIRQ phase, before RPM of the clocks
>> +        * becomes available, hence PMC can't use clocks at the early resume
>> +        * phase if RPM is involved. For example when 3d clock is enabled,
>> +        * it may enable the parent PLL clock that needs to be RPM-resumed.
>> +        *
>> +        * Secondly, the PLL clocks may be enabled by the low level suspend
>> +        * code, so we need to assume that PLL is in enabled state during
>> +        * suspend.
>> +        *
>> +        * We will keep PLLs and system clock resumed during suspend time.
>> +        * All PLLs on all SoCs are low power and system clock is always-on,
>> +        * so practically not much is changed here.
>> +        */
>> +
>> +       return clk_prepare(clk_dev->hw->clk);
> I am trying to understand, more exactly, what you intend to achieve
> with the clk_prepare() here. It looks a bit weird, to me. Can you try
> to elaborate a bit more on the use case?

The Tegra GENPD driver enable/disable clocks when domain is turned on.
This can't be done during early system resume, when domains are getting
turned on by the drivers core, because when clock is enabled, it's
getting prepared (RPM-resumed) and this preparation fails because
performance state of the clock goes up and it doesn't work during the
early resume time since I2C, which applies the state to hardware, is
suspended and can't work at that early time.

Secondly, Tegra has arch-specific low level assembly which touches
clocks during last phase of system suspend and in the beginning of
resume. Hence, clocks should stay prepared during suspend just because
technically clock should be prepared before it can be enabled.

> Is this rather about making sure that the clock's corresponding PM
> domain stays powered on during system suspend? In that case, I think
> there may be an alternative option....
> 

This is not about domain staying powered on, this is about keeping the
performance state of the domain high during suspend.
