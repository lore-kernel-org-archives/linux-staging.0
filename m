Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8476BB456
	for <linux-staging@lists.linux.dev>; Wed, 11 Jan 2023 05:56:43 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id l26so10342853wme.5
        for <linux-staging@lists.linux.dev>; Tue, 10 Jan 2023 21:56:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nRJzXWIcLGfsAx1uj7LxnnT+lT00vnfCm0VUVZlOxf4=;
        b=0q0igcd5i2Ym0WoBzPkmTP7OcRrlt9YJyenG73iXW2EOS82GMhk47GppgoheL61xAZ
         LpettXBR6S7xJAZTMivOLw7xlytdr1nMhjBdh3YJpmIb1ebGwV0a47Aca0BMvZRx2vn+
         +oDXAP9t7iF3L03KKzmiTkO0Vk3feHy4eS5LpPiWP7+eCy4T3/R3bETP1m47L84ZnazG
         TvvmQNf9y4+R4IAKwujBAw3svdDzXWBF2NQldYuOeOGF0CmzXWE0hojchTQJr14Ol5w8
         DBSvLLLN5xXOxWQWB/zNPJnEo+Pmnk/OSk2Z+WcgG5z/TiYDrCfqFLez17Uu6dhZ6gWw
         lAWg==
X-Gm-Message-State: AFqh2kpSsfvX9tHM2qW/0ReXhq/GHzjRMnFdiRi2mcHsNbpANGdORjTG
	mY8pHqjSYWMBburPbm5px5k=
X-Google-Smtp-Source: AMrXdXuGMiv2BcYICZBUe09GCtW4hRfxWXShZC6GeIunbbzMLdfIj5QG6N/iKwiH0FjjphNqa2+B0A==
X-Received: by 2002:a05:600c:22d4:b0:3cf:82b9:2fe6 with SMTP id 20-20020a05600c22d400b003cf82b92fe6mr61119232wmg.8.1673416601718;
        Tue, 10 Jan 2023 21:56:41 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:49? ([2a0b:e7c0:0:107::aaaa:49])
        by smtp.gmail.com with ESMTPSA id az28-20020a05600c601c00b003cf57329221sm21419506wmb.14.2023.01.10.21.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 21:56:41 -0800 (PST)
Message-ID: <c10bf347-9f53-bcaf-acc2-d3dd6baa0efb@kernel.org>
Date: Wed, 11 Jan 2023 06:56:38 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 11/13] tty/serial: Call ->dtr_rts() parameter active
 consistently
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-serial@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>,
 =?UTF-8?Q?Samuel_Iglesias_Gons=c3=a1lvez?= <siglesias@igalia.com>,
 Rodolfo Giometti <giometti@enneenne.com>, Arnd Bergmann <arnd@arndb.de>,
 Ulf Hansson <ulf.hansson@linaro.org>, David Lin <dtwlin@gmail.com>,
 Alex Elder <elder@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org
References: <20230110120226.14972-1-ilpo.jarvinen@linux.intel.com>
 <20230110120226.14972-12-ilpo.jarvinen@linux.intel.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20230110120226.14972-12-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10. 01. 23, 13:02, Ilpo Järvinen wrote:
> Convert various parameter names for ->dtr_rts() and related functions
> from onoff, on, and raise to active.

Much better.

> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

-- 
js
suse labs

