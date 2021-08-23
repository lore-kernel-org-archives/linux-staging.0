Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B77E3FC0
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 18:54:45 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id z2so39980485lft.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 11:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LLLBnniN0Lx+Mumrz5skT0TPVp1ZGUNcrTmYMEWefMQ=;
        b=bRXypa0kMDufIBAltELnod4/f5LKxu08gHYATptf+EI6+VVuqGZtQc9IaQGjvFFCgq
         vbFbH2SdazqvcCAMYk3J4GuHj0e5I7zku8Oa9NfAxUikDOx7zn3pX1WDsTh6UdD8qIGa
         3eprpmmrxRJAoaM7Gu3ZdgZoGar9lSRCs5JDzMxdRNpVQ+gLcrYDdO8oxckRN909UcKX
         YtPVujPIzOZGW53g9o6QT7ES0CxEZ1zsz/t/TQNQmOc6LtFG124QbMp5K98LUEYst25J
         DiyXxjAzvYYQpznD15TTlrtQK87XzYXH/DXwNlvN8BApenm8QR23KvoRjr4Lypahasp2
         +t8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LLLBnniN0Lx+Mumrz5skT0TPVp1ZGUNcrTmYMEWefMQ=;
        b=qjnEAA6C2O9KQciHSTECuQVpwfn5NswdN10Fm+xfZ+rFCRqB19SqEEMyQyKj4LHo93
         tPyVGCPztNsPHwxePvv/QmV8HdqxrqU3FvD4gSQtKPWUpxlAKmDwfXlRdc/V/6f0D1JD
         fIOrJKzAaeRuC11+I3D0FkZ/SZWGz5cvz4YxEIC8tAxpggL6uzMJquyZkY+/ZYiv3ovx
         QMhqQww34jI7SO8fCkd3VXHWNIo76aIXBoi3r2lDUgPzUti9B71oUz+pOvVEI0kkL4fm
         FJCXEC+TDQ271UNusdDdeWUlSZSWs8uaCQ+QCmUIIaTYtHokKqKR01Uv6TbTSa56bt0Z
         MSkA==
X-Gm-Message-State: AOAM530m2WFOpXMiki4dScQmpl8EWsGZdISaV85+YbEcHcaRC/J8htHx
	3EEcL7kg1AuFi+/XLb5gC2c=
X-Google-Smtp-Source: ABdhPJzROMmO2gjb4vwtC02vW+yxH5GZycPshNAf3U2uJx1Cn7HyzCyTxuzs4nwkiF2FdwTHg0lTpw==
X-Received: by 2002:a05:6512:3d22:: with SMTP id d34mr26136115lfv.326.1629744883418;
        Mon, 23 Aug 2021 11:54:43 -0700 (PDT)
Received: from [192.168.2.145] (46-138-120-72.dynamic.spd-mgts.ru. [46.138.120.72])
        by smtp.googlemail.com with ESMTPSA id u18sm1664954lfo.280.2021.08.23.11.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 11:54:42 -0700 (PDT)
Subject: Re: [PATCH v8 07/34] clk: tegra: Support runtime PM and power domain
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 Linux USB List <linux-usb@vger.kernel.org>, linux-staging@lists.linux.dev,
 linux-spi@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
References: <20210817012754.8710-8-digetx@gmail.com>
 <YR0UBi/ejy+oF4Hm@orome.fritz.box>
 <da7356cb-05ee-ba84-8a7c-6e69d853a805@gmail.com>
 <YR04YHGEluqLIZeo@orome.fritz.box>
 <ad99db08-4696-1636-5829-5260f93dc681@gmail.com>
 <YR6Mvips3HAntDy0@orome.fritz.box>
 <e17bbe8d-7c0f-fc3d-03c7-d75c54c24a43@gmail.com>
 <YR+VDZzTihmpENp6@orome.fritz.box>
 <CAPDyKFpJ+TK0w1GZEA7G=rtAjq5ipmVR4P0wy7uHiEGVWRk5yA@mail.gmail.com>
 <89ea1694-be9e-7654-abeb-22de0ca5255a@gmail.com>
 <YSOxnqiia+FqfOX6@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <acd25387-3d2b-460d-3280-eedd064b174b@gmail.com>
Date: Mon, 23 Aug 2021 21:54:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YSOxnqiia+FqfOX6@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

23.08.2021 17:33, Thierry Reding пишет:
> On Sat, Aug 21, 2021 at 08:45:54PM +0300, Dmitry Osipenko wrote:
>> 20.08.2021 16:08, Ulf Hansson пишет:
>> ...
>>>> I suppose if there's really no good way of doing this other than
>>>> providing a struct device, then so be it. I think the cleaned up sysfs
>>>> shown in the summary above looks much better than what the original
>>>> would've looked like.
>>>>
>>>> Perhaps an additional tweak to that would be to not create platform
>>>> devices. Instead, just create struct device. Those really have
>>>> everything you need (.of_node, and can be used with RPM and GENPD). As I
>>>> mentioned earlier, platform device implies a CPU-memory-mapped bus,
>>>> which this clearly isn't. It's kind of a separate "bus" if you want, so
>>>> just using struct device directly seems more appropriate.
>>>
>>> Just a heads up. If you don't use a platform device or have a driver
>>> associated with it for probing, you need to manage the attachment to
>>> genpd yourself. That means calling one of the dev_pm_domain_attach*()
>>> APIs, but that's perfectly fine, ofcourse.
>>>
>>>>
>>>> We did something similar for XUSB pads, see drivers/phy/tegra/xusb.[ch]
>>>> for an example of how that was done. I think you can do something
>>>> similar here.
>>
>> We need a platform device because we have a platform device driver that
>> must be bound to the device, otherwise PMC driver state won't be synced
>> since it it's synced after all drivers of devices that reference PMC
>> node in DT are probed.
> 
> I think the causality is the wrong way around. It's more likely that you
> added the platform driver because you have a platform device that you
> want to bind against.
> 
> You can have drivers bind to other types of devices, although it's a bit
> more work than abusing platform devices for it.
> 
> There's the "auxiliary" bus that seems like it would be a somewhat
> better fit (see Documentation/driver-api/auxiliary_bus.rst), though it
> doesn't look like this fits the purpose exactly. I think a custom bus
> (or perhaps something that could be deployed more broadly across CCF)
> would be more appropriate.
> 
> Looking around, it seems like clk/imx and clk/samsung abuse the platform
> bus in a similar way, so they would benefit from a "clk" bus as well.

It may be nice to have a dedicated clk bus, but this is too much effort
for nearly nothing in our case. It shouldn't be a problem to convert
drivers to use clk bus once it will be implemented. It shouldn't be a
part of this series, IMO.
