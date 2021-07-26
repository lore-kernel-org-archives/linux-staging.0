Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A8A72
	for <linux-staging@lists.linux.dev>; Mon, 26 Jul 2021 15:09:53 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id c7-20020a9d27870000b02904d360fbc71bso10205578otb.10
        for <linux-staging@lists.linux.dev>; Mon, 26 Jul 2021 08:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9y5LahECIAbm3f5+aXFvAJE77WeSPYzFpoV3JjO/OcA=;
        b=abB+W/oYtV5GIKVFYivlzZtIQyVFozF4dr5iM0XT7dfDjsLzSqMFjViC7T7E28FMjc
         HHX7uctGg1AerMKza/DiDRwYv0IYKGqepuhbLccSJrwmYd0dpLphglHM8xgt2NoXFWQo
         jH/eZoVt+cJpjRHatY8kW2v2PdrjhJ+Sxx0fuhiz1V4pIgiQGnpoHPNXpkRf1icW8NSv
         06b2V0xERM+VUsVmkazdJZI6F+nW+hEiwuAb250ifE9EMznxjhGzywKy8ec+khfWgDJ0
         lu92ufvLUIwPjHSBgEmYblFTIaqBHVlDHv6tTywqRvgmsoZFgsMjXg0nHpf3g1wvy61b
         QjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9y5LahECIAbm3f5+aXFvAJE77WeSPYzFpoV3JjO/OcA=;
        b=dTORbDPc9QpPeblBjt6eQ3kKYUJctjZczCyA8V9gKhkiw2BzMwnxLLwbhrS9quIlLm
         hV6us2LeWYun29TkeZpEfgfFbHQ0A5Nk+icyQI2lRnKUdTKXKfUWBk0kDH8Ol4ti4gl1
         QLs/0e4pZYzy4xVbbn5q4oL74fmYO2H3cTviklMfHc8AN7jSSYMAHZj4Aainfl6za8Dr
         Lo6w/75orowNnoZ6OeXAFB8FIx0rrvsfyr9aHV7ZTbFY3FeqSGgd8OOMteh5TyBw51Sa
         Ov6jDSGvyJRF7RY97iGqThGdjjAbY6/qSn8HTnOhFt3unCHZcA0BFoBM1c2iCJdHZtrc
         KRbQ==
X-Gm-Message-State: AOAM531o8RZr1bhyIh28oQSPBsD+i2GDYTBHmBdmiMbX4qBJ4f/roUQ6
	ewNBedevjYgqOa/tUHjmSlU=
