Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475A572
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 08:38:24 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id x192so24872985lff.12
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 01:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=opxUgAexG3s+/01pbgkqJfjPAUC0LEyYCXhf01ZbC0c=;
        b=D7kQyoaL09G2+qKjzlGip7Tt2fmqCCpaZgG45v9JMgbOfXMzpbe/F4Zokvs+VPF/lD
         WfrP/tvOaQ8QBq3g7FNly2cBTmnmgB1n+NoFfi8LpcH9hw6cxOgxmQsUnhUWqjQsOPdk
         EUwCSAhuwGMtcYj4aJlAvkIXk38IFW5ZrLYFxPg1cXOn2fOiRk64e8LzpJPHNmNOPPVJ
         0E1w2kLkFxNQpvmJiOkeYPr8EOUsx5Je8yU7KPsBWr2sFivNGheJ7VSh8C9+gTO/FKEG
         CVJzyRbEzNl6m5aC5n8JeMKgPz7GJOq6ARqSDsndsJRJcrWKQ8cr/YdS6AaPiYKrPPMN
         8Cuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=opxUgAexG3s+/01pbgkqJfjPAUC0LEyYCXhf01ZbC0c=;
        b=BGFtxuhD4jmWJOxd+uICxca4RVL07y4MTa082FOtB6Yqw//sIDigVFq+7zOjozDgzM
         p/2jeYU9hVC5sAUGIfo9FNng0Sl8TNJZQscK3iis8nh7d/BCRymQa/QSRzICY3s8WZHH
         T0eeFD1nNca4+uAK1JusQXj3SqQQyottoqqRGNQcloKdFnMxxIHnTDDG5oIxEmnaOdt1
         Ok780+7qau++CIOdSK4wqPe6aMriMNn7z4bBET0aq7q0DR20XT40VUvRyjGl/uxsFFTf
         CwAVE4QSeZ+tyzv5vCJ4UdjYQgHFw+GBIaDdsjLtG4Kh5ik6XQ07tOXuqV/MDBLgVCyo
         1mTQ==
X-Gm-Message-State: AOAM530XWnOZlz+rSC0M0GFbyJifIJ7ytizAEPcBSC3POjREN3B11oXA
	6hl4SmnsUfQuNlplnMy1AoY=
X-Google-Smtp-Source: ABdhPJxQusOyrULmSzYae9aV203LQo0/dtj0Yz/g3SI3pMK/z/tMpwc72My6KFI8vzlhgvLi1jfZ/w==
X-Received: by 2002:a05:6512:a8d:: with SMTP id m13mr23749109lfu.305.1634459902328;
        Sun, 17 Oct 2021 01:38:22 -0700 (PDT)
Received: from [192.168.2.145] (46-138-48-94.dynamic.spd-mgts.ru. [46.138.48.94])
        by smtp.googlemail.com with ESMTPSA id r30sm1092639lfp.298.2021.10.17.01.38.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Oct 2021 01:38:21 -0700 (PDT)
Subject: Re: [PATCH v13 20/35] mtd: rawnand: tegra: Add runtime PM and OPP
 support
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
 <20210926224058.1252-21-digetx@gmail.com>
 <CAPDyKFoF2QxZss_h9B1NFqOqgeF=TQ6LajCedGiJ9_P8X5M0NA@mail.gmail.com>
 <0bcbcd3d-2154-03d2-f572-dc9032125c26@gmail.com>
 <CAPDyKFohA9iu2UQfwoc0pCrCGupdwnUTWjKOtP09_C2KaFSo8w@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <073114ea-490b-89a9-e82d-852b34cb11df@gmail.com>
Date: Sun, 17 Oct 2021 11:38:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAPDyKFohA9iu2UQfwoc0pCrCGupdwnUTWjKOtP09_C2KaFSo8w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

