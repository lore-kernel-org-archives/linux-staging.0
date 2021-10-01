Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEA02F80
	for <linux-staging@lists.linux.dev>; Fri,  1 Oct 2021 14:35:32 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id y23so4819629lfj.7
        for <linux-staging@lists.linux.dev>; Fri, 01 Oct 2021 07:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hmV8HiS2tOf7621YfFrxpYJRebZdp4NqBv255LyC2LE=;
        b=gVfVeWzlIRRZb5mmgFJpuc+Yfw2CJzBdf6wr0/B7EujBKlivLfiVtM/grTuqnXkqXG
         yL8Eg6rh9P6iXsBJY7WXnQN929pxP30S5RRlBov9cYfYTncN1DBpTAARGYHxLycdOQxq
         LoF/IhH7L2KT1pyRob0U6ByUrBDl1TmjVVkeH7+nYQQNTiStrkF1dM00+3fLFQJ8oXZE
         7uXslh4Ukfr2j7Mb7RkORfFYa5ef8CKw5FEYlT3u3Ybu5fMh/Takf4SHFHwf5//hRg4G
         lyAxaTeJleP7SYkxCfJV6MSOmxbhUc3DqsYLGPw/q/v25xceW5ZUPvo1euKVX4OyRa4S
         tvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hmV8HiS2tOf7621YfFrxpYJRebZdp4NqBv255LyC2LE=;
        b=OPqdAlIRK9EIt9qR4+hQQIRSb9rL8D6PDmKK0e4lFckdoTMsAbxSkAyDHCOC2E7Rek
         dvDPePUbviXvaLBaOOen0FnfY1lRNThfx9iBScxoWfhdiL7YgQHRckENZkBsV8FhgE6p
         k7Npvx9R12uCevoUs9MfXgqigziQVY/ugldqd0uUornrbiwVR51sOD4kUxlPHkaylNFx
         kS67uNNbkqVvwy1T6tKSdPmyIyDa8qEElz6dSog6FDsC/6ogPTs4ridLzxaSEDBbAWej
         tHIqJ5B3gtjRPHUOrKQdj6w8W6EE0WdNk5Z7YVE+2498EtuR4ySPIIO7Jy+4G1M8T/VR
         JpjQ==
X-Gm-Message-State: AOAM532GzjpaZnYhad7N1LIPnlEb6FHPPxVAlkfN5li9IeiorNQ5C2hM
	t+HRBKHDSLoU4neFgcvZD4A=
X-Google-Smtp-Source: ABdhPJw//TuGFtjAUNUsrPnJxIYfZyV7+RdRH4nZbJDVr/PeCRJiHyUV+Xd9Z3J4jT4xr3JBkfK0Fw==
X-Received: by 2002:a2e:9e87:: with SMTP id f7mr12283717ljk.413.1633098922043;
        Fri, 01 Oct 2021 07:35:22 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-198.dynamic.spd-mgts.ru. [79.139.163.198])
        by smtp.googlemail.com with ESMTPSA id m29sm752018lfo.191.2021.10.01.07.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 07:35:21 -0700 (PDT)
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
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0bcbcd3d-2154-03d2-f572-dc9032125c26@gmail.com>
Date: Fri, 1 Oct 2021 17:35:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAPDyKFoF2QxZss_h9B1NFqOqgeF=TQ6LajCedGiJ9_P8X5M0NA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

01.10.2021 17:24, Ulf Hansson пишет:
> On Mon, 27 Sept 2021 at 00:42, Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> The NAND on Tegra belongs to the core power domain and we're going to
>> enable GENPD support for the core domain. Now NAND must be resumed using
>> runtime PM API in order to initialize the NAND power state. Add runtime PM
>> and OPP support to the NAND driver.
>>
>> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/mtd/nand/raw/tegra_nand.c | 55 ++++++++++++++++++++++++++-----
>>  1 file changed, 47 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
>> index 32431bbe69b8..098fcc9cb9df 100644
>> --- a/drivers/mtd/nand/raw/tegra_nand.c
>> +++ b/drivers/mtd/nand/raw/tegra_nand.c
>> @@ -17,8 +17,11 @@
>>  #include <linux/mtd/rawnand.h>
>>  #include <linux/of.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>>  #include <linux/reset.h>
>>
>> +#include <soc/tegra/common.h>
>> +
>>  #define COMMAND                                        0x00
>>  #define   COMMAND_GO                           BIT(31)
>>  #define   COMMAND_CLE                          BIT(30)
>> @@ -1151,6 +1154,7 @@ static int tegra_nand_probe(struct platform_device *pdev)
>>                 return -ENOMEM;
>>
>>         ctrl->dev = &pdev->dev;
>> +       platform_set_drvdata(pdev, ctrl);
>>         nand_controller_init(&ctrl->controller);
>>         ctrl->controller.ops = &tegra_nand_controller_ops;
>>
>> @@ -1166,14 +1170,22 @@ static int tegra_nand_probe(struct platform_device *pdev)
>>         if (IS_ERR(ctrl->clk))
>>                 return PTR_ERR(ctrl->clk);
>>
>> -       err = clk_prepare_enable(ctrl->clk);
>> +       err = devm_pm_runtime_enable(&pdev->dev);
>> +       if (err)
>> +               return err;
>> +
>> +       err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
>> +       if (err)
>> +               return err;
>> +
>> +       err = pm_runtime_resume_and_get(&pdev->dev);
>>         if (err)
>>                 return err;
>>
>>         err = reset_control_reset(rst);
>>         if (err) {
>>                 dev_err(ctrl->dev, "Failed to reset HW: %d\n", err);
>> -               goto err_disable_clk;
>> +               goto err_put_pm;
>>         }
>>
>>         writel_relaxed(HWSTATUS_CMD_DEFAULT, ctrl->regs + HWSTATUS_CMD);
>> @@ -1188,21 +1200,19 @@ static int tegra_nand_probe(struct platform_device *pdev)
>>                                dev_name(&pdev->dev), ctrl);
>>         if (err) {
>>                 dev_err(ctrl->dev, "Failed to get IRQ: %d\n", err);
>> -               goto err_disable_clk;
>> +               goto err_put_pm;
>>         }
>>
>>         writel_relaxed(DMA_MST_CTRL_IS_DONE, ctrl->regs + DMA_MST_CTRL);
>>
>>         err = tegra_nand_chips_init(ctrl->dev, ctrl);
>>         if (err)
>> -               goto err_disable_clk;
>> -
>> -       platform_set_drvdata(pdev, ctrl);
>> +               goto err_put_pm;
>>
> 
> There is no corresponding call pm_runtime_put() here. Is it
> intentional to always leave the device runtime resumed after ->probe()
> has succeeded?
> 
> I noticed you included some comments about this for some other
> drivers, as those needed more tweaks. Is that also the case for this
> driver?

Could you please clarify? There is pm_runtime_put() in both probe-error
and remove() code paths here.

I assume you're meaning pm_runtime_disable(), but this patch uses
resource-managed devm_pm_runtime_enable(), and thus, explicit disable
isn't needed.

>>         return 0;
>>
>> -err_disable_clk:
>> -       clk_disable_unprepare(ctrl->clk);
>> +err_put_pm:
>> +       pm_runtime_put(ctrl->dev);
>>         return err;
>>  }
>>
> 
> [...]
> 
> Kind regards
> Uffe
> 

