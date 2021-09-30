Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADEE72
	for <linux-staging@lists.linux.dev>; Thu, 30 Sep 2021 00:40:03 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id j5so13162611lfg.8
        for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 17:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xEzZC82rqk2En9Ed7KsQn1FTg8FAxs/dG3UWgw54VAY=;
        b=O8dP8YX3oMg9WnbDyZu1hmO2h68+60K+lapykwVro5Dm9ppn/F9/NcbISMG5UgjbC1
         Gl65W0faHrgnuG4Ivm1ZPA//iIglFIfYes3pHap406XwsMqh6ze54KPK6G1G3O5UlV3H
         OpAwEnFC47Abzp/TQ4SNOauFELwfHEFZLL20Xt+YDmW+i0BdpaHAE8kOe1R0ZwvSJ88R
         vse5HwrZKesjEBIM+g1FgoFyiPN/TBhtT+YBZZx+rRc0POYrOrKJZ64TomxVC2KqUNKa
         /E+/csDF4DZh2HAhhjUkvllNeyvgxTMBlt9VzUAWKm/iPV4qw7A2k9Nqntk6VvZaM2tE
         WgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xEzZC82rqk2En9Ed7KsQn1FTg8FAxs/dG3UWgw54VAY=;
        b=Gyh/oaVWeW4ubvT9t9x1T/Eq9pCgegep0eiyHbBdx0B1PCS3/SoR2WktOqq1Tv3Xvf
         CTGf2ONkYgFY5AclatIqG1l/Ok2s8I1fCXcigPQBsHZvyMzuof1CCDdcoRFW4coUt6UE
         vhDvZUlkvPMF8MM93hx4soJ9FDTbWISn3rGbcrf9nrdQ5FvNYltG40rY+t3zLFBJsgke
         Wi0HDvcLTgVgpc1CHH9ixSH5VDW6ttxWfAzhzjrtApFuKvVPtD5pByaT5Tu0Zq38oGBq
         8sLaGEoYFmM1LNtQvlXR/VjkMgTAs7iyZg9O428nerXRLb3Ja+sAsLm09r1bV+hZGIf6
         WATQ==
X-Gm-Message-State: AOAM532h6NzW/MieYcjUuBIedl1RmBUrhlvUqRcQnT9BYL4LrbnuseVQ
	y17FYoAwNUb1raBjkW6apNY=
X-Google-Smtp-Source: ABdhPJwR5F7TvblD+2tTvq+HxgGw1yddafN9WyTWe+FiqhsLFgixz8gInIIfk3R5GKlFeUDsI4kXHw==
X-Received: by 2002:a05:651c:150a:: with SMTP id e10mr2955411ljf.287.1632962401591;
        Wed, 29 Sep 2021 17:40:01 -0700 (PDT)
Received: from [192.168.2.145] (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.googlemail.com with ESMTPSA id l23sm163024ljg.99.2021.09.29.17.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 17:40:01 -0700 (PDT)
Subject: Re: [PATCH v13 16/35] usb: chipidea: tegra: Add runtime PM and OPP
 support
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Peter Chen <peter.chen@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20210926224058.1252-1-digetx@gmail.com>
 <20210926224058.1252-17-digetx@gmail.com>
Message-ID: <e8f778b0-816f-3273-2c46-5d2460545610@gmail.com>
Date: Thu, 30 Sep 2021 03:40:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210926224058.1252-17-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

27.09.2021 01:40, Dmitry Osipenko пишет:
> The Tegra USB controller belongs to the core power domain and we're going
> to enable GENPD support for the core domain. Now USB controller must be
> resumed using runtime PM API in order to initialize the USB power state.
> We already support runtime PM for the CI device, but CI's PM is separated
> from the RPM managed by tegra-usb driver. Add runtime PM and OPP support
> to the driver.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_tegra.c | 53 ++++++++++++++++++++++++----
>  1 file changed, 46 insertions(+), 7 deletions(-)

Peter Chen, could you please ack this patch? Thanks in advance!
