Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53E22C83
	for <linux-staging@lists.linux.dev>; Wed,  6 Oct 2021 21:20:35 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id y23so16197677lfb.0
        for <linux-staging@lists.linux.dev>; Wed, 06 Oct 2021 14:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7tLLaK+FEaYHr56nHjbXad4JSKaQLC9aVN+Wg4j4X4w=;
        b=lDLQmpmt9gb3AJaiKrlFZZP5xQzR7S4e3gFVcwGsEraX5rvYbCISyX3eLe42ICVm30
         WSwIsR514+SPYhQWs7j4VfHiKuyYXfLdBDsQ0iVCr7y1eLaY01mGfgYhFed47bNWxR/y
         caBi3Dt6fpwXfGj1PTgx4MIj/w8UkBHcG2okl3FyIDdRN5WJWHF53/ajZAz8wtTohTSv
         jXXMaZJhUPaHyirAIWYdO1jhSrxUGcX0cSUXjum7aNqSSQ9iei83yBsnTpeC5nJl/rZl
         fHzHi7f8afTFobwolLQYUWf+WYM+VFVl32wlweZLC4ri0rF15lqNWo/AwHIKyq+xAZ4A
         yfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7tLLaK+FEaYHr56nHjbXad4JSKaQLC9aVN+Wg4j4X4w=;
        b=ghQ3hYDofYK5IKmBe6bBSjnMyI1mF+zL/0w0OJiq8DPA7QTM8AzQbuq3pXtgtsJxyV
         gZ2Laf+K0pQpAdFYz4pa/MKn7hfVRtMnYS6GARQNCFaEUQGy0+dV5+aJr/IAnBvjU2YN
         hQ9a4qNCxfYMu5k0HG30bm41BWJQUaYKdrelg9nQ1toJzFagjGP+Eeti+Zz6rEIm3CAX
         cqDYSF8cHrGfx6lJakkLViGgUZz17kzG6trDxRekvCgKjhYQYfOCPUU8gg9dJ2sc2QqP
         a0dcoG3XSFoVax9Y9eLcLqE73B4A8euN5JwIiGQeG5rJXpLY3TiWSAU6LdoVA0eeUDv1
         Kt+g==
X-Gm-Message-State: AOAM532zWYAVfN/iR+LekX8Xq5btiLmPk853QnMsrpOycw7IY3Kb8pPm
	u8pZNAnsBKUuzoyITsxh0hc=
X-Google-Smtp-Source: ABdhPJwQC622dbAl50/cK12stk7nHISdUN4TNNE0R7buPRyxLUtPby8n1l4y/0q7oUNm6hKqveKPxQ==
X-Received: by 2002:a05:6512:3d93:: with SMTP id k19mr397196lfv.114.1633555234052;
        Wed, 06 Oct 2021 14:20:34 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id h20sm2382258ljc.76.2021.10.06.14.20.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 14:20:33 -0700 (PDT)
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
 <CAPDyKFq_-HGPRNiNDmnEbuah0mUYoRUWVs1SvbQ6VNMMwEcXjA@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f10567ec-c804-af5b-7d31-5977270a7b7a@gmail.com>
Date: Thu, 7 Oct 2021 00:20:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAPDyKFq_-HGPRNiNDmnEbuah0mUYoRUWVs1SvbQ6VNMMwEcXjA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

06.10.2021 15:38, Ulf Hansson пишет:
> In principle what you ask for, is if we can avoid calling
> __pm_runtime_disable() in __device_suspend_late() (and vice versa in
> device_resume_early()).
> 
> I think the short answer is no, at least from a generic point of view.
> Maybe we can figure out a way to allow this on a per device basis, as
> an opt-in solution. I am not sure what Rafael would think about this,
> let's see.
> 
> Another option to address the problem is already available to use for
> these kinds of cases. This would be to add also a pair of
> ->suspend|resume() callbacks to I2C driver. Along the lines of the
> below.
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index c883044715f3..589bf872ab25 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1918,6 +1918,7 @@ static int __maybe_unused
> tegra_i2c_resume(struct device *dev)
>  }
> 
>  static const struct dev_pm_ops tegra_i2c_pm = {
> +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_put_noidle, pm_runtime_get_sync)
>         SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_i2c_suspend, tegra_i2c_resume)
>         SET_RUNTIME_PM_OPS(tegra_i2c_runtime_suspend, tegra_i2c_runtime_resume,
>                            NULL)
> 
> In this way, the device would already be runtime resumed, if there is
> call to pm_runtime_get_sync() from the clock framework due to the
> clk_prepare|unprepare() being called. If that also turns out to happen
> *after* runtime PM has been disabled for the device, the call to
> pm_runtime_get_sync() would still succeed (returning 1, see
> rpm_resume()), rather than a negative error code.
> 
> Yes, we may end up runtime resuming the device during system suspend,
> even if it turns out not to be needed. Although, that doesn't seem to
> be the case for the Tegra I2C driver, right?

Tegra I2C will turn off clocks on suspend regardless of RPM state.
Overall, it's a plausible solution, thank you!

As I said in the other reply, I'll simply remove the suspend ops from
clk driver, they are not needed anymore. The problem is gone.
