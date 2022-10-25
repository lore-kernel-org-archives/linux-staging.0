Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A1F748E
	for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 17:35:11 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id y14so14465723ejd.9
        for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 10:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d1cd8/NWjgbm6/tO2cUdBfWpIFFstc01MVYIyopAQQU=;
        b=LXCSVnzlNDZDIRsuW9DaO/y+bV1tFbC7e6MHKoPhCmSHCvCroOUvnoqvwP8nCWH2wf
         Nls62CGMpz3RKZFTlNf87EOaHDJTNp4C2+BG8Tg3dzDMPdgLrmUM0F3tabl4wCHV7Xgz
         GA7LhUMR7krQ04F8XYWr/gOvtT2VpTDoMSyG8b+YKz9cSCELb3mlzHTkah67+w1gAJEb
         mVvADdTFs7oy6d8ULCQIhbItnOw4fbuhDT8ArMC4uOz91Lwmu6QhsWEFf7oEKouyr8QM
         ui7qN5XHWiWYtZobDqzCy7ghobQkMR+ygdh+O3Eg6uqs+m/75SPwNVU7kHsBQmjhz/7j
         4Z7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d1cd8/NWjgbm6/tO2cUdBfWpIFFstc01MVYIyopAQQU=;
        b=2fsvw7y5//4gD4k1I1eOFVAu66SicXPQ7bXtcokHJzWPEmGK5Uf+ieM1iAz5tg25LY
         lX/QPgRcfSv1Y544SGgIstjeqIu4MXsPgJGvods4AAUgvnstb63A7Qfa6fmu7HLO7ABX
         nQ6OxxrpD89oaNBNHYtKydO0ClhziopMwgzUFROTURL3GL7X2QPLgifD+yokmqQKpkW7
         q2Hh54dAzQGYQpgHOwEJTA5Cm21vkTt3yTOnkBpnUpSZvke41as+tzTG9qGskF8jNyfO
         rha645XTrLGES4B8uzEMzfeFnT86LDLEfb+KU53erf7V3nsoy+jy2njJAsrdoXj7Y0rI
         gsnA==
X-Gm-Message-State: ACrzQf0NuaeV22eQJ+ortA8fNQ0O4Y0YT/TRj5UWkbFeqzU/iormW64v
	lpH4MX8a/Udk27lEs/F6idc=
X-Google-Smtp-Source: AMsMyM5kPNRY8ehQaII4UakT7mDg5cwoCSVLgCFvxHnyTdolB4Iqai/E90rZd0klrt6sPGfLIdP61A==
X-Received: by 2002:a17:907:2cf1:b0:78d:cafc:caba with SMTP id hz17-20020a1709072cf100b0078dcafccabamr33887607ejc.154.1666719309845;
        Tue, 25 Oct 2022 10:35:09 -0700 (PDT)
Received: from [192.168.1.100] (p57935738.dip0.t-ipconnect.de. [87.147.87.56])
        by smtp.gmail.com with ESMTPSA id eq9-20020a056402298900b0045b4b67156fsm1975141edb.45.2022.10.25.10.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 10:35:09 -0700 (PDT)
Message-ID: <f0b755d2-6d73-5b04-e013-59f622e143da@gmail.com>
Date: Tue, 25 Oct 2022 19:35:08 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] staging: rtl8192e: remove bogus ssid character sign
 test
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, dan.carpenter@oracle.com,
 gregkh@linuxfoundation.org, kvalo@kernel.org, linux-wireless@vger.kernel.org
References: <Y1e+SmS3O2ZaPVoe@kroah.com>
 <20221025122150.583617-1-Jason@zx2c4.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221025122150.583617-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/22 14:21, Jason A. Donenfeld wrote:
> This error triggers on some architectures with unsigned `char` types:
> 
> drivers/staging/rtl8192e/rtllib_softmac_wx.c:459 rtllib_wx_set_essid() warn: impossible condition '(extra[i] < 0) => (0-255 < 0)'
> 
> But actually, the entire test is bogus, as ssids don't have any sign
> validity rules like that. So just remove this check look all together.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-staging@lists.linux.dev
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
> Changes v1->v2:
> - Remove ssid sign test entirely rather than casting to `s8 *`.
> 
>   drivers/staging/rtl8192e/rtllib_softmac_wx.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> index f9589c5b62ba..1e5ad3b476ef 100644
> --- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> +++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> @@ -439,7 +439,7 @@ int rtllib_wx_set_essid(struct rtllib_device *ieee,
>   			union iwreq_data *wrqu, char *extra)
>   {
>   
> -	int ret = 0, len, i;
> +	int ret = 0, len;
>   	short proto_started;
>   	unsigned long flags;
>   
> @@ -455,13 +455,6 @@ int rtllib_wx_set_essid(struct rtllib_device *ieee,
>   		goto out;
>   	}
>   
> -	for (i = 0; i < len; i++) {
> -		if (extra[i] < 0) {
> -			ret = -1;
> -			goto out;
> -		}
> -	}
> -
>   	if (proto_started)
>   		rtllib_stop_protocol(ieee, true);

This patch cannot be applied on:
[PATCH] staging: rtl8192e: use explicitly signed char
On 10/24/22 18:30, Jason A. Donenfeld
As line 456 was changed.

Bye Philipp

>   


