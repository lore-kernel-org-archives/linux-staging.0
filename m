Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45EB2C89
	for <linux-staging@lists.linux.dev>; Tue,  5 Oct 2021 22:43:23 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id n8so2197424lfk.6
        for <linux-staging@lists.linux.dev>; Tue, 05 Oct 2021 15:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QG+ghKl7BYypZZjDut6dTGHyiOgVAsyM1BWUZUWMu5U=;
        b=Hd/Hgnl41abY2ut8awTV9Znfi0+mLbBx9rjGKMvBmv1GvhO4shIY8zKBANOfUfey6t
         f5Ia/T7DT6465kZqrrXQThtz+C/Dyv3WwmTVE2S1/knhHJ2ZkcQGMJbpA7lJW8S92LV6
         d4sMrDbdjRQ26EUeegNXhFT6soeFLf+BrXj5mPF3K+E6tl1/jGMbmKZnQ0VlaBRfoOWR
         LuKoByxkOGkGhSjkSGOlHwyrskSGBdkV8ouXlaDVeZDQXkFs5OsF+2lgPEibKvUXARwq
         QkljhBPkuFryLkM004napUFJxFdOqOTZNrXbWHEUeRQ3+onIjoSJKZ6XnhXG+LemKrOd
         A8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QG+ghKl7BYypZZjDut6dTGHyiOgVAsyM1BWUZUWMu5U=;
        b=XEbKMwY5uWdpJoaQf5DIoxq+t6+zyE+UA7gVp+p3m2vFDfodw+vlw0WepiYKaSbQ7n
         5qNeECGZynUtnqa/+SkK0WvHy5YeHjv/b1h4cz3ktw2KSfFK47ZfZb7usWgh57d0958V
         mFGg7m7Lu/I9yJPGCy3Tijsmq0CaQnvpCN5ROXnG5C7YaVyEonBDMvicov0G6zlNG9wD
         3NCI+9QikIdriPQ12R3ID+xIR6qrVKGZqFmD/SfNGkSUbrT2cEEiCutP7CeYv+NFyYAA
         svUsaDvX9bjGnz4zv0kmt2+1VnqivEb1TA0V/FfSiOe4hFXfo+a4CCp1cJddNUmdMYVY
         GFMA==
X-Gm-Message-State: AOAM530pLD4ULj5AQ/SGXuh6CKMq2pimTyxgiHTPjJXYf8xwSDV32yYb
	A5bfXh4dXi60hc6GQxXoKz0=
X-Google-Smtp-Source: ABdhPJxfNs4Gfg7N3fvFBrC2l/U9ZmVjgRHnpJ3ajA7WdQF4gcWUZ5S7J4URL5OZbbHW8d5K2gyE2g==
X-Received: by 2002:a2e:743:: with SMTP id i3mr24366437ljd.250.1633473801726;
        Tue, 05 Oct 2021 15:43:21 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id q30sm2086817lfb.108.2021.10.05.15.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Oct 2021 15:43:21 -0700 (PDT)
Subject: Re: [PATCH v13 06/35] clk: tegra: Support runtime PM and power domain
From: Dmitry Osipenko <digetx@gmail.com>
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
Message-ID: <74a47158-e2e4-5fd0-3f37-0b50d4ead4d9@gmail.com>
Date: Wed, 6 Oct 2021 01:43:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <4bdba8a2-4b9b-ed7d-e6ca-9218d8200a85@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

06.10.2021 01:19, Dmitry Osipenko пишет:
...
> I reproduced the OFF problem by removing the clk prepare/unprepare from
> the suspend/resume of the clk driver and making some extra changes to
> clock tree topology and etc to trigger the problem on Nexus 7.
> 
> tegra-pmc 7000e400.pmc: failed to turn off PM domain heg: -13
> 
> It happens from genpd_suspend_noirq() -> tegra_genpd_power_off() -> clk
> -> GENPD -> I2C -> runtime-pm.
> 
> -13 is EACCES, it comes from the runtime PM of I2C device. RPM is
> prohibited/disabled during late (NOIRQ) suspend by the drivers core.

My bad, I double-checked and it's not I2C RPM that is failing now, but
the clock's RPM [1], which is also unavailable during NOIRQ.

[1]
https://elixir.free-electrons.com/linux/v5.15-rc4/source/drivers/clk/clk.c#L116

Previously it was I2C RPM that was failing in a similar way, but code
changed a tad since that time.
