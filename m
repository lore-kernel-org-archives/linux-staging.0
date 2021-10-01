Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F007B3FCC
	for <linux-staging@lists.linux.dev>; Fri,  1 Oct 2021 21:25:34 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id x27so43215090lfa.9
        for <linux-staging@lists.linux.dev>; Fri, 01 Oct 2021 14:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PCx+Mv1g2fXDWZ1yxKCufXcb8CGDrVVRus80Eavv7Ms=;
        b=AoOrU/vzFMh0SeboIlXMtpNDGkYKn1nagDBoSx7YjB/QehXjY148G9jNUrxWmj+VLS
         thqf3WTWyv2KgzuCKJgAZtvLfuVTKHVZvxZ6W/v3MpnV1knnxoAKmsgMXbYc8hQX6L4m
         27bTEIknYqodxO1P46g5y8th3QuIbfdgGpCEWEBjBEI0bRGm4qAhzegrULVaAiivY+Mh
         x+t6HwqOhcQgQuTMWHPo+FtI3bPeA65O68izCkj0O0dmOktC4XPdYvSp/C5mg+rlwHvZ
         baqhRxdt1w4rGWw9l8GTpQxhVXx3W19ivPNG/b+kFePi3tvLX4ZgYZ2jb6Li8kajTdY4
         hAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PCx+Mv1g2fXDWZ1yxKCufXcb8CGDrVVRus80Eavv7Ms=;
        b=biXz4bcZdP5vIt1HsPL/osf7IdHOzJggH2SgAy/OjWxYDsN5e2w2X/atOUMMYm5D/K
         7kOTJUEm/eVk7nNDops5YidaXQQ1yc7B/wjmha2TB26TRVQw9ZMU4Mmb9sXQobhwudSk
         07xHHoqnDoqJhOCp79u+gDDL40DVJJ9SaUc2Ixb+rLYTOyCxaEAMQqnRVP3mOfDPDnjO
         2X4sJHPEWFfyPeHpGSXHmaqaNu/HbqdLHNlX0XyYMTz2YaOVo2kL26R4pIJxmxCMAqds
         UBq0k/k3vj/eemNKETLbyvsQyAElH57HtTsL2YLW8/QlY4mtsQMfZFcxqqEgXRgcROCh
         K4lw==
X-Gm-Message-State: AOAM530WKzuGiK6rMp3wYV0xNB6WI8PKFQ57fVgUHcQ70uuuZfdFnX7E
	hTU8F2RhDsdgwaAW28GcuTE=
X-Google-Smtp-Source: ABdhPJyBKnVQGEy++56pE3HiXi9tWCycvRfw9hdTpeQ3zwv+9sj//Y/axLqWUGErfO2svv3m5cLJIA==
X-Received: by 2002:ac2:51a6:: with SMTP id f6mr310738lfk.150.1633123533086;
        Fri, 01 Oct 2021 14:25:33 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-198.dynamic.spd-mgts.ru. [79.139.163.198])
        by smtp.googlemail.com with ESMTPSA id u4sm927755lfu.200.2021.10.01.14.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 14:25:32 -0700 (PDT)
Subject: Re: [PATCH v13 14/35] drm/tegra: gr3d: Support generic power domain
 and runtime PM
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
 <20210926224058.1252-15-digetx@gmail.com>
 <CAPDyKFoZdmnmcdoWsD36uQesSjz8KJOq0JxY5tNbHgO_xMy+_g@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4281a6db-9875-7266-268a-a1639e7d01ff@gmail.com>
Date: Sat, 2 Oct 2021 00:25:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAPDyKFoZdmnmcdoWsD36uQesSjz8KJOq0JxY5tNbHgO_xMy+_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

01.10.2021 17:06, Ulf Hansson пишет:
> On Mon, 27 Sept 2021 at 00:42, Dmitry Osipenko <digetx@gmail.com> wrote:
>> Add runtime power management and support generic power domains.
>>
>> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
>> Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
>> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
>> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/gpu/drm/tegra/gr3d.c | 388 ++++++++++++++++++++++++++++++-----
> [...]

> 
> I was looking for a call to dev_pm_opp_set_rate(), but couldn't find
> it. Isn't that needed when changing the rate of the clock?

That is another good catch! Previous versions of this patch were
changing the rate, while the current version not. So the
set_opp_helper() isn't needed for this patch anymore. It may become
needed sometime later, but not for this series. I'll remove it in the
next version, thanks!
