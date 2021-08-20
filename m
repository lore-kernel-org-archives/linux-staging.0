Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2D272
	for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 02:51:38 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id o10so17254421lfr.11
        for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 19:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zboB1Q6i9oYgbkK+DWfMo5HokGy8eox3TcOGLTI8/TQ=;
        b=MSPObL9gtIfvXhGm8vmuM1WlsX8S9aqUcJKehk6hQXt2kTc0FpmAMpCNdosprR8DEi
         /yWFr3UlXiFd2ptrMNopWEd4mvb/K8eNekkIVvnlp6AKdEAvU+jGXH5uVDxvGcdGZoGg
         7d0zSU30Fr03L6Jyi08Us+ikNmam6soR3xc9TnEUbHxYKYK/+DxyeuIlb2H/R67utUeG
         f8Hx0eRqtRpuLlOkbbDR3VqVNtgKs+C8IJnFlLq0D7i7HgCycFYmI+7YKNlKYZOsIZqi
         M8cceb7ZJ2VG2spCfJmWhEcSNn6fxBgRnLJwFtl+p9dAcHXGqIRgt1IqsRHAMWfqn/Mz
         6mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zboB1Q6i9oYgbkK+DWfMo5HokGy8eox3TcOGLTI8/TQ=;
        b=Hc9keYIfu+l7X8MLQbPnPbGyCb1V9N5+15i0TsUjozLCMDwCtDsW80m//D9j3pwWCS
         D8Ma8JIC9IuhwvQhA/L2HasYPhCVPfBMjya8OAF1xnBIvMA+A+t4Hef/jTL0voSjLmKt
         nC9JfNe7x4djTf4ex0U9mnCK/1hw/lW3a1uziO7/lBuzM8Z4jR8FuOuQ1Sr/JWimxoI7
         BT0GkfYvkGl07EwEaL9vGWZ5lZKRzDcEXDzy9xpmJUKkDUAKv8LYm8y/KHeGOR3Mqbop
         0PbOXFiYAzF34elnC0GcEk4daYwe22HijQgpWLrgLOv0HbjpM6LoKSrLXpHucshy/fzZ
         bTOQ==
X-Gm-Message-State: AOAM532jJfXOcNZVBaaP1Njq+pOeRDj4ONOeCroqpOi178EdHVHyy2PU
	wCR9+kgNQJhgb7rf+i4Y60Y=
X-Google-Smtp-Source: ABdhPJxyaLUy3vFiucIY3S77FtdQqbUhTA2/WSHmXMHR7V1HqPjJvW4kwuD0WLGfg5N30COber68xA==
X-Received: by 2002:ac2:4c94:: with SMTP id d20mr12622519lfl.640.1629427896895;
        Thu, 19 Aug 2021 19:51:36 -0700 (PDT)
Received: from [192.168.2.145] (46-138-120-72.dynamic.spd-mgts.ru. [46.138.120.72])
        by smtp.googlemail.com with ESMTPSA id w9sm2965ljo.36.2021.08.19.19.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 19:51:36 -0700 (PDT)
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
Message-ID: <cad7c578-f533-12f8-3dc0-d2854344148c@gmail.com>
Date: Fri, 20 Aug 2021 05:51:35 +0300
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
>> The "device" representation is internal to the kernel. It's okay to me
>> to have PLLs represented by a device, it's a distinct h/w by itself.
>>
>> CCF supports managing of clock's RPM and it requires to have clock to be
>> backed by a device. That's what we are using here.
>>
>> Please see
>> https://elixir.bootlin.com/linux/v5.14-rc6/source/drivers/clk/clk.c#L109
> Looking at the implementation of __clk_register() and where that device
> pointer typically comes from, I don't think the way this is used here is
> what was intended. The way I interpret the code is that a clock is
> registered with a parent device (i.e. its provider) and
> clk_pm_runtime_get() is then used internally as a way to make sure that
> when a clock is prepared, it's parent device is runtime resumed. This is
> presumably to ensure that any registers that the driver might need to
> access in order to prepare and enable the clock are accessible (i.e. the
> CAR is not powered off or in reset).
> 
> So the struct device that is passed to __clk_register() (or its callers)
> should be that of the CAR rather than virtual struct devices created by
> the CAR.
> 
> And it's a bit debatable whether or not PLLs represent distinct
> hardware. Ultimately every transistor on a chip could be considered
> distinct hardware. But a platform device is a device on a platform bus,
> which is really just another way of saying it's a hardware block that's
> accessible from the CPU via a memory-mapped address. A PLL (just like
> other clocks) is merely a resource exposed by means of access to these
> registers. So I don't think they should be platform devices. Even making
> them struct device:s seems a bit of a stretch.
> 
> Is there any reason why struct clk can't be used for this? I mean, the
> whole purpose of that structure is to represent clocks. Why do we need
> to make them special?

Because we need to perform DVFS for PLLs. The only way to do it without
having to reinvent existing frameworks is to use these frameworks and
they require a device.
