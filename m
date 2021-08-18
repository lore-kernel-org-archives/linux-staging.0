Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5D92FAF
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 17:24:05 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id x27so6198343lfu.5
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 10:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GAv6SuF4eSj8Jq3W6VuB4wY+Y7DhAYK2C8cvnt48BwA=;
        b=OfKnmZ3T9Qb8HI5W7GPWXDlieZS0O8KzL+vFnG3wV003wkNIM7zLIcbMPaZV9yYF1Y
         cMOjm0MheLL2CRrIs8DC2K9N1eVCWCaDsVSSikNKN2DkxTSyD7OhYYBAImKT9/HMCkap
         Gr9Y+wK7NSOmC8NjxIznaaozosxtoumPvLwtjwYFV2WhONfGechAcboi0jMsRkdmWexs
         dJkGtU3UNsZlMMt0vkVQBATO80wkY01UPa7V13WGnrzYHtoeNT3GK6eR7oqd5xSSYvpt
         UbvMRFNwmdAjvxcYwYj5Bn415TPmyl/Gw0zEoqGhTt7a1uBUd5w/QJWfR+p+qExVRY3y
         fwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GAv6SuF4eSj8Jq3W6VuB4wY+Y7DhAYK2C8cvnt48BwA=;
        b=iA91Y6FvFlMVncuuDfFF9zqk/cWskgahC9J5ZQs7cWU7Z8xMVrlntQoa60p3Lp5aJ0
         fV7ClhekSFGw2iqNRpSeMBcBi0BZ+2ikEaIUo1B8Nl9BjnGY5poNRCpX6kX9twmitVIs
         huvz7R1FHOOc5zWnyOIhMDbjgnZ/BSK1YuIrMB+Oe7Fz/IbMuzZulWSvMhVoGpn0K1zW
         sfMQYacoGJ/jTik7A2o1ry2+vQSoPgd+LVCmSMWWn13jQMAEEh4F8ssIiekJRxTOBFnP
         v3skVZANkg8e9zd6D9ceLFgsxs+sGiPd6u7bI4+rkZyiP5W5/mhH+LEguj3sEW6T/9VY
         8h0w==
X-Gm-Message-State: AOAM530sc5vEfy6+cr2oo0pkYT32xUvwpLuBizM0qXFdBPHw0Sk/SxbR
	3L4AH2tWFfvV/69O8kiWuMo=
X-Google-Smtp-Source: ABdhPJz2totLY2glZaQrN56jcVR6UJ865rvHiBaSqRD7LPq8+CU52UR+LaQb1/rmqGyWq/hbRnECbg==
X-Received: by 2002:a05:6512:21d1:: with SMTP id d17mr7501000lft.588.1629307443410;
        Wed, 18 Aug 2021 10:24:03 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru. [46.138.85.91])
        by smtp.googlemail.com with ESMTPSA id 3sm47300ljq.136.2021.08.18.10.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 10:24:03 -0700 (PDT)
Subject: Re: [PATCH v8 11/34] gpu: host1x: Add runtime PM and OPP support
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Viresh Kumar
 <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Peter Chen <peter.chen@kernel.org>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
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
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-12-digetx@gmail.com>
 <CAPDyKFrax-EYtO03W5QWM2tcWLWeMM8hHZCRYFcsenuiP2zObQ@mail.gmail.com>
 <YRvBkyfFCqthBIBV@orome.fritz.box>
 <CAPDyKFp+9Bv3EVSnV683ixNXzukJtmG_QrS5C1ZQqLxv9QJ-bQ@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e2ab73d3-c543-5c5d-5b51-6ff42446907c@gmail.com>
Date: Wed, 18 Aug 2021 20:24:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAPDyKFp+9Bv3EVSnV683ixNXzukJtmG_QrS5C1ZQqLxv9QJ-bQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

18.08.2021 11:35, Ulf Hansson пишет:
> Thanks for clarifying! As I said, feel free to ignore my comments then.
> 
> For this and the other patches in the series, I assume you only need
> to care about whether the driver is a cross SoC driver and used on
> other platforms than Tegra then.

Yes, and all drivers touched by this series are Tegra-only drivers.
