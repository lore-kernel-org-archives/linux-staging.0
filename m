Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3D172
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 01:44:33 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id q21so2057445ljj.6
        for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 18:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XoDVcVB/VE1dBlO9x4lpVsT9geXPOq4o0WU/0sRPebc=;
        b=Gmnqy4jfwBqsDu9LBGxLpx1nvtIhZFSGaBcJVbAwo50K4s+mgQjS0okbtwsUutyxB8
         crURnbnyrk/mMjC5uyqR+Vc4wyXpn+d+boHXA+Xp1BhvXFshKYhg804UtoJM30j71C4u
         J2Oi65VGe0ZWSvpPAE+ZMPCxHmZODECsKuoOcPsZnVV2NTW6mY508lzEbTu7b+WV31F0
         mOmEp6hyujXqYoE04beg1akt/TvZfGMnEmyffvJhfR2jN5IueeSUVfQm+Kv43WgZBbPE
         A1/FPF7q3EFR+MQEP/OCrx/s1N0zxIrfUMfTscncRBAeQA/ySJ/MFa/6tQu2m5wzNNQY
         1kEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XoDVcVB/VE1dBlO9x4lpVsT9geXPOq4o0WU/0sRPebc=;
        b=sF/R2aQQVjjSV3d8Q4Lg3E4BHpWuOEVaZSVJnqJ76P6y3Mw0uUI7SdRy0oXXDDMXrc
         cTVDRxIYI9/1zUHlstowQh/2IvJuu9m4V3NzddsEHlnPtk0x+JZVF570XnO2PyTKM9tB
         ZiLY7KbmSkMAXfgp7PXuNcV33+Lb5RTcO+m/L4XAEGj9NWcCQgBOwB9s29Ak90mwPiHr
         QK741L1fKkDTpQxha9MQnMR/e5jHivF+UVJZCdVqcg2iOk5WeRz3f5MPUsf6F5JddLh0
         2fQK6DReYPoInq0uiZv84/KU4ZSErvdRf4v0iAxdVO4Qxc+httQ6Xaw6fO0rQzofT71h
         PbfQ==
X-Gm-Message-State: AOAM532yrFwzgOLslROEyezKcKWvR1eZqOKkojYkWdAa4r9ESYAI3Xfn
	o4+8yxkkbeCyo0jrMJe9NkQ=
X-Google-Smtp-Source: ABdhPJzBCF6cJbZHRHPrIUVUUUZ+kASYBl6l8+zSZcW0/IKHSG28sW6dmnWvQHlNaXqEE5KMF+anLw==
X-Received: by 2002:a2e:5307:: with SMTP id h7mr5878272ljb.154.1629251072136;
        Tue, 17 Aug 2021 18:44:32 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru. [46.138.85.91])
        by smtp.googlemail.com with ESMTPSA id y14sm288752ljm.39.2021.08.17.18.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Aug 2021 18:44:31 -0700 (PDT)
Subject: Re: [PATCH v8 06/34] dt-bindings: clock: tegra-car: Document new
 tegra-clocks sub-node
To: Rob Herring <robh@kernel.org>
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
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-spi@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-7-digetx@gmail.com>
 <YRxfGtWPXeSQXuHo@robh.at.kernel.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <06128217-92e1-9b66-64ea-91855d041121@gmail.com>
Date: Wed, 18 Aug 2021 04:44:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YRxfGtWPXeSQXuHo@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

18.08.2021 04:15, Rob Herring пишет:
>> +  tegra-clocks:
>> +    description: child nodes are the output clocks from the CAR
>> +    type: object
>> +
>> +    patternProperties:
>> +      "^[a-z]+[0-9]+$":
>> +        type: object
>> +        properties:
>> +          compatible:
>> +            allOf:
>> +              - items:
>> +                  - enum:
>> +                      - nvidia,tegra20-sclk
>> +                      - nvidia,tegra30-sclk
>> +                      - nvidia,tegra30-pllc
>> +                      - nvidia,tegra30-plle
>> +                      - nvidia,tegra30-pllm
>> +              - const: nvidia,tegra-clock
> You are saying the first string must be both one of the enums and 
> 'nvidia,tegra-clock'. You don't get an error because your pattern 
> doesn't match 'sclk'.
> 

Could you please rephrase or clarify? If pattern doesn't match 'sclk',
then it must match any other enum. I'm not sure what you're meaning.

The 'nvidia,tegra-clock' actually could be removed since it's
superfluous now. I'll consider the removal in v9.
