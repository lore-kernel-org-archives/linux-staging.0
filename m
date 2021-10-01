Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4043FCA
	for <linux-staging@lists.linux.dev>; Fri,  1 Oct 2021 14:29:06 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id b20so39823866lfv.3
        for <linux-staging@lists.linux.dev>; Fri, 01 Oct 2021 07:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=voZIz100U/rjLMiNA1FpTbRV2fZQ2pzisFPYPZZCXl4=;
        b=puJwlS7Ax9ZCd/PJhu+WdFh+5z84FjaIWTVsmWD1Qwh1uKmgTiUhuHKxkF0Gu48fOZ
         OmmgTJTxsj8yxxfm2+4CZAhjMbsDfKZdc6yRssTzU4esY7Xa8MKShjjaS8gcEbHh8mXf
         nWJEL9AA3IxU3Ie3lX5vSm4BiEV7ASsz2OB+js0RGg9SCcT6M55T/fHMfXAcYKHPVALn
         oV+jQGrIBJikcnTi7WxtE5m3QB+KY5DOAV+hxWeGZlLDxf4prPfWO4dU1//9h+/h5P0f
         c0gyoZfRmjWkagh2KhhwC35t4hMvJVhO0dovxBL5Zc9kgmF2mRGIWjdLwznAGeyroKlF
         ONLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=voZIz100U/rjLMiNA1FpTbRV2fZQ2pzisFPYPZZCXl4=;
        b=ZJwg2uJcRl5qrnQ4+sLprxFOl5Slk74G/K2bgGPJx18acE0Gz3mrcXyBJU7rQoIenJ
         CyzCafVZBIVfToe2ChqnFfAWtu70x0gD126y5a424z6IvsyjbC1QVePp0rzhlzX3zHWW
         higzJdvwDg9yB6GfXVhAtlUAlwxNagV6EeSFf3bc+iBaPXCOdaFFuTwQV/1ScPBkC1aT
         Cg3XKcSkj4kQqoXn5ROKmXUt5nMenhNwa+8sZ7e4uY8I1gYtJtmvBcGANw8x1bfdVeV9
         re0pRj75rZOWfDza4IeSP79j/s1ErWfin4gI1AckgZ2JDWgBifRfSJlIL/st9AZo9/cC
         9IWg==
X-Gm-Message-State: AOAM5339qBaJyUJ0E0bzXcf9TOfIkaY3jqUspZq53YWp0cRIP1F+pLhG
	bwPdbKiEs9rABlWHe2F1tUM=
X-Google-Smtp-Source: ABdhPJxdoYeHl150nq4P9/HcT8jY9Ic6nmqt/PNmcuw9Oo+qY30jKDqCXTR3KuH7LEiZ0Aed3e2FSw==
X-Received: by 2002:a05:6512:2397:: with SMTP id c23mr5600324lfv.358.1633098542877;
        Fri, 01 Oct 2021 07:29:02 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-198.dynamic.spd-mgts.ru. [79.139.163.198])
        by smtp.googlemail.com with ESMTPSA id b12sm751816lfe.253.2021.10.01.07.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 07:29:02 -0700 (PDT)
Subject: Re: [PATCH v13 13/35] drm/tegra: gr2d: Support generic power domain
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
 <20210926224058.1252-14-digetx@gmail.com>
 <CAPDyKFpzhv1UxjM0q5AWHVxTWC_cCO_Kg_6exO0o_=EoVvjo+w@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <aad7a508-7fb5-3418-f902-def80c365094@gmail.com>
Date: Fri, 1 Oct 2021 17:29:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAPDyKFpzhv1UxjM0q5AWHVxTWC_cCO_Kg_6exO0o_=EoVvjo+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

01.10.2021 16:39, Ulf Hansson пишет:
> On Mon, 27 Sept 2021 at 00:42, Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> Add runtime power management and support generic power domains.
>>
>> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
>> Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
>> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
>> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/gpu/drm/tegra/gr2d.c | 155 +++++++++++++++++++++++++++++++++--
> 
> [...]
> 
>>  static int gr2d_remove(struct platform_device *pdev)
>> @@ -259,15 +312,101 @@ static int gr2d_remove(struct platform_device *pdev)
>>                 return err;
>>         }
>>
>> +       pm_runtime_dont_use_autosuspend(&pdev->dev);
>> +       pm_runtime_disable(&pdev->dev);
> 
> There is no guarantee that the ->runtime_suspend() has been invoked
> here, which means that clock may be left prepared/enabled beyond this
> point.
> 
> I suggest you call pm_runtime_force_suspend(), instead of
> pm_runtime_disable(), to make sure that gets done.

The pm_runtime_disable() performs the final synchronization, please see [1].

[1]
https://elixir.bootlin.com/linux/v5.15-rc3/source/drivers/base/power/runtime.c#L1412

Calling pm_runtime_force_suspend() isn't correct because each 'enable'
must have the corresponding 'disable'. Hence there is no problem here.
