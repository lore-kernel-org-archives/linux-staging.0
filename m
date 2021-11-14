Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325C372
	for <linux-staging@lists.linux.dev>; Sun, 14 Nov 2021 22:34:21 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id l22so38279178lfg.7
        for <linux-staging@lists.linux.dev>; Sun, 14 Nov 2021 14:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p+aN2Fw/pl9sOfjBfLZbMXZ2NVqQ0RZKH9knWs/miVs=;
        b=l55D4wFasj6Crr+0ib/nhlP3nTxm0LEBZCljqCdzXY6kmqhI0yBTEwP+7/EoEHA6KB
         Avm0kmrzMJce7c2z6BCuO07OTjE/mA6eN0YbjbTsu+6QKh3sRhGt0Vc0eNs3bKsJiAUt
         Pu5rs7226aJjzC2ZNo7ZaYrelcY6659c7wt15xMIwbolyMAop3oXLLr3XAuZZGiqdNfu
         LDoLMRUuOCKfcnTg5f+tz2wMQhnMkVhtuAGZmXMy3o3vv3Sfj9X+LKLRkFn4M1DuHg0a
         6GYL3WMlFY9Elnq8TiBBUT8d4069/LFBRiv/atT+atrFsaEdY22JPFZnOH5jdQ53Vyqk
         zbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p+aN2Fw/pl9sOfjBfLZbMXZ2NVqQ0RZKH9knWs/miVs=;
        b=Q3eNihdRAzsxEmlGSSPLMakeR7elARZGGbkNQuzPNuQC/eISy4vDl8HhxQwRBXgoxB
         vPX6Czyr4vXmPHKCZUtmqf0dLjbX17KKcXIgkkhcSVi56SuFWylAdRGoJcDZ0+I9o7KA
         jnuE2qzTVwUczLnzBuWT7vH6I7QeYsPQ6Ul3ZWitUj3T8eQfAWFKOg9ZuMzdG677luZY
         O4GF6VHW8qEOTxCiwnTyIQNgY6xufPo8iSXwPUOIkQdYN4Jq/XPSRfYhnwjw5v2OLjRg
         08zZddA2tVjx4gLC+53ENnaNbg8W2e2EN3uwVe2o0gqG3HUKCTSgmF5JpGD3aZlKtaYI
         oHNQ==
X-Gm-Message-State: AOAM530WxHdX/5SkmrT8NcNqJoLeDIQdoCu25zxp3MvxduRadLw/HizO
	54ZZv3SIAwB05R/fJt5NFRY=
X-Google-Smtp-Source: ABdhPJx0Fia6fhfP5IM0wKyq+kUl/IAPLqCO8a5Ry8I/ZbsJ6BeZhkgM6kr70/4ASveBq0YiT9LQUw==
X-Received: by 2002:a05:6512:74e:: with SMTP id c14mr29984746lfs.162.1636929259383;
        Sun, 14 Nov 2021 14:34:19 -0800 (PST)
Received: from [192.168.2.145] (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.googlemail.com with ESMTPSA id f17sm1203461lfk.145.2021.11.14.14.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Nov 2021 14:34:19 -0800 (PST)
Subject: Re: [PATCH v1 1/3] media: staging: tegra-vde: Support reference
 picture marking
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anton Bambura <jenneron@protonmail.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211114222353.22435-1-digetx@gmail.com>
 <20211114222353.22435-2-digetx@gmail.com>
Message-ID: <42b24cd0-ac37-3cfe-1fb2-d6292015318a@gmail.com>
Date: Mon, 15 Nov 2021 01:34:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20211114222353.22435-2-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

15.11.2021 01:23, Dmitry Osipenko пишет:
> +	vde->secure_bo = tegra_vde_alloc_bo(vde, DMA_FROM_DEVICE, 4096);
> +	if (!vde->secure_bo) {
> +		dev_err(dev, "Failed to allocate secure BO\n");
> +		goto err_pm_runtime;
> +	}

My eye just caught that by accident err variable isn't assigned to
-ENOMEM here. I'll make v2 shortly.
