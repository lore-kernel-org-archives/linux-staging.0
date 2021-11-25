Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F3A2C80
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 17:46:48 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id v11so13245449wrw.10
        for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 09:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dM0J3dt4h4ce+/bgfr0sMjPnODp/xXDrf+z2T+vwycw=;
        b=gTcKSPijPldqPZjUR1xv1M8OlenayFzHvHVkdCH2AuHUauJGb4Amaau5sI5W6lCM0t
         XQqRBOBugqIiHFXuu0lrsRMUiGYI3puVNtqtAcI7v4o1GEQzbcThZxtfoFsRkFo8cgJe
         dyznqZcqpMbTvdPSOzvq6R7sM0LcmKwyZPZ3oWkWhnN8PWbGtkmDDd1Eqs/21z2RwWf+
         ix+N3v0PQgbXLxvEj7qjVq/sLtg+rAG/TgYDADOJu+opufagAxPL3Z6neQ5Ge+P8m5Gk
         O8fnO8GkTfFRU9+g6Wn4xmGnl9U0SJoMMojxlbVOzbwTNeozhvjqMv1bBGHsbIG6EzgS
         XNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dM0J3dt4h4ce+/bgfr0sMjPnODp/xXDrf+z2T+vwycw=;
        b=uLwiFdFK9wIyqt1bApLYXogY2qAjfvK58LqwbSlskQ3Qz49gvfp5R+1rrhj50XDhyb
         9iRxUTqcU8bPe/jw83ApLlhka6tvvaAC8VCXQpVt4ahQh9SJJQd+vwkAEMt12Wwg2+JR
         aR5fluV2nIUqYSyRVnIEkxBd1xDfjwY/rSLoUe0bOv5wW2dlpXdg8i+XWRRR+JEv0mSa
         8KrwZc0MT6oQhP80hhbNT2qPDLkrEsyCQf2P7GwgDu0myhMURSS+Q5NRIjQFeAaw2Xpn
         dSUH0w2VgW7Mac6udOkmtGUHEctsDu6M90nvu77kI0sfUwRY3vQGIoQpMTbCN7ST2Ooe
         D6TA==
X-Gm-Message-State: AOAM530rwf+TMu0G30f4yW2/79gDbjfKZ1/MLwaVZTBcrTLt2Imh3UU+
	8OqmhlbNKkqeg/hbZThjrIQ=
X-Google-Smtp-Source: ABdhPJy/iuzlqLMiHvcr8Cn+q8aZPl1M2nZ/wh516j1zxq5qbmV0b1BongNTIxje03OvujwUAiccGQ==
X-Received: by 2002:adf:e60e:: with SMTP id p14mr8834873wrm.470.1637862406958;
        Thu, 25 Nov 2021 09:46:46 -0800 (PST)
Received: from ?IPV6:2a02:8108:96c0:3b88::7311? ([2a02:8108:96c0:3b88::7311])
        by smtp.gmail.com with ESMTPSA id m7sm3457414wml.38.2021.11.25.09.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 09:46:46 -0800 (PST)
Message-ID: <7a090a98-b3ae-fe40-84c2-dbbebc85731f@gmail.com>
Date: Thu, 25 Nov 2021 18:46:46 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/4] staging: r8188eu: remove _ps_close_RF
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211125164745.8188-1-martin@kaiser.cx>
 <20211125164745.8188-4-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20211125164745.8188-4-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/25/21 17:47, Martin Kaiser wrote:
> The _ps_close_RF is empty. Remove it.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/hal/usb_halinit.c | 10 +---------
>   1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
> index 995ea4a55435..0b1aaa162c21 100644
> --- a/drivers/staging/r8188eu/hal/usb_halinit.c
> +++ b/drivers/staging/r8188eu/hal/usb_halinit.c
> @@ -850,12 +850,6 @@ u32 rtl8188eu_hal_init(struct adapter *Adapter)
>   	return status;
>   }
>   
> -static void _ps_close_RF(struct adapter *adapt)
> -{
> -	/* here call with bRegSSPwrLvl 1, bRegSSPwrLvl 2 needs to be verified */
> -	/* phy_SsPwrSwitch92CU(adapt, rf_off, 1); */
> -}
> -
>   static void CardDisableRTL8188EU(struct adapter *Adapter)
>   {
>   	u8 val8;
> @@ -921,9 +915,7 @@ u32 rtl8188eu_hal_deinit(struct adapter *Adapter)
>   	rtw_write32(Adapter, REG_HIMRE_88E, IMR_DISABLED_88E);
>   
>   	DBG_88E("bkeepfwalive(%x)\n", Adapter->pwrctrlpriv.bkeepfwalive);
> -	if (Adapter->pwrctrlpriv.bkeepfwalive) {
> -		_ps_close_RF(Adapter);
> -	} else {
> +	if (!Adapter->pwrctrlpriv.bkeepfwalive) {
>   		if (Adapter->hw_init_completed) {
>   			CardDisableRTL8188EU(Adapter);
>   		}
> 

Reviewed-by: Michael Straube <straube.linux@gmail.com>
