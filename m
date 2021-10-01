Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224673FE5
	for <linux-staging@lists.linux.dev>; Fri,  1 Oct 2021 19:50:08 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id m3so42376079lfu.2
        for <linux-staging@lists.linux.dev>; Fri, 01 Oct 2021 12:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+3tCCW1vf690/4T30qcUTSO03STgS9Zq/gOdQmsNyEY=;
        b=lY0wpPfvEJC3ODP4sRKgGKoG8Swu6fLZXyhOhUQdBtt8vAmwxCUggKysIiRbfpVECz
         Cd3ipKChxLyI1Zlljt9jBoTItp7HmkRZNf+eWjSo0rRzLJpIXZuZSpuczURL7aSNbaxj
         i27N4TFDl5jVrgoDNEymG3WJmbBn2a47R0QIsqRS8kEVT2EURQYnYf+OZQh4u5X906wS
         OP71a4OED8ggbpaM9F9WPD+jQS6co7bb2ujJRxsbNvD0guBE62JtB6hzhNKWUuRSoEPm
         eED+tROxrUYQsEDU12h+rkOJTDJ9NZqCO/m7egmIDgFRlkZFJ+0EKU6mPddmAv9siSJx
         aPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+3tCCW1vf690/4T30qcUTSO03STgS9Zq/gOdQmsNyEY=;
        b=HtPgzgs7kmgN6HeDjAS/dfb2dlv5JbvwyNPckSLMHJMxk9p0uE5d3ysrsfDaCDXNEv
         65bEe9Omn7JyOf070azo9JikDiSHi4BlvniCQ8IbIpMKIeLObN5etp48avJ1mqnrv/k9
         FJ9yhJTJ8B2vfL6emEqeOyBSs57oTuNX+Ie7oCYEd4qqfZvxSgC9AIphpvp0c6IJ0ukO
         BQXMM+XX7n38v9BCBxNNYo5hvHh81MranZdWgttZiHBjPaV18d0YUC5BYyic9JorpDrn
         H7Gof3Hv4VzbSqJMcWT750hkkjYt++0XRcU+WQB1AOmfID+VntsbGQK5pcDaP0y2cNHf
         jFBQ==
X-Gm-Message-State: AOAM530AhOUuyrsI+R8lrXNBt3iu4aC6dQI8JELaH9+5hYBEy6ELOQaY
	Z67N49QDTFvzo77EDFEdkx4=
X-Google-Smtp-Source: ABdhPJxYsYCCBKlCSGLAzxa6BXsGbqcTjHWvgb7beKpP4WisArOt1AAHN4vdv1Oz4AuVBT+h3gaDUA==
X-Received: by 2002:a2e:924d:: with SMTP id v13mr13579672ljg.380.1633117806218;
        Fri, 01 Oct 2021 12:50:06 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-198.dynamic.spd-mgts.ru. [79.139.163.198])
        by smtp.googlemail.com with ESMTPSA id d26sm835708ljj.45.2021.10.01.12.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 12:50:05 -0700 (PDT)
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
Message-ID: <7386079f-0dfe-9f55-6297-1f9ee67cd9d6@gmail.com>
Date: Fri, 1 Oct 2021 22:50:04 +0300
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
>> +static int tegra_clock_sync_pd_state(struct tegra_clk_device *clk_dev)
>> +{
>> +       unsigned long rate;
>> +       int ret = 0;
>> +
>> +       mutex_lock(&clk_dev->lock);
>> +
>> +       if (!pm_runtime_status_suspended(clk_dev->dev)) {
>> +               rate = clk_hw_get_rate(clk_dev->hw);
>> +               ret = tegra_clock_set_pd_state(clk_dev, rate);
> Don't we need to sync the performance state even when the device is
> runtime suspended?
> 
> Perhaps the clock, via a child-clock for example, can get
> prepared/enabled (hence its device gets runtime resumed) before there
> is a clock rate update for it. Then there is no performance state set
> for it, right? Or maybe that isn't a problem?
> 

Good catch! Older versions of this patch had a special handling for clk
enable/disable. I just forgot to update this function, it's now not a
problem to change performance state of a suspended device and it
actually needs to be done. I'll correct it, thanks!
