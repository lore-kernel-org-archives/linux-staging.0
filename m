Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3208D2F80
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 04:37:50 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id h9so2630355ljq.8
        for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 21:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=S4mf5vN/pcvdDF2PDP6Ptfzme/x90AlzqPWZLad8qYk=;
        b=YypYPePkPS0/5iONL6py8zYup5OlWdAHOzXwUxSzXCTttHeiyHI1wBwOMxdh2YLTML
         GUG8WKu/wZ5FCfyCJkx9ssRzVLntih0+ubH+uDS+zmF3bxOqd2tl/449gf1xUqAVXItO
         LqiecgJsCsgvauiiDdsEehmvy0IU9XdA8B4yG8nhfmpfcFmWhN5Jun7BhL8RSDevKzhD
         5m92TbfweR+jl3jR2rl2muugEzylfS+HI0GxLknGIK7R/Man0BfWVmBpB4t+5yrdD4Ss
         yfjwL+HUMAT1ajkSz1UUq6oqw5ejKgNP+90FXVrdigsXBfoBVVWYufOaoxLArk4ZGnuj
         JnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=S4mf5vN/pcvdDF2PDP6Ptfzme/x90AlzqPWZLad8qYk=;
        b=h0eeM7rahQQPYbLnZkeW1FzDzoIOQxh5O1IEJK956rCtSQ5XUrP4ABU6aTIP9srJLR
         sT4NH4gVtL7Nm1l+63H6mKxC78eLGQca7YpE0urEMWOm+ou2vsuEDwUbc2FbDLTklQ1E
         GA3y1uYG9ZYHr+J+Lt+8uPWYPcLAsJl7B0jVKu/DvyMdz4TpFqe+h00lNgiYRmcKAbnr
         2TUkJYSK8ks3HPeGgo72myKrWmZefaVtFBJE9/LmEdUXNUkawBLzgfSzvRJjHTWBdMKa
         SbKy+KnjCusubcwDaYRCp8BTLY/sfkiOQa2mYYQaCtru6fnSfCBpcvm2tibpHk/WjMEW
         wvhg==
X-Gm-Message-State: AOAM532fbp25LpsN+H47biTbQnnrk0LaIkQhuyUuYybFzuMI8V2TMKTH
	XSI0Rb0hHNpSvIXEjavwNso=
X-Google-Smtp-Source: ABdhPJyVioyoewr8IK0TXDc8qP95URDUgfYjdExTYurgnMDYKEK8I1b+Ft9rT09ZtYUxKjozPrkphA==
X-Received: by 2002:a05:651c:32f:: with SMTP id b15mr5355209ljp.322.1629261468379;
        Tue, 17 Aug 2021 21:37:48 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru. [46.138.85.91])
        by smtp.googlemail.com with ESMTPSA id s27sm379103lfs.279.2021.08.17.21.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Aug 2021 21:37:47 -0700 (PDT)
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
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
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-2-digetx@gmail.com>
 <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7>
 <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
 <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
 <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
 <20210818043131.7klajx6drvvkftoc@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
Date: Wed, 18 Aug 2021 07:37:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210818043131.7klajx6drvvkftoc@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

18.08.2021 07:31, Viresh Kumar пишет:
> On 18-08-21, 07:12, Dmitry Osipenko wrote:
>> 18.08.2021 06:55, Viresh Kumar пишет:
>>> On 17-08-21, 18:49, Dmitry Osipenko wrote:
>>>> 17.08.2021 10:55, Viresh Kumar пишет:
>>>> ...
>>>>>> +int dev_pm_opp_sync(struct device *dev)
>>>>>> +{
>>>>>> +	struct opp_table *opp_table;
>>>>>> +	struct dev_pm_opp *opp;
>>>>>> +	int ret = 0;
>>>>>> +
>>>>>> +	/* Device may not have OPP table */
>>>>>> +	opp_table = _find_opp_table(dev);
>>>>>> +	if (IS_ERR(opp_table))
>>>>>> +		return 0;
>>>>>> +
>>>>>> +	if (!_get_opp_count(opp_table))
>>>>>> +		goto put_table;
>>>>>> +
>>>>>> +	opp = _find_current_opp(dev, opp_table);
>>>>>> +	ret = _set_opp(dev, opp_table, opp, opp->rate);
>>>>>
>>>>> And I am not sure how this will end up working, since new OPP will be
>>>>> equal to old one. Since I see you call this from resume() at many
>>>>> places.
>>>>
>>>> Initially OPP table is "uninitialized" and opp_table->enabled=false,
>>>> hence the first sync always works even if OPP is equal to old one. Once
>>>> OPP has been synced, all further syncs are NO-OPs, hence it doesn't
>>>> matter how many times syncing is called.
>>>>
>>>> https://elixir.bootlin.com/linux/v5.14-rc6/source/drivers/opp/core.c#L1012
>>>
>>> Right, but how will this work from Resume ? Won't that be a no-op ?
>>
>> The first resume initializes the OPP state on sync, all further syncs on
>> resume are no-ops.
> 
> But the OPPs should already be initialized as someone must have called
> opp-set-rate earlier ? Why do this from resume and not probe ?

This will set voltage level without having an actively used hardware.
Take a 3d driver for example, if you set the rate on probe and
rpm-resume will never be called, then the voltage will be set high,
while hardware is kept suspended if userspace will never wake it up by
executing a 3d job.