X-Google-Smtp-Source: ABdhPJwXJ1SBm7ggRywbdbC9XLBKlLOsXbwuORU/tF5+YW22/dp7Zb778l8T0L5poN8C/JKb13m7xQ==
X-Received: by 2002:a9d:2782:: with SMTP id c2mr12152793otb.323.1627312192706;
        Mon, 26 Jul 2021 08:09:52 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id m19sm34109otp.55.2021.07.26.08.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jul 2021 08:09:52 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH] staging: rtl8188eu: remove braces from single line if
 blocks
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210726092129.30334-1-straube.linux@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <a4eb0dea-a34b-8dd9-03c6-aa0d87e68986@lwfinger.net>
Date: Mon, 26 Jul 2021 10:09:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210726092129.30334-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/26/21 4:21 AM, Michael Straube wrote:
> Remove braces from single line if blocks to clear checkpatch warnings.
> WARNING: braces {} are not necessary for single statement blocks
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>   drivers/staging/rtl8188eu/core/rtw_cmd.c          | 3 +--
>   drivers/staging/rtl8188eu/core/rtw_mlme.c         | 3 +--
>   drivers/staging/rtl8188eu/core/rtw_xmit.c         | 3 +--
>   drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c | 3 +--
>   drivers/staging/rtl8188eu/hal/usb_halinit.c       | 6 ++----
>   5 files changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/core/rtw_cmd.c b/drivers/staging/rtl8188eu/core/rtw_cmd.c
> index eb89a52aa4e3..56ece839c9ca 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_cmd.c
> @@ -1159,9 +1159,8 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
>   		psta = rtw_get_stainfo(&padapter->stapriv, pnetwork->MacAddress);
>   		if (!psta) {
>   			psta = rtw_alloc_stainfo(&padapter->stapriv, pnetwork->MacAddress);
> -			if (!psta) {
> +			if (!psta)
>   				goto createbss_cmd_fail;
> -			}
>   		}
>   
>   		rtw_indicate_connect(padapter);
> diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme.c b/drivers/staging/rtl8188eu/core/rtw_mlme.c
> index 71d205f3d73d..0d334aba9a3f 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_mlme.c
> @@ -953,9 +953,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
>   			}
>   
>   			/* s4. indicate connect */
> -			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
> +			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE))
>   				rtw_indicate_connect(adapter);
> -			}
>   
>   			/* s5. Cancel assoc_timer */
>   			del_timer_sync(&pmlmepriv->assoc_timer);
> diff --git a/drivers/staging/rtl8188eu/core/rtw_xmit.c b/drivers/staging/rtl8188eu/core/rtw_xmit.c
> index d5fc59417ec6..c77ebd18f40c 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_xmit.c
> @@ -1124,9 +1124,8 @@ struct xmit_buf *rtw_alloc_xmitbuf(struct xmit_priv *pxmitpriv)
>   		list_del_init(&pxmitbuf->list);
>   		pxmitpriv->free_xmitbuf_cnt--;
>   		pxmitbuf->priv_data = NULL;
> -		if (pxmitbuf->sctx) {
> +		if (pxmitbuf->sctx)
>   			rtw_sctx_done_err(&pxmitbuf->sctx, RTW_SCTX_DONE_BUF_ALLOC);
> -		}
>   	}
>   	spin_unlock_irqrestore(&pfree_xmitbuf_queue->lock, irql);
>   
> diff --git a/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
> index 6cf87312bc36..a67615708745 100644
> --- a/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
> +++ b/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
> @@ -510,7 +510,6 @@ void Hal_ReadThermalMeter_88E(struct adapter *Adapter, u8 *PROMContent, bool Aut
>   	else
>   		pHalData->EEPROMThermalMeter = EEPROM_Default_ThermalMeter_88E;
>   
> -	if (pHalData->EEPROMThermalMeter == 0xff || AutoloadFail) {
> +	if (pHalData->EEPROMThermalMeter == 0xff || AutoloadFail)
>   		pHalData->EEPROMThermalMeter = EEPROM_Default_ThermalMeter_88E;
> -	}
>   }
> diff --git a/drivers/staging/rtl8188eu/hal/usb_halinit.c b/drivers/staging/rtl8188eu/hal/usb_halinit.c
> index 1d7d5037ce89..3e8f7315d377 100644
> --- a/drivers/staging/rtl8188eu/hal/usb_halinit.c
> +++ b/drivers/staging/rtl8188eu/hal/usb_halinit.c
> @@ -641,9 +641,8 @@ u32 rtl8188eu_hal_init(struct adapter *Adapter)
>   	}
>   
>   	status = rtw_hal_power_on(Adapter);
> -	if (status == _FAIL) {
> +	if (status == _FAIL)
>   		goto exit;
> -	}
>   
>   	/*  Save target channel */
>   	haldata->CurrentChannel = 6;/* default set to 6 */
> @@ -696,9 +695,8 @@ u32 rtl8188eu_hal_init(struct adapter *Adapter)
>   	_InitTxBufferBoundary(Adapter, txpktbuf_bndy);
>   
>   	status =  InitLLTTable(Adapter, txpktbuf_bndy);
> -	if (status == _FAIL) {
> +	if (status == _FAIL)
>   		goto exit;
> -	}
>   
>   	/*  Get Rx PHY status in order to report RSSI and others. */
>   	_InitDriverInfoSize(Adapter, DRVINFO_SZ);
> 

Michael,

You might as well stop looking at drivers/staging/rtl8188eu. There is a pending 
patch that blows away that directory and replaces it with a new version from the 
GitHub repo. The new one will be in drivers/staging/r8188eu.

NACKed by Larry.Finger <Larry.Finger@lwfinger.net>

Larry

