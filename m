Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C7D2F80
	for <linux-staging@lists.linux.dev>; Fri,  1 Oct 2021 14:41:03 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id e15so39691791lfr.10
        for <linux-staging@lists.linux.dev>; Fri, 01 Oct 2021 07:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UwoFVO+dO6njxeQ0bgYN0BE5nPQzR3DQc5Vpm1mPWnk=;
        b=bB/u42AJ2XXQN1gkrv2XrgFEHLsC9tr/msHwyleZGinleVLXGT0sIc7aRIobWDsdwK
         rYmP4xYIZrNx7FEjW8gkOF8XTaA28F6hB3+xTDBkrNXJOvKvSI21l/YBsLJfAMXkio4C
         7NBXTCI3sn5+W+w+KtLJbYC5LP/97qksxgR3TZpUuIT9/yB0xDHeE0X8HrFFuSBN5wey
         fT+imhtqpDUqwLIYCsyUuYHelYzGIbIc8IYVegIWx4SYR+EJqWy+zvJfTDe+HvKK5tRH
         rVcL57VEZmSs3NnnC1O6JVmftNWEqb6OgGHKsrZ00QxGboCARiFAeuOAtKXvFG/eeYSH
         tzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UwoFVO+dO6njxeQ0bgYN0BE5nPQzR3DQc5Vpm1mPWnk=;
        b=UrzS1tpefYYDTn8gjRBUAajK/Aac97lb6UNmnS1ErQQJWmjjoF79Fcl/Nc/Xn6Yny5
         U5UpI9tQZhC/tjWz1EjB+bdni8fNEKlYTSxi1UyHBj01p+vFeCCUJZxH4g3xputUgS9S
         3syKqEEMXLmgSn/pXVESSn0/9wntFWpTkuIDB9AXw+u0O2Pokz3mrj4ALyzqgafRhhIS
         vnDLARzzblU2fDIDgy6VB649T7VEzqfdsKJAaTYVMVBxIc1a30LEe2SLS5f5Ro9AnYui
         qbgXtqx0bB5pUq9is7950HApMJ4j0P9SQITc8U8oM4ubDC1aDf9MurP2C5OXRx/74Epn
         E9yA==
X-Gm-Message-State: AOAM5304u6MNPjAptSr8/IYWsMHvEeytPGURyhyV6hb8bAxSTvvHFZD8
	IOdjZ/se5hpclnPH7KT4LE4=
X-Google-Smtp-Source: ABdhPJxN+K58baeAMtHludWtY5/aoUpfpV69UhD5D2HxeBWOVS2Xyit1TAYk0S1tQsqKv+wvTGH+kA==
X-Received: by 2002:a19:4802:: with SMTP id v2mr5884316lfa.12.1633099261566;
        Fri, 01 Oct 2021 07:41:01 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-198.dynamic.spd-mgts.ru. [79.139.163.198])
        by smtp.googlemail.com with ESMTPSA id z12sm754221lfd.283.2021.10.01.07.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 07:41:01 -0700 (PDT)
Subject: Re: [PATCH v13 00/35] NVIDIA Tegra power management patches for 5.16
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
 <CAPDyKFog31OatzU0fHUMfN5FRsX+8Thm8TfipA4QisgFepU+rA@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <662251e0-d1e4-97ce-16f9-703521cc2600@gmail.com>
Date: Fri, 1 Oct 2021 17:40:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAPDyKFog31OatzU0fHUMfN5FRsX+8Thm8TfipA4QisgFepU+rA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

01.10.2021 17:36, Ulf Hansson пишет:
> On Mon, 27 Sept 2021 at 00:42, Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> This series adds runtime PM support to Tegra drivers and enables core
>> voltage scaling for Tegra20/30 SoCs, resolving overheating troubles.
>>
>> All patches in this series are interdependent and should go via Tegra tree.
>>
>> Changelog:
>>
>> v13: - Fixed compile-test error reported by build bot by reverting the
>>        mmc/ patch to v11. The sdhci_suspend/resume_host() functions aren't
>>        available with the disabled CONFIG_PM_SLEEP, some code needs the
>>        ifdef.
>>
>>      - Added last r-b from Rob Herring for the DT patches.
>>
>>      - Corrected clk/ PM domain-support patch by not using the
>>        devm_tegra_core_dev_init_opp_table_common() helper, which I
>>        utilized in v12. The clk driver implements its own power domain
>>        state syncing and common helper shouldn't be used. This fixes driver
>>        probing for some clocks on some devices. It was reported by
>>        Svyatoslav Ryhel for PLLE OPP error on T30 Asus Transformer tablet.
> 
> Dmitry, I have looked through the series and besides those comments
> that I have posted, I have nothing more to add. Overall it looks good
> to me.

Ulf, thank you very much! Yours input is invaluable. I'm happy that this
series moving steadily to the final stage.
