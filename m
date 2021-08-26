Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD7F3FC2
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 02:55:55 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id 28-20020a17090a031cb0290178dcd8a4d1so5117486pje.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 19:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XZJy3B7m2q1WQYxMFNJqVt+qoddOU66BMzkNgwutOWg=;
        b=BqMyQF/pRrF5xvz5gMLvg1PjbQE0frktW1h8fThSOxAyiiCfj3dL0xTey26htEbkAU
         qVk4YC/4pxXxGHnr1GTo9bAoMJ4eX1tti5O7V1wnRrIafIwyVqmUZ2m6I0wxB2W1enrU
         HYOhVAex2Ke6zlvt61UNmgKkPh0dFb29lz983ZdH0aQ73RTHtAt7M1/VCP+x5TO9AjAI
         IJ3QFiGrCxXaLSKuBsbiYJZ42RDh74ChanCbedOwOUd6kuh7jO/uAx7AqCUeER3jlnSQ
         JtlHN1LIH4ywCIyB5pTCzFG5gUqpfLooaOTxS3rQYlWnLCOQf96ZEpwgb/6YUmVVCCWa
         uEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XZJy3B7m2q1WQYxMFNJqVt+qoddOU66BMzkNgwutOWg=;
        b=LpBOPpZt4Tjcir/c1EXtWsTt+CrUZDOTaUG9BGGavXv3lqhrdHOpKGwnXhEhw+9XLA
         vx6dV9HYrSFAX2xIwjOQ+AF5TAKN65kNObriszgRjsrBPg7vkHkW5uncvIkFbI/vnA3B
         sSMdonj+R05F11h3s8to+CwQTTYjeyzUUZZrYO7fYhlNuPhMVitco5K7xwzJg/rQAIkL
         KIIa0U5/nC66A+IoPmcUqKOaedx5GD9y07LgTrk4MZgo/dsmSs6UaFK2L4WGbA/6RYgU
         WXnF+86vm91rayKUvPj4tY4jYh66OpX4+i0zxtvJfkUEEbywdd3WK5d3ksz038dK2Oul
         Xz/w==
X-Gm-Message-State: AOAM5320qhCLnBkH9ouNgEVxbV2+kDiI/9qQCVFSTNg4gka1JRLNx4RS
	DsrO4lHt+EZkfswCstGWycYT4Q==
X-Google-Smtp-Source: ABdhPJxp/UrPyXCwFMVDb4P8xsIyAd9gtXZ72kFLG9qw2YDutl/4rgLBxJGBT6WkpyrCaGfD2F0KiA==
X-Received: by 2002:a17:90b:3144:: with SMTP id ip4mr14265346pjb.22.1629946555282;
        Wed, 25 Aug 2021 19:55:55 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id 22sm1308517pgn.88.2021.08.25.19.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 19:55:54 -0700 (PDT)
Date: Thu, 26 Aug 2021 08:25:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-tegra <linux-tegra@vger.kernel.org>,
	Linux PM <linux-pm@vger.kernel.org>,
	Linux USB List <linux-usb@vger.kernel.org>,
	linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-mmc <linux-mmc@vger.kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	DTML <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
Message-ID: <20210826025550.sshd7xl3gsuendoi@vireshk-i7>
References: <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
 <f1314a47-9e8b-58e1-7c3f-0afb1ec8e70a@gmail.com>
 <20210819061617.r4kuqxafjstrv3kt@vireshk-i7>
 <CAPDyKFpg8ixT4AEjzVLTwQR7Nn9CctjnLCDS5GwkOrAERquyxw@mail.gmail.com>
 <20210820051843.5mueqpnjbqt3zdzc@vireshk-i7>
 <b887de8c-a40b-a62e-8abf-698e67cdb70c@gmail.com>
 <ed70e422-e0e9-8c2a-7ce6-e39cb6fd8108@gmail.com>
 <20210826025427.exdinwkuavyfcp3f@vireshk-i7>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826025427.exdinwkuavyfcp3f@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52

On 26-08-21, 08:24, Viresh Kumar wrote:
> On 25-08-21, 18:41, Dmitry Osipenko wrote:
> > Thinking a bit more about this, I got a nicer variant which actually works in all cases for Tegra.
> > 
> > Viresh / Ulf, what do you think about this:
> 
> This is what I have been suggesting from day 1 :)
> 
> https://lore.kernel.org/linux-staging/20210818055849.ybfajzu75ecpdrbn@vireshk-i7/
> 
>  "
>   And if it is all about just syncing the genpd core, then can the
>   genpd core do something like what clk framework does? i.e. allow a
>   new optional genpd callback, get_performance_state() (just like
>   set_performance_state()), which can be called initially by the core
>   to get the performance to something other than zero.
>  "
> 
> Looks good to me :)

When you refresh this stuff, please send only 3-4 patches to update
the core stuff and show an example. Once we finalize with the
interface, you can update all the users. Else this is just noise for
everyone else.

-- 
viresh
