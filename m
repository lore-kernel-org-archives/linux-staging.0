Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC102F80
	for <linux-staging@lists.linux.dev>; Fri,  1 Oct 2021 14:37:23 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id z24so39705433lfu.13
        for <linux-staging@lists.linux.dev>; Fri, 01 Oct 2021 07:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LVU9fXiM8g1pH7koqYPYX1n75qM66AiSkIRtsIE6Mik=;
        b=rjdp3uSFyx/KPmILmOXA7zcMX2+9jvG1S5UIOIMptwVjPZDLmd2m2GUsZlCHaAW145
         3MAbPK9byBkqxyqigd/bPNlnHnU5aQO3Sb9i4E0G6+8b4lShKSFQ6cOdQ4GBXEx3h4kR
         RexBLqYY+OWrmoGwvKy3/kio2LVbujF88ta8dsAcdGTqnC7YCbpDYLlFYAct6DmFCt5G
         crMGo4xuxnDknabvbiAq5xJJISgd/dp2iZ+4O8nuRqdo59bmmCKL7czZCbXAAQCfu/nd
         GXUzqvgWtpYHJpzlm7ZpLul8ysD3f3vTc5ftQMqnENyFLhXoSleoB35xsL/rwShU4xsu
         mAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LVU9fXiM8g1pH7koqYPYX1n75qM66AiSkIRtsIE6Mik=;
        b=1Sxl3u8wSCUulhfu+l22EzyckurygQ1PebuqSEHil/7FXlDwm2jfmtBUAolE+XUljW
         41e8F+0hYyhJbnjpoGfFUG6UJmdnyrfC9svaqTGlp3inRL8Gcooog79/BbNtIpS0VUGa
         3u3di+PLUPSU/EM70XtDxcl/vjBmj3y8MJ5+GbneaIp7tRCzCA98k5NGZAFXNK6R4qTD
         WME3hXCBg4UE4mqlJb6TRT9mVaxXlhxhvngQQjFCz16vWXb1S8HBBeHWUBi3vav7AVDN
         aA50Ddh5Bfl2YDhDe3ZL1t+0MG3yK+DxfTZNQrINwc/Ofx8LbJ4NeTiAJH6Oh2PD+MZd
         0WRA==
X-Gm-Message-State: AOAM533YGYGDLu6JrkNY36Spd2OItYWFcahCoT7HpaTUrz5BXpX7wzEz
	BhMwhe/V9//AWTak9H3WRYjoUUwknOkNdShi9mDYs/k2tPg=
X-Google-Smtp-Source: ABdhPJzoa2d4NLaXfyZ7/92L/e88lFw9mt5p0hvXF87bHS92UJ1JIvsfDpz1WLHt81/6+mvdON7qC703SsoiVg2R0Mc=
X-Received: by 2002:a05:6512:3095:: with SMTP id z21mr5857247lfd.167.1633099040779;
 Fri, 01 Oct 2021 07:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210926224058.1252-1-digetx@gmail.com>
In-Reply-To: <20210926224058.1252-1-digetx@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 1 Oct 2021 16:36:44 +0200
Message-ID: <CAPDyKFog31OatzU0fHUMfN5FRsX+8Thm8TfipA4QisgFepU+rA@mail.gmail.com>
Subject: Re: [PATCH v13 00/35] NVIDIA Tegra power management patches for 5.16
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Michael Turquette <mturquette@baylibre.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>, 
	Linux PM <linux-pm@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>, 
	linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org, 
	linux-mmc <linux-mmc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>, 
	Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>, David Heidelberg <david@ixit.cz>
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Sept 2021 at 00:42, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> This series adds runtime PM support to Tegra drivers and enables core
> voltage scaling for Tegra20/30 SoCs, resolving overheating troubles.
>
> All patches in this series are interdependent and should go via Tegra tree.
>
> Changelog:
>
> v13: - Fixed compile-test error reported by build bot by reverting the
>        mmc/ patch to v11. The sdhci_suspend/resume_host() functions aren't
>        available with the disabled CONFIG_PM_SLEEP, some code needs the
>        ifdef.
>
>      - Added last r-b from Rob Herring for the DT patches.
>
>      - Corrected clk/ PM domain-support patch by not using the
>        devm_tegra_core_dev_init_opp_table_common() helper, which I
>        utilized in v12. The clk driver implements its own power domain
>        state syncing and common helper shouldn't be used. This fixes driver
>        probing for some clocks on some devices. It was reported by
>        Svyatoslav Ryhel for PLLE OPP error on T30 Asus Transformer tablet.

Dmitry, I have looked through the series and besides those comments
that I have posted, I have nothing more to add. Overall it looks good
to me.

Kind regards
Uffe
