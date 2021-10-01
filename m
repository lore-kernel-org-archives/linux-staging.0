Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755FF3FCA
	for <linux-staging@lists.linux.dev>; Fri,  1 Oct 2021 14:19:37 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id z24so39492999lfu.13
        for <linux-staging@lists.linux.dev>; Fri, 01 Oct 2021 07:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TmYkpMVtb1uSKsqX5euv7WOyLfzbmtOSlOndqVN+8j0=;
        b=duQY39xT4Fb3Hr1PnbXTs56tkaQqjpQAgYJH7QSZorCPxuVu1w1xjBo4K+zxv2eT/i
         Gv8vFaPicQua766hZYd2Z4sFxKAhudSPsUf76DMai8U3Fw5bbvcx7fO5WW1P2A848bGM
         ZQq9OG2u50UNu3Jjx5+mQA6VDCrE6ml8Fh35xGIGRw6EE6eRYolYKa9p+8rWD2ZvBilp
         uWVK4oDlCgf7DxNBdPej6J24qlMnSVWJnHXL2sfU57hu2pnNnIEFwtPnFm56+42awhNu
         cSD+lRwaEeSCzPyePp37ympdEiAHaEdnn7LGs+wYp5tVdUW4CxRCTuk1HbDpdUV4ipuJ
         BGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TmYkpMVtb1uSKsqX5euv7WOyLfzbmtOSlOndqVN+8j0=;
        b=DH8oJcWx/mGNgtIOXH1IGrbUWtxVmi6R+Zm9QZ4mN5GRalpYo60mU5WPZX/FaVKcT2
         pzBJ4CnDeGwCDiDC3CXm8OwUVQXC3LQTv0au1+qehZLtJZ/bhPBU9bHH2BUM2aTBjTlu
         UoEsqKs77nyxB2zfJWFAU6YNenuWSpH0BRCCNLRjnX4mx0fPw1Cvk00FtEOV2w2gfKQ7
         4pL+UoMia8ELUuO9yH+fNpgWWduja7Mc6fxT/ltvCInDvChHMuzG4Moh4xQ8M8vJYayj
         QGZ1YVZAZY35ZTzbYslIqofUX9Bg9lkNLWoD2i11AJ5ZlNk22yxfyA0e2t0ZlHQGtLOw
         oNGw==
X-Gm-Message-State: AOAM532T+Qe3ZEaw7Ssg8DQ24kv3oCnx7xWWzPNWvx4chK4BpIDXJYde
	YOUpGPRbAQzwbN3Gc6mbw0UVqq+m8+qyCkxfEsrMgQ==
X-Google-Smtp-Source: ABdhPJykzVLbDQqRsm8qwArsDUIjqMsOFjOioC0Mnou3m3mAAqwDg9NoSSc7iCu+AIdRWsUjvdPXt+LHd7gC+IctUuw=
X-Received: by 2002:a05:6512:2397:: with SMTP id c23mr5560648lfv.358.1633097975362;
 Fri, 01 Oct 2021 07:19:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210926224058.1252-1-digetx@gmail.com> <20210926224058.1252-18-digetx@gmail.com>
In-Reply-To: <20210926224058.1252-18-digetx@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 1 Oct 2021 16:18:59 +0200
Message-ID: <CAPDyKFoC7Kn9FPjAZLisSKWyYaXr1j2GnyQGNTVg_Dsuku-muA@mail.gmail.com>
Subject: Re: [PATCH v13 17/35] bus: tegra-gmi: Add runtime PM and OPP support
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
> The GMI bus on Tegra belongs to the core power domain and we're going to
> enable GENPD support for the core domain. Now GMI must be resumed using
> runtime PM API in order to initialize the GMI power state. Add runtime PM
> and OPP support to the GMI driver.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/bus/tegra-gmi.c | 52 ++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 46 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/bus/tegra-gmi.c b/drivers/bus/tegra-gmi.c
> index a6570789f7af..72ef8a8c236b 100644
> --- a/drivers/bus/tegra-gmi.c
> +++ b/drivers/bus/tegra-gmi.c
> @@ -13,8 +13,11 @@
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>
> +#include <soc/tegra/common.h>
> +
>  #define TEGRA_GMI_CONFIG               0x00
>  #define TEGRA_GMI_CONFIG_GO            BIT(31)
>  #define TEGRA_GMI_BUS_WIDTH_32BIT      BIT(30)
> @@ -54,9 +57,9 @@ static int tegra_gmi_enable(struct tegra_gmi *gmi)
>  {
>         int err;
>
> -       err = clk_prepare_enable(gmi->clk);
> -       if (err < 0) {
> -               dev_err(gmi->dev, "failed to enable clock: %d\n", err);
> +       err = pm_runtime_resume_and_get(gmi->dev);
> +       if (err) {
> +               pm_runtime_disable(gmi->dev);
>                 return err;
>         }
>
> @@ -83,7 +86,8 @@ static void tegra_gmi_disable(struct tegra_gmi *gmi)
>         writel(config, gmi->base + TEGRA_GMI_CONFIG);
>
>         reset_control_assert(gmi->rst);
> -       clk_disable_unprepare(gmi->clk);
> +
> +       pm_runtime_put(gmi->dev);
>  }
>
>  static int tegra_gmi_parse_dt(struct tegra_gmi *gmi)
> @@ -213,6 +217,7 @@ static int tegra_gmi_probe(struct platform_device *pdev)
>         if (!gmi)
>                 return -ENOMEM;
>
> +       platform_set_drvdata(pdev, gmi);
>         gmi->dev = dev;
>
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> @@ -232,6 +237,14 @@ static int tegra_gmi_probe(struct platform_device *pdev)
>                 return PTR_ERR(gmi->rst);
>         }
>
> +       err = devm_pm_runtime_enable(gmi->dev);
> +       if (err)
> +               return err;
> +
> +       err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
> +       if (err)
> +               return err;
> +
>         err = tegra_gmi_parse_dt(gmi);
>         if (err)
>                 return err;
> @@ -247,8 +260,6 @@ static int tegra_gmi_probe(struct platform_device *pdev)
>                 return err;
>         }
>
> -       platform_set_drvdata(pdev, gmi);
> -
>         return 0;
>  }
>
> @@ -262,6 +273,34 @@ static int tegra_gmi_remove(struct platform_device *pdev)

Similar comment as for patch13, for the ->remove() callback.

This problem, which sometimes also exists in the error path in
->probe() (according to my comments in patch13), seems to be a common
issue in the series. I will therefore not continue to repeat my
comment on this for the remaining patches in the series, I think I
have made my point. :-)

Kind regards
Uffe