01.10.2021 18:01, Ulf Hansson пишет:
> On Fri, 1 Oct 2021 at 16:35, Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 01.10.2021 17:24, Ulf Hansson пишет:
>>> On Mon, 27 Sept 2021 at 00:42, Dmitry Osipenko <digetx@gmail.com> wrote:
>>>>
>>>> The NAND on Tegra belongs to the core power domain and we're going to
>>>> enable GENPD support for the core domain. Now NAND must be resumed using
>>>> runtime PM API in order to initialize the NAND power state. Add runtime PM
>>>> and OPP support to the NAND driver.
>>>>
>>>> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  drivers/mtd/nand/raw/tegra_nand.c | 55 ++++++++++++++++++++++++++-----
>>>>  1 file changed, 47 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
>>>> index 32431bbe69b8..098fcc9cb9df 100644
>>>> --- a/drivers/mtd/nand/raw/tegra_nand.c
>>>> +++ b/drivers/mtd/nand/raw/tegra_nand.c
>>>> @@ -17,8 +17,11 @@
>>>>  #include <linux/mtd/rawnand.h>
>>>>  #include <linux/of.h>
>>>>  #include <linux/platform_device.h>
>>>> +#include <linux/pm_runtime.h>
>>>>  #include <linux/reset.h>
>>>>
>>>> +#include <soc/tegra/common.h>
>>>> +
>>>>  #define COMMAND                                        0x00
>>>>  #define   COMMAND_GO                           BIT(31)
>>>>  #define   COMMAND_CLE                          BIT(30)
>>>> @@ -1151,6 +1154,7 @@ static int tegra_nand_probe(struct platform_device *pdev)
>>>>                 return -ENOMEM;
>>>>
>>>>         ctrl->dev = &pdev->dev;
>>>> +       platform_set_drvdata(pdev, ctrl);
>>>>         nand_controller_init(&ctrl->controller);
>>>>         ctrl->controller.ops = &tegra_nand_controller_ops;
>>>>
>>>> @@ -1166,14 +1170,22 @@ static int tegra_nand_probe(struct platform_device *pdev)
>>>>         if (IS_ERR(ctrl->clk))
>>>>                 return PTR_ERR(ctrl->clk);
>>>>
>>>> -       err = clk_prepare_enable(ctrl->clk);
>>>> +       err = devm_pm_runtime_enable(&pdev->dev);
>>>> +       if (err)
>>>> +               return err;
>>>> +
>>>> +       err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
>>>> +       if (err)
>>>> +               return err;
>>>> +
>>>> +       err = pm_runtime_resume_and_get(&pdev->dev);
>>>>         if (err)
>>>>                 return err;
>>>>
>>>>         err = reset_control_reset(rst);
>>>>         if (err) {
>>>>                 dev_err(ctrl->dev, "Failed to reset HW: %d\n", err);
>>>> -               goto err_disable_clk;
>>>> +               goto err_put_pm;
>>>>         }
>>>>
>>>>         writel_relaxed(HWSTATUS_CMD_DEFAULT, ctrl->regs + HWSTATUS_CMD);
>>>> @@ -1188,21 +1200,19 @@ static int tegra_nand_probe(struct platform_device *pdev)
>>>>                                dev_name(&pdev->dev), ctrl);
>>>>         if (err) {
>>>>                 dev_err(ctrl->dev, "Failed to get IRQ: %d\n", err);
>>>> -               goto err_disable_clk;
>>>> +               goto err_put_pm;
>>>>         }
>>>>
>>>>         writel_relaxed(DMA_MST_CTRL_IS_DONE, ctrl->regs + DMA_MST_CTRL);
>>>>
>>>>         err = tegra_nand_chips_init(ctrl->dev, ctrl);
>>>>         if (err)
>>>> -               goto err_disable_clk;
>>>> -
>>>> -       platform_set_drvdata(pdev, ctrl);
>>>> +               goto err_put_pm;
>>>>
>>>
>>> There is no corresponding call pm_runtime_put() here. Is it
>>> intentional to always leave the device runtime resumed after ->probe()
>>> has succeeded?
>>>
>>> I noticed you included some comments about this for some other
>>> drivers, as those needed more tweaks. Is that also the case for this
>>> driver?
>>
>> Could you please clarify? There is pm_runtime_put() in both probe-error
>> and remove() code paths here.
> 
> I was not considering the error path of ->probe() (or ->remove()), but
> was rather thinking about when ->probe() completes successfully. Then
> you keep the device runtime resumed, because you have called
> pm_runtime_resume_and_get() for it.
> 
> Shouldn't you have a corresponding pm_runtime_put() in ->probe(),
> allowing it to be runtime suspended, until the device is really needed
> later on. No?

This driver doesn't support active power management. I don't have Tegra
hardware that uses NAND storage for testing, so it's up to somebody else
to implement dynamic power management. NAND doesn't require high
voltages, so it's fine to keep the old driver behaviour by keeping
hardware resumed since the probe time.
