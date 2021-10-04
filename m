Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A37E3FCC
	for <linux-staging@lists.linux.dev>; Mon,  4 Oct 2021 14:53:01 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id i24so23774818lfj.13
        for <linux-staging@lists.linux.dev>; Mon, 04 Oct 2021 07:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=e9mEC7vyz6aYS5ipxJsTFX2kQTkmdkM9KeZtG855BT0=;
        b=j0Ur3IU22Dtc5kFnP/nXkoktbxHcZFHOAKKskIoJgXkwGHYXbbkyALnAz04dfcCoVV
         0Mi+yf7x6bLdauQEAwTnqbWC6yASn3DvUmQzjLsswUxGTTKJ6s/CRmffsVicfj4H/JdQ
         c/LIIg0L7rv8lHs1sW2K5rZwgSx57ZXcHyto17YWq5qqGR+KdrUM8a/vBIQevrz7MKqt
         4+fAAMP0uH9K8IRIrKtcrYu5d1hJt2gQAndx84DW2UalqWNKhO6AnDeKmZJUWZRpcZPy
         CmjMAchXyeOg4QY//26g7aMb6W3U/7YeGFmXOquN7S/42F7Yuv5Wu7Qw7InfGjWugPr7
         q3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e9mEC7vyz6aYS5ipxJsTFX2kQTkmdkM9KeZtG855BT0=;
        b=JuhuKP67UoaMy6BTU+9DMe3YzJ5ySy35yz3TONWIe2aW+4tHLQQf1BoHfVMrZdrp+S
         vss3SIaHpibYNqKnygpNZBZYpflC+7aVWlVhPS6SjvUpVNh0FYoSS2G5/+Z4yeqSrE1f
         r2D31B4YI8nHvnz19CuJ0pXgGqbzJ/hIPVB2NHf4TJOAwxfol0O78Rfs2zz9DpkXChjV
         MVJl/WC+lTC/G71k0Vr9fF5Gm+vJuInhumt9MXmDHAUewKMjj67ztLV91lDAefJostp3
         j6Saz96xY8+kvTumkDRSF6hbZ22Lw0dfhIk68eKsSUJnxOJ0KzkRW4Mz28KYsejz4CqM
         6XCQ==
X-Gm-Message-State: AOAM531rL2gOOF9JVtdF8MhiB8z4cREnUZqDcWNyUKn9Qyou/JnELgBM
	7eh3dxuHZEJleInSkhGN5Ak=
X-Google-Smtp-Source: ABdhPJwZpF/pb309DarSmG6340t8JrbcT7IOPdU/tSH1oTe/CJm/C7yaYY6kTpK2zLUPD04MKNAKqg==
X-Received: by 2002:a2e:5450:: with SMTP id y16mr16673360ljd.21.1633359167035;
        Mon, 04 Oct 2021 07:52:47 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id o19sm1632148lfg.68.2021.10.04.07.52.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 07:52:46 -0700 (PDT)
Subject: Re: [PATCH v13 00/35] NVIDIA Tegra power management patches for 5.16
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-pwm@vger.kernel.org, linux-mmc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
References: <20210926224058.1252-1-digetx@gmail.com>
 <20211004091129.fhlfhsddzk5fakuj@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <80e0e5a9-7987-a334-7a2b-a7b09b591414@gmail.com>
Date: Mon, 4 Oct 2021 17:52:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20211004091129.fhlfhsddzk5fakuj@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

04.10.2021 12:11, Viresh Kumar пишет:
> On 27-09-21, 01:40, Dmitry Osipenko wrote:
>> This series adds runtime PM support to Tegra drivers and enables core
>> voltage scaling for Tegra20/30 SoCs, resolving overheating troubles.
>>
>> All patches in this series are interdependent and should go via Tegra tree.
> 
> So you don't need any OPP changes anymore ? I just came back from
> vacation, don't know what you guys discussed in between :)
> 

We discussed it and decided that we don't need more OPP/domain core
changes. It's already good enough for the starter and making it all
absolutely ideal doesn't worth the effort for now.
