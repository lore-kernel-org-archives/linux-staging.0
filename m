Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA89A3FC4
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 22:20:36 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id i9so16070418lfg.10
        for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 15:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cSioMNug0d6kxUexh1FC9hTGrtcP9xpdjQR0XQQ6CYo=;
        b=J3VpzNeE7GqDLaNcadrCTNd6cyZfYXW7ces/SuDyrw1d/28XcNn6N+DzEWmGnDD/tQ
         SoLjonmdEv+K67l7YB0f4xQ305y80qihUAThFt01+KBxrDINvGkhPcmCvtlU5sHPBDbx
         M71O17tNhqPr+OmAN9VOz+4Q7pIBIEyoj6SH0ySrJLRtzsTWwdbnVhskZKjVbRPHRaWm
         +GaOVUAE0cvv6+nA+ln7XoB+9psFnKu9U3jrYuDGEC/pYeGQBmT2Xm3y538F/wiQgagE
         srBA+yPJ+iPcl2RL23Y4diEfalcBHPDOPAb4qZl7q12ixhhyPtL63uHAQVl2E6t4EK21
         t4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cSioMNug0d6kxUexh1FC9hTGrtcP9xpdjQR0XQQ6CYo=;
        b=C/DmunN7+dVhnGJRBLczP8ED0stk0rOOuYe2sL4xizRjXB30/dKfvKen1EPiRlTwXb
         pRcVbpxQAxERK1fxBiE8sBbb+mR3l5dfXeoV4OhqHSe+P+NDPfJcCD1ulPKq4bYIsnsz
         2M1aNyM+f8QY0zoFgdYFrp0Y7HxHaLa0+JmalbZHWpC3MwKZ2cBLBcmRoUSHM0em64yp
         jFETI9sJ+8KFoRWuOd3mCmt2iNWmVjzp2lmHiartiEA9NcBcbBPNyO4yU9cIVffPgPtx
         n+ipXfyGXmf/uhMRJZrAsXZTBLjPbhffecWVv5ZIOJuICHtQs84sgEMvUN5J2C6hZLLr
         NCIg==
X-Gm-Message-State: AOAM531BqOxnVuvdp5PzuCs0ux7C179FCJx6IyNsCgJB8kYfNNWnUxhQ
	BWLzlz4cgEvWov8C0wYsavA=
X-Google-Smtp-Source: ABdhPJxJWs7Kxo/s8N+hb+4RWNHipznlH5BHUAb+HUpiZwCTMet2wXRVLZZrxtwaXHrGmtOIkJjuVA==
X-Received: by 2002:a05:6512:38a1:: with SMTP id o1mr11689501lft.606.1629411634907;
        Thu, 19 Aug 2021 15:20:34 -0700 (PDT)
Received: from [192.168.2.145] (46-138-120-72.dynamic.spd-mgts.ru. [46.138.120.72])
        by smtp.googlemail.com with ESMTPSA id w14sm433095lfk.161.2021.08.19.15.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 15:20:34 -0700 (PDT)
Subject: Re: [PATCH v8 06/34] dt-bindings: clock: tegra-car: Document new
 tegra-clocks sub-node
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-spi@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-7-digetx@gmail.com> <YR0SSz7KMh7TwaFW@orome.fritz.box>
 <eff5ef47-e6e0-3e03-cf1a-d931b0f2dc2a@gmail.com>
 <YR033zuYWWLCeYpM@orome.fritz.box>
 <a5b942cb-1611-9ae1-6e89-4b68fdaf03e3@gmail.com>
 <YR6HWMuYcF6NIepi@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <43f0c69a-c62d-5d36-ac59-8ce7513e9496@gmail.com>
Date: Fri, 20 Aug 2021 01:20:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YR6HWMuYcF6NIepi@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

19.08.2021 19:31, Thierry Reding пишет:
>>>>> Also, I don't think the tegra- prefix is necessary here. The parent node
>>>>> is already identified as Tegra via the compatible string.
>>>>>
>>>>> In the case of CAR, I'd imagine something like:
>>>>>
>>>>> 	clocks {
>>>>> 		sclk {
>>>>> 			operating-points-v2 = <&opp_table>;
>>>>> 			power-domains = <&domain>;
>>>>> 		};
>>>>> 	};
>>>>>
>>>>> Now you've only got the bare minimum in here that you actually add. All
>>>>> the other data that you used to have is simply derived from the parent.
>>>> 'clocks' is already a generic keyword in DT. It's probably not okay to
>>>> redefine it.
>>> "clocks" is not a generic keyword. It's the name of a property and given
>>> that we're talking about the clock provider here, it doesn't need a
>>> clocks property of its own, so it should be fine to use that for the
>>> node.
>> I'm curious what Rob thinks about it. Rob, does this sound okay to you?
> Another alternative would be to omit that level altogether and just make
> sclk and siblings direct children of the CAR node.

That can be done.
