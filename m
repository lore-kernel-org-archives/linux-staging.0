Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02722C93
	for <linux-staging@lists.linux.dev>; Wed,  6 Oct 2021 21:25:08 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id r19so14953768lfe.10
        for <linux-staging@lists.linux.dev>; Wed, 06 Oct 2021 14:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z+D15vASJYR0SWQDyQP1KR8IKSZuDFJmcBUbxtdKwZQ=;
        b=AZF3RQplv1wwucr3sX1VkhwqLxjb5jhLmlPTf6BcmzWR9S/ab1/50oKhYytjUxuxjF
         OHbHbObgbt4KErSP1sBFtIGwDtqomaoinmksPntQwQo7yPKa9M8wW3aTrRkR1ENr9YXH
         An3NYJ3BFO03YmpjlOAhqA15ukSOSB0TmSxxvb7VM8/kfAy6BCpaA8CZeYQjS7j0xRGz
         CIwjLR5d3klZfaAeb5Knr5b9YHfwyA4YgK3OqOvAXLc4tncC4f/hvr9mbFYGzpAun4QX
         mHvtjJ798n0SKwZ8bTfGtw8Fxr4u/DkYaIvvzaIRXqZRO/CW8DDEWuYH/pEiTmGzLMvD
         XQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z+D15vASJYR0SWQDyQP1KR8IKSZuDFJmcBUbxtdKwZQ=;
        b=WM0imXkS8HbOSYIbmTjK2/CB8xJ3f1SwdmD840IMB2PrKqgnCsw4Q+sEof6uK2iea1
         slPk8BjTTz644aEA1GcNjpeBq0kShQNst8umLoxwo5z7Ug89cl+yijNOFcEwco2N/FFl
         ABBE1ie8jI21MFQZQzfGOD/YPdPhK8izsNrf2lvUe2q9y6vT3C0x34XS/q06wZswW7zw
         hLGgCptOQA+MWxrcMHKAuz66ZY+HPR0o/ioOOZPCBtOOcYflAD0Kl/bx37K83OfyMnt7
         IUqFDNNUkh6u+ATZQOX0W01pIs4pKJ9pe3PqvrCanYKFxwt+Dctse5Gs7fBO0iK9JjYm
         /RrA==
X-Gm-Message-State: AOAM532VTem0ZaB3rdOOpLpweRIlER+IhbbpPqV8PxDA5E/tN6RfQGd+
	lYnC6iKBu1x+jiqcGcC7w5s=
X-Google-Smtp-Source: ABdhPJw744uZG1epOJTVnrPpE+ugh/u7w22Q41348b4PDrlNyl5oKr3YpciuIkhK7LF587NSrNYsPA==
X-Received: by 2002:a2e:1404:: with SMTP id u4mr387417ljd.269.1633555506822;
        Wed, 06 Oct 2021 14:25:06 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id s30sm2577705lfb.90.2021.10.06.14.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 14:25:06 -0700 (PDT)
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
Message-ID: <35714b9d-d855-1ad3-241b-f97859f8c97b@gmail.com>
Date: Thu, 7 Oct 2021 00:25:05 +0300
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
>> I'm also wondering if we could add some 'was_enabled' flag to GENPDs,
>> setting it by genpd_suspend_noirq() for the enabled domains, and then
>> powering-on GENPDs from genpd_resume_noirq() only if they were in the
>> enabled state during genpd_suspend_noirq() time. It actually puzzled me
>> for a quite long time why GENPD core enables domains unconditionally
>> during early resume. This should solve a part of the problem and it
>> makes suspend/resume a bit safer because there is a smaller chance to
>> crash hardware during suspend, at least it's easier to debug.
> Just because the PM domain was already off at genpd_suspend_noirq(),
> doesn't mean that it can stay powered off at genpd_resume_noirq(). At
> least as is today.
> 
> The main reason why genpd_resume_noirq() powers on the PM domain, is
> because it's not possible for the consumer drivers to rely on runtime
> PM to do it (because runtime PM has been disabled by the PM core).

At least Tegra doesn't need to have domains force-resumed. This should
be a platform-specific behaviour. We may add a new flag for that, I
suppose. I'll try to keep this in mind for a future improvement. Thank
you for the clarification.
