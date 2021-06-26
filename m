Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38228177
	for <linux-staging@lists.linux.dev>; Sat, 26 Jun 2021 03:42:28 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id q14so16192603eds.5
        for <linux-staging@lists.linux.dev>; Fri, 25 Jun 2021 20:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ingics-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZRVdCcPcCziowTNJTVv4QnxvuJfCULnuUiYke2HSea0=;
        b=SoLCPl3ZtO7L/E+xZKlqWCOkCFJi1KRpPwGUJ8oaq0gdyKdy89PZIttZzRunNSCDGI
         cRSyUpvniO7eF6C+qYnKg8+WnU+TnE3Tr/1cXPWHcJ7jJdU37wWrr4WlhlAxx5pC7Bix
         +mfc8DMNiYhx5+1mEcfwjXEjUTGBPQE5nOzL0/6aXg3EIzgrIwT+2sksRnfRCOEPfy+S
         BNeA7Iv3sxBnpAy5MTeO7QEnVowbesdyJaR3yQZtnqnD83dm9S3MV89WbFmBmHixOPn0
         1Onx99kcDTKY0qaZSnU38fNcTzzTelJtafNJKAmW0F+q9++r0CW2c37eon6+W/R7qYA7
         anzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZRVdCcPcCziowTNJTVv4QnxvuJfCULnuUiYke2HSea0=;
        b=kseXlE54GAOEyDZUt1LTzpHnkVtUHvcADuOupHzsiL84AlQu0zKd5N/0ei5sxmLV6T
         lf0pV+qVbYy7QnjFk7rk6cXOzTgv4HIZuUU64rlV8MOyP5IX6V9Hqk8AGYa7TlM7x9Z7
         d8IoPJhMTkU2/jBXUtUZPrXBKxi3LjLer3I6Nmqd8RsbXrxty2iXoZSBG1LYaRcWJY3I
         XSo4/9JLv3JM80j38DHDcvk+3F9OwD3l1E9V8CsnzuNie+NgjR6+FSKJK4zMLAVTJ/Zo
         rYhaFFB/aNLXr6ebYK3Dm8V/9Zib8CIdZ7aodT98b9LRU8Y7xT2nyDQ3Qk8OAGf3LFzF
         TX7A==
X-Gm-Message-State: AOAM530aIj0XS1+dUQOZPvgj2plyFZ1ggIJzNBRufE6BthRzPzrXoSb2
	jWEgQjIqzvoxMWQI0pQuRYUkfNoRbDT/OM5Tlpt6QQ==
X-Google-Smtp-Source: ABdhPJzmKzoxYw8suupbNSOYdXWy275N44i/jZoncsm9PrFhiafmJ3OobDTQE8hwye7Zpln8CcA1+anLTaaAZACHx0M=
X-Received: by 2002:a50:ee13:: with SMTP id g19mr19116888eds.147.1624678946571;
 Fri, 25 Jun 2021 20:42:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1624640087.git.mchehab+huawei@kernel.org> <ef0ff659a875b91b454df12b57888f2b473877fa.1624640087.git.mchehab+huawei@kernel.org>
In-Reply-To: <ef0ff659a875b91b454df12b57888f2b473877fa.1624640087.git.mchehab+huawei@kernel.org>
From: Axel Lin <axel.lin@ingics.com>
Date: Sat, 26 Jun 2021 11:41:50 +0800
Message-ID: <CAFRkauBcXDVihxN8MHoStGHjDyx-VyOe6tT8dkY2tAisHoeE8w@mail.gmail.com>
Subject: Re: [PATCH v9 2/5] regulator: hi6421v600-regulator: fix platform drvdata
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxarm@huawei.com, 
	mauro.chehab@huawei.com, Lee Jones <lee.jones@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> @@ -231,7 +228,7 @@ static int hi6421_spmi_regulator_probe(struct platform_device *pdev)
>  {
>         struct device *pmic_dev = pdev->dev.parent;
>         struct regulator_config config = { };
> -       struct hi6421_spmi_reg_priv *priv;
> +       struct hi6421_spmi_reg_info *sreg;
>         struct hi6421_spmi_reg_info *info;
>         struct device *dev = &pdev->dev;
>         struct hi6421_spmi_pmic *pmic;
> @@ -247,18 +244,17 @@ static int hi6421_spmi_regulator_probe(struct platform_device *pdev)
>         if (WARN_ON(!pmic))
>                 return -ENODEV;
>
> -       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> -       if (!priv)
> +       sreg = devm_kzalloc(dev, sizeof(*sreg), GFP_KERNEL);
> +       if (!sreg)
>                 return -ENOMEM;
>
> -       mutex_init(&priv->enable_mutex);
> -       platform_set_drvdata(pdev, priv);
> +       sreg->enable_mutex = &pmic->enable_mutex;
>
>         for (i = 0; i < ARRAY_SIZE(regulator_info); i++) {
>                 info = &regulator_info[i];
>
>                 config.dev = pdev->dev.parent;
> -               config.driver_data = info;
> +               config.driver_data = sreg;

This won't work and that was what my patch fixed.
e.g. When you call
struct hi6421_spmi_reg_info *sreg = rdev_get_drvdata(rdev);
sreg->eco_mode_mask and sreg->eco_uA will always be 0.

Regards,
Axel
