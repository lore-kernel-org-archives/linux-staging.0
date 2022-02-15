Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608FC1578
	for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 15:16:40 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id d14-20020a05600c34ce00b0037bf4d14dc7so1617409wmq.3
        for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 07:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=OIi6IjZGN1DjvNwgjy01isoyMANw0CM1niHXU8IMICs=;
        b=SwWi/sh1OtgWFbxIeTi0CIX0bG3M0dr9rvOt1C9uOIHUkmS0Tx4+euvoSu9m50hSWJ
         xzJRS0q680RYaFiTT8KsEaBI7acIfk5E6A4ednBp5mQfNhvQJOmszhd7rD8/3trkWXNe
         9hjrejLm09BjRagMsfLY7r+glUeY41hoMwa1Cr4EbMASffn+fHThPTP+nDpMs4z3h4zK
         ptWu/8xyrCdg8Sgd+v56xpvdYwhuIlHOynmCTtLZg6PnEzeA8T8q0j8IwCJPT+vIOj8d
         GceX8yjXjDmQDBXmFWZwcmyD627TV90z7DByb5HC6DvCTNIq1AX+dUhcdDt2HBYQBNTv
         APfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=OIi6IjZGN1DjvNwgjy01isoyMANw0CM1niHXU8IMICs=;
        b=H8jEJMcZwtSKfBiAswuKosphQNWLbiQZZfL3r7oh8U338YKbt1iQcv4t4GUiBTT2iR
         jxt8V7n1B8B8YeZH1CUON7kbRxDjAVHDsGueMiERUUOMUq0+SA16HgYQJiFwRLUi/MzK
         UTwp4eDuDjzkBj3ggWVeokp1N7Oed00s9eOfgBkXvGYDTqzCof586dnHXRq+QeD5cl30
         pyBPIW+L72UIoIHq073kyEx+Ek6TSAtg3PW0IsgiMdWjTLjZPHdAquGf2izXZuj2/4R5
         eu3XjSSryiKYxtPW68/897Hqy1ziYSV1PfnQRMJaDaT93+Tg2VD/bYuf191ai4/+xPhY
         Nf/Q==
X-Gm-Message-State: AOAM533p6iiC5UrsvkWgMhRciUmUvRN25MIu6xChzR4oAUncVq017/4d
	wFmTnYuWpmtjUEobiYka1Gy1ew==
X-Google-Smtp-Source: ABdhPJwDYJo+GBmI826bxOJy/7iZxdyYz/3wkWRnnUCR4EQcUm4sQdJCcAWmk18wlmflepH7A2mBug==
X-Received: by 2002:a05:600c:1d92:: with SMTP id p18mr3510400wms.93.1644938198724;
        Tue, 15 Feb 2022 07:16:38 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id f25sm15472676wml.16.2022.02.15.07.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 07:16:38 -0800 (PST)
Date: Tue, 15 Feb 2022 15:16:36 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org, netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com,
	Wolfram Sang <wsa@kernel.org>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH v4 0/7] Provide and use generic_handle_irq_safe() where
 appropriate.
Message-ID: <YgvD1HpN2oyalDmj@google.com>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
 <Ygu6UewoPbYC9yPa@google.com>
 <Ygu9xtrMxxq36FRH@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ygu9xtrMxxq36FRH@linutronix.de>

On Tue, 15 Feb 2022, Sebastian Andrzej Siewior wrote:

> On 2022-02-15 14:36:01 [+0000], Lee Jones wrote:
> > Do we really need to coordinate this series cross-subsystem?
> 
> I would suggest to merge it via irq subsystem but I leave the logistics
> to tglx.

Could you answer by other questions too please?

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
