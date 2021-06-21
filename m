Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9904F70
	for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 09:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624268914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MTkPHmy6rfTioWrJ0iPRxegps5plB8OPwiidQxmduZA=;
	b=dmvt+kZ1TqHG90cFE92NWT8Lf9wKWB8DNmCpR+3uNdhV0xlHXFWSdKAIF2821daywXMqr2
	S5iTpim1cqb3zaBFIAdh0QqcX4OuhvSj0opUiiufnBqG6TGvtUSO8usQmlVfMPFD9LMJ6f
	UjTasKKwAdfN5Sjj3Wq6FVylIP8clAg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-3rMnqON4N6K81zG149tIFg-1; Mon, 21 Jun 2021 05:48:32 -0400
X-MC-Unique: 3rMnqON4N6K81zG149tIFg-1
Received: by mail-ed1-f72.google.com with SMTP id v8-20020a0564023488b0290393873961f6so7478198edc.17
        for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 02:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MTkPHmy6rfTioWrJ0iPRxegps5plB8OPwiidQxmduZA=;
        b=P6S5Lv1+8xxKSncp/Lrnf99gBXBnL6jJF3ggxOLXLVaaEc9grh8p6UtENdUE2izWTU
         0Vrk5nXAtxbCf4a7YWpRDzya+gQ2NPwPU0G/JGorVjOJPgPFB3NBPV1TxLadiF+/pCnw
         FFJ6uGymTmE7OlzVamnLSyZq+Boh/JZcIDFYLadIkFBhzp21RrO4NA9579ytllVlhw2b
         yN1dC/zxGYRdJgOZQePe8kAaW1el9LL9s8pAbuyroYbgm/yJygDADdhVxCDqyLQO8rA8
         201lq5y8Tk8OQ58qnuX52h1oP92uudZk0xtRvOJL6EzOKHLTGITNFt984dabFyTS6z5F
         xkfg==
X-Gm-Message-State: AOAM530qhHBnBkbeVp0AERlXBFg4WryPTRbvxfZTtFN8t3UZDQQNAj9t
	Z7IbyFQCcRGXCM7OiUa5zPLzV7xFoIRYnqi+0ecqLkxWVZ2O4eX8HypFWnbJq+7bQjTAtUO35MY
	TLFf7xF6CTcvQ86F0AJWnmDYufg==
X-Received: by 2002:aa7:c1da:: with SMTP id d26mr5123780edp.278.1624268911829;
        Mon, 21 Jun 2021 02:48:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9Ggaq1E91FB+doVbBOkBumND7mbyNSOMIf8zN7htT8GEHdOfLqDVUzYnJkcd2IErGBnt0CQ==
X-Received: by 2002:aa7:c1da:: with SMTP id d26mr5123766edp.278.1624268911733;
        Mon, 21 Jun 2021 02:48:31 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id n10sm8220548edw.70.2021.06.21.02.48.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 02:48:28 -0700 (PDT)
Subject: Re: [PATCH 15/18] staging: rtl8723bs: remove register initializations
 tied to 802.11ac standard
To: Fabio Aiuto <fabioaiuto83@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <cover.1624099125.git.fabioaiuto83@gmail.com>
 <66706b5cb6474c4482c3342c4383fe62eba54967.1624099126.git.fabioaiuto83@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <b3f7e373-a7f9-f48f-b510-7eb3e56e872e@redhat.com>
Date: Mon, 21 Jun 2021 11:48:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <66706b5cb6474c4482c3342c4383fe62eba54967.1624099126.git.fabioaiuto83@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 6/19/21 12:47 PM, Fabio Aiuto wrote:
> remove register initializations tied to 802.11ac standard which
> is not supported by the device.
> 
> It's a dangerous operation, relying only on comments, but tested
> on a Lenovo Ideapad MIIX 300-10IBY tablet seems to work.
> 
> Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>

TBH I think this patch should be dropped from the series, you
are dropping a bunch of register writes which likely are actually
doing something, so this is not just dead code removal.

Regards,

Hans


> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index 059d3050acc6..3a03dfb8d275 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -1718,24 +1718,12 @@ void _InitBurstPktLen_8723BS(struct adapter *Adapter)
>  	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
>  
>  	rtw_write8(Adapter, 0x4c7, rtw_read8(Adapter, 0x4c7)|BIT(7)); /* enable single pkt ampdu */
> -	rtw_write8(Adapter, REG_RX_PKT_LIMIT_8723B, 0x18);		/* for VHT packet length 11K */
>  	rtw_write8(Adapter, REG_MAX_AGGR_NUM_8723B, 0x1F);
>  	rtw_write8(Adapter, REG_PIFS_8723B, 0x00);
>  	rtw_write8(Adapter, REG_FWHW_TXQ_CTRL_8723B, rtw_read8(Adapter, REG_FWHW_TXQ_CTRL)&(~BIT(7)));
>  	if (pHalData->AMPDUBurstMode)
>  		rtw_write8(Adapter, REG_AMPDU_BURST_MODE_8723B,  0x5F);
>  	rtw_write8(Adapter, REG_AMPDU_MAX_TIME_8723B, 0x70);
> -
> -	/*  ARFB table 9 for 11ac 5G 2SS */
> -	rtw_write32(Adapter, REG_ARFR0_8723B, 0x00000010);
> -	if (IS_NORMAL_CHIP(pHalData->VersionID))
> -		rtw_write32(Adapter, REG_ARFR0_8723B+4, 0xfffff000);
> -	else
> -		rtw_write32(Adapter, REG_ARFR0_8723B+4, 0x3e0ff000);
> -
> -	/*  ARFB table 10 for 11ac 5G 1SS */
> -	rtw_write32(Adapter, REG_ARFR1_8723B, 0x00000010);
> -	rtw_write32(Adapter, REG_ARFR1_8723B+4, 0x003ff000);
>  }
>  
>  static void ResumeTxBeacon(struct adapter *padapter)
> 

