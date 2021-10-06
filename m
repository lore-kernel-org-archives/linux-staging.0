Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7F52C83
	for <linux-staging@lists.linux.dev>; Wed,  6 Oct 2021 21:14:33 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id j5so15854191lfg.8
        for <linux-staging@lists.linux.dev>; Wed, 06 Oct 2021 14:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=o0cs0AX5nwq+IUf+CKObBfgaJgmuJRgoStffvFAIT10=;
        b=OAAHbT16tXECghgQaYpBDvaBg2nyBCHmtuMyvDSLSTbuObskqWOWorhnE8GXhvyO1P
         Bn8A+jUBY+Hq5L0nIx22XuRHtWkBK8UW1aLeRHBCefSUfXdhaYPQAKLssy6jZKCTDPxq
         OuYscwLfHiEBxKSN7pEAEtHJlzcaimxesa44SVQW0YCpj0qYJNneKlMBzctNoocz4ITJ
         VLxjAWxLdAX08DniG2ajG9YPUowE5Inf0Vtvp7bs6ZdboMQY6blXurlo0smoYncTZQ5t
         rw5V35NzcSMJgcQCw0DJs/tH0fAF9zeUo7FIdEgb52Z5b5ZJr0WNe8OnId+CPYq6ATlB
         3Q5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=o0cs0AX5nwq+IUf+CKObBfgaJgmuJRgoStffvFAIT10=;
        b=63pkvnNMxo9Yy1JWx1ZjS67WHJgSCy/mo9Bbxt/hli5wmoF0GQRGJSBHYo/HHq7ZuE
         PfU+Fd7Fe2XV1UV7V1KFbeDsPA7IQQKoYYmDCRWuuTz8gSsI+zA3OLjwOBwJeQztrVKj
         /ULsa8idmMGMO99ruRhr0CeQi1jTRqQBWvGia6caCTN7JVDU4sBfov/haq6TADG34vwb
         v3lbXTEu6PSHX4iRLIW9pNjtfm1+a02HLKmp2yr2HOBDCJe2Jlo5hqBCFQLebQSMP+TS
         mz8cO5xHhfHwQNlO9HTwdZ1a2FG4nj1GQw3vvmsImjSx9av9Rbg+fLeSFklN6Wzzdfhn
         +w+Q==
X-Gm-Message-State: AOAM530egPZmKUpts6LUGiPagYf/F3FYB7sbNlilnkdCgKXhY1NI005y
	nQ9PocWJ05PvLz9NQkmSu+0=
X-Google-Smtp-Source: ABdhPJxZLAYAk0xCkFO9EYine6/BQhvLLzwYgf3qj0g/KgNEzyhgPVdePU/+7HeABS0slrCmP/BOEw==
X-Received: by 2002:a05:6512:3c95:: with SMTP id h21mr371551lfv.128.1633554871471;
        Wed, 06 Oct 2021 14:14:31 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id t18sm2356186lfl.219.2021.10.06.14.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 14:14:31 -0700 (PDT)
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
 <24101cd6-d3f5-1e74-db39-145ecd30418b@gmail.com>
 <CAPDyKFreK7976PJL-1zySoza_yXM7rMQ64aODWUZ+U3L-uCa0w@mail.gmail.com>
 <4bdba8a2-4b9b-ed7d-e6ca-9218d8200a85@gmail.com>
 <74a47158-e2e4-5fd0-3f37-0b50d4ead4d9@gmail.com>
 <CAPDyKFr2-f1wM+6jF9vWJ-Nq80Zg1Z3qFP6saULOrBi1270HGw@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b06bf794-b8b3-417b-58ef-4d815ca86c95@gmail.com>
Date: Thu, 7 Oct 2021 00:14:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAPDyKFr2-f1wM+6jF9vWJ-Nq80Zg1Z3qFP6saULOrBi1270HGw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

06.10.2021 15:43, Ulf Hansson пишет:
> On Wed, 6 Oct 2021 at 00:43, Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 06.10.2021 01:19, Dmitry Osipenko пишет:
>> ...
>>> I reproduced the OFF problem by removing the clk prepare/unprepare from
>>> the suspend/resume of the clk driver and making some extra changes to
>>> clock tree topology and etc to trigger the problem on Nexus 7.
>>>
>>> tegra-pmc 7000e400.pmc: failed to turn off PM domain heg: -13
>>>
>>> It happens from genpd_suspend_noirq() -> tegra_genpd_power_off() -> clk
>>> -> GENPD -> I2C -> runtime-pm.
>>>
>>> -13 is EACCES, it comes from the runtime PM of I2C device. RPM is
>>> prohibited/disabled during late (NOIRQ) suspend by the drivers core.
>>
>> My bad, I double-checked and it's not I2C RPM that is failing now, but
>> the clock's RPM [1], which is also unavailable during NOIRQ.
> 
> Yes, that sounds reasonable.
> 
> You would then need a similar patch for the tegra clock driver as I
> suggested for tegra I2C driver. That should solve the problem, I
> think.
> 
>>
>> [1]
>> https://elixir.free-electrons.com/linux/v5.15-rc4/source/drivers/clk/clk.c#L116
>>
>> Previously it was I2C RPM that was failing in a similar way, but code
>> changed a tad since that time.
> 
> Alright. In any case, as long as the devices gets suspended in the
> correct order, I think it should be fine to cook a patch along the
> lines of what I suggest for the I2C driver as well.
> 
> It should work, I think. Although, maybe you want to avoid runtime
> resuming the I2C device, unless it's the device belonging to the PMIC
> interface, if there is a way to distinguish that for the driver.

Ulf, thank you very much for the suggestions! I was thinking about this
all once again and concluded that the simplest variant will be to just
remove the suspend ops from the clk driver since neither of PLLs require
high voltage. We now have voltage bumped to a nominal level during
suspend by Tegra's regulator-coupler driver and it's much higher than
voltage needed by PLLs. So the problem I was trying to work around
doesn't really exist anymore.
