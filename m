Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AD570
	for <linux-staging@lists.linux.dev>; Tue, 29 Jun 2021 10:23:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A50861DB3;
	Tue, 29 Jun 2021 10:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624962218;
	bh=Apt+mTUvqShoNmNq7Ll6mm1UxSNfdxh6yWN/C+poPkE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aT7tmWnU9INfBhSd5eSAVFuD2cFlcNfA069oon6xbZUicquITLorOs2EWb8icWj14
	 DPhzNMhkqPprl3biinG78pTkBFOCQuT6nL4C6MaDbB1Mez+KujmfM5eWTFMgcctUSZ
	 5jeh9HjR66rp0e2Vs1O/X9ghsKFi1agRTFrW3UtiQhYB7U8QXbhc1GxzcHyw8M2bR6
	 c837r+NSQBZAYr56+cqzf5Gwgp7esnbbwY1MKV2aqCdKQx7M4UHFXXtccJbWZ5IDds
	 +melvIPa2dSpwuUp84vZ7wxHw0l08tlIL9o/KDSbsuwjYEgzobOXrTL8an7277kK1Z
	 0pXKhvhNtNe7Q==
Date: Tue, 29 Jun 2021 12:23:32 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Axel Lin <axel.lin@ingics.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxarm@huawei.com,
 mauro.chehab@huawei.com, Lee Jones <lee.jones@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev
Subject: Re: [PATCH v9 2/5] regulator: hi6421v600-regulator: fix platform
 drvdata
Message-ID: <20210629122332.398668b2@coco.lan>
In-Reply-To: <CAFRkauBcXDVihxN8MHoStGHjDyx-VyOe6tT8dkY2tAisHoeE8w@mail.gmail.com>
References: <cover.1624640087.git.mchehab+huawei@kernel.org>
	<ef0ff659a875b91b454df12b57888f2b473877fa.1624640087.git.mchehab+huawei@kernel.org>
	<CAFRkauBcXDVihxN8MHoStGHjDyx-VyOe6tT8dkY2tAisHoeE8w@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 26 Jun 2021 11:41:50 +0800
Axel Lin <axel.lin@ingics.com> escreveu:

> > @@ -231,7 +228,7 @@ static int hi6421_spmi_regulator_probe(struct platform_device *pdev)
> >  {
> >         struct device *pmic_dev = pdev->dev.parent;
> >         struct regulator_config config = { };
> > -       struct hi6421_spmi_reg_priv *priv;
> > +       struct hi6421_spmi_reg_info *sreg;
> >         struct hi6421_spmi_reg_info *info;
> >         struct device *dev = &pdev->dev;
> >         struct hi6421_spmi_pmic *pmic;
> > @@ -247,18 +244,17 @@ static int hi6421_spmi_regulator_probe(struct platform_device *pdev)
> >         if (WARN_ON(!pmic))
> >                 return -ENODEV;
> >
> > -       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > -       if (!priv)
> > +       sreg = devm_kzalloc(dev, sizeof(*sreg), GFP_KERNEL);
> > +       if (!sreg)
> >                 return -ENOMEM;
> >
> > -       mutex_init(&priv->enable_mutex);
> > -       platform_set_drvdata(pdev, priv);
> > +       sreg->enable_mutex = &pmic->enable_mutex;
> >
> >         for (i = 0; i < ARRAY_SIZE(regulator_info); i++) {
> >                 info = &regulator_info[i];
> >
> >                 config.dev = pdev->dev.parent;
> > -               config.driver_data = info;
> > +               config.driver_data = sreg;  
> 
> This won't work and that was what my patch fixed.
> e.g. When you call
> struct hi6421_spmi_reg_info *sreg = rdev_get_drvdata(rdev);
> sreg->eco_mode_mask and sreg->eco_uA will always be 0.

Yeah, probably something got lost during the several rebases. 
Anyway, I'll send in a few a new patch series addressing this issue.

Thanks,
Mauro
