Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90332C83
	for <linux-staging@lists.linux.dev>; Wed,  6 Oct 2021 22:01:40 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id t9so16006437lfd.1
        for <linux-staging@lists.linux.dev>; Wed, 06 Oct 2021 15:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5TkNSTf/crsCY8tpMwpTN8iKpqaO2VZ0TUZ85nuR8Fk=;
        b=ld5Z6/7VEZW1BNCnvycjhHvK6IpV0YjfrLQjNBsO96QPqcR78gynbACaP4b3v+AV2G
         ZoLwNcAHlL2lP1hD9XCyVo+HgjPKPyrFXBaaLRdePQndwZ2K8agaqTWuCCYNZ53P/CNY
         ndTDCsBZctybMCs+VHRuCY14W46EZ5RAMeLixCUb6TGaPc9fma/U/9YYLssXSscrYxM9
         FyyRAIS/qrTJPcPMOSxO40MUN/i0dnOaagBNSyj96E2Vo5dzjlz91/J5jaxfdcEJx+Mt
         foowTm+Ou9IP4TQJDKqV/EFyi29YReHhq/PHOGOcTavuUkNccklIFzUOTrq/MYShVPId
         bghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5TkNSTf/crsCY8tpMwpTN8iKpqaO2VZ0TUZ85nuR8Fk=;
        b=SQoXsAJP2c3XL3dDT3jmtJ8bYg4pzFInp/l2JVtzANPRtqMvB9MUu/kXhdE+XmHb1V
         LNzsWz5TXmm6yWawfXRBAluW7y8ezUMibPP1kmj76BibvnIW3u+8KzFZkXjapCTr8Xoi
         RAd8gFexILBYntf2cY2Miy1HBdY0/iI2qQ1G0d7P5c1NoRpIIhPfklj0cjG1fLrS6zIT
         7tfoGYtVZ6bPQBOeqKuiJ4UapYpKzVEqSaTbmjlP3GYnB2c1d6mXdYWr75sIycI7Q+EZ
         TPqCE99LVKbx9bWFi2Dzz58rNZjz5ATZKgqeWZ4ygRdQPkuvOP0KsW0IRIOjmZCJ6Bu+
         XOuw==
X-Gm-Message-State: AOAM532RTVicG9aHKzUiQm3mKkPuSFTXG9dK4b6ezl+Uk/u5Ps0cbx1v
	Efs7CuRyn/dVitiuM9b0M1k=
X-Google-Smtp-Source: ABdhPJxJIJFwKX68ZSmnYzC0Awokki/S6kJnq8tWjdId3tkzC1pWGuNVGI8Q0oyk0uiEmZtVw1aP/w==
X-Received: by 2002:ac2:44a2:: with SMTP id c2mr507644lfm.452.1633557698995;
        Wed, 06 Oct 2021 15:01:38 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id s17sm1505472lfe.10.2021.10.06.15.01.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 15:01:38 -0700 (PDT)
Subject: Re: [PATCH v13 06/35] clk: tegra: Support runtime PM and power domain
From: Dmitry Osipenko <digetx@gmail.com>
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
 <74a47158-e2e4-5fd0-3f37-0b50d4ead4d9@gmail.com>
 <CAPDyKFr2-f1wM+6jF9vWJ-Nq80Zg1Z3qFP6saULOrBi1270HGw@mail.gmail.com>
 <b06bf794-b8b3-417b-58ef-4d815ca86c95@gmail.com>
Message-ID: <4c7b1a4c-c136-3650-8f77-9f98caa506f7@gmail.com>
Date: Thu, 7 Oct 2021 01:01:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <b06bf794-b8b3-417b-58ef-4d815ca86c95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

07.10.2021 00:14, Dmitry Osipenko пишет:
> 06.10.2021 15:43, Ulf Hansson пишет:
>> On Wed, 6 Oct 2021 at 00:43, Dmitry Osipenko <digetx@gmail.com> wrote:
>>>
>>> 06.10.2021 01:19, Dmitry Osipenko пишет:
>>> ...
>>>> I reproduced the OFF problem by removing the clk prepare/unprepare from
>>>> the suspend/resume of the clk driver and making some extra changes to
>>>> clock tree topology and etc to trigger the problem on Nexus 7.
>>>>
>>>> tegra-pmc 7000e400.pmc: failed to turn off PM domain heg: -13
>>>>
>>>> It happens from genpd_suspend_noirq() -> tegra_genpd_power_off() -> clk
>>>> -> GENPD -> I2C -> runtime-pm.
>>>>
>>>> -13 is EACCES, it comes from the runtime PM of I2C device. RPM is
>>>> prohibited/disabled during late (NOIRQ) suspend by the drivers core.
>>>
>>> My bad, I double-checked and it's not I2C RPM that is failing now, but
>>> the clock's RPM [1], which is also unavailable during NOIRQ.
>>
>> Yes, that sounds reasonable.
>>
>> You would then need a similar patch for the tegra clock driver as I
>> suggested for tegra I2C driver. That should solve the problem, I
>> think.
>>
>>>
>>> [1]
>>> https://elixir.free-electrons.com/linux/v5.15-rc4/source/drivers/clk/clk.c#L116
>>>
>>> Previously it was I2C RPM that was failing in a similar way, but code
>>> changed a tad since that time.
>>
>> Alright. In any case, as long as the devices gets suspended in the
>> correct order, I think it should be fine to cook a patch along the
>> lines of what I suggest for the I2C driver as well.
>>
>> It should work, I think. Although, maybe you want to avoid runtime
>> resuming the I2C device, unless it's the device belonging to the PMIC
>> interface, if there is a way to distinguish that for the driver.
> 
> Ulf, thank you very much for the suggestions! I was thinking about this
> all once again and concluded that the simplest variant will be to just
> remove the suspend ops from the clk driver since neither of PLLs require
> high voltage. We now have voltage bumped to a nominal level during
> suspend by Tegra's regulator-coupler driver and it's much higher than
> voltage needed by PLLs. So the problem I was trying to work around
> doesn't really exist anymore.

I hurried a bit with the conclusion, keep forgetting that I need to
change the clock tree in order to test it all properly :/ It's not fixed
yet.
