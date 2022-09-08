Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3075CA6
	for <linux-staging@lists.linux.dev>; Thu,  8 Sep 2022 19:15:49 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id t5so25811182edc.11
        for <linux-staging@lists.linux.dev>; Thu, 08 Sep 2022 12:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=brkHUeJ9wKI03sLk6Szr1Y+BAmgmA5eRffy8CVfu2Dc=;
        b=G05EQ0Wr984wf1q9eYwe3KcsW7Qe7anlBWl3rfNx+B/Zt5sTvZOG/L1SCm4vbntrMb
         t7OQcpUDL5D6QA5b9kCHhM8zzwqb6pxpBiyB4pcoOI3l3ICt0urighd5A0yOFg/IJqdp
         SANRIzEtdmkl0GelFxwlfJhfvER83Sb+VDZve37prIYU3K1mzBtVvLoWiv4lnPyOFTMz
         fZcEYBLPbU/lKmggP7WbNVqNNwEeMwQ29ARlKDyr+DLsKKD0Oa/bDrlCR1ely3JhkHTw
         7JdtTNdVxNZ9SIcfgRteQQRlqXivLg4WsdIGW+V0nBx7P1+UQr34gLveS49Xt+QcE56f
         dmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=brkHUeJ9wKI03sLk6Szr1Y+BAmgmA5eRffy8CVfu2Dc=;
        b=MbOG/pVJ4GfC2/0g5CVnCXFiP8rQLKvmmQHk8CRePtWntIZ0ouxGxZapO/6ptztnMB
         XGoRiDU1tV6SW21ctM+ZCLwbufDes1VgFm4IwAmYWc63XErwEtmhbuJ3Z4UnW9AOZ/tI
         JyhazW40j+yFREiFtU8r1nD1N83e1MsyOoZ3MqIDMF5aMFxi6F/TQdfueT54E8YzxjTO
         S10bKy9y/7/1gLcFt28ds1JaVqLTl8iUh8mzdPcXKbHwnk90fshUz+QN/qOS3lEQl+yc
         xSxy2N3b0OqWaKIemc5YJRXZOJ0MwtEDzGaBnGhcStgbHeAEr+7qiy2SSsPNspeuqTDw
         mW8w==
X-Gm-Message-State: ACgBeo07OeHznGq+jBc+S4aC8nnfAam7f3bLXnN5FPdqYuQqcjVTAjZG
	/zHL0HBVZo+0qO9bGXFScvY=
X-Google-Smtp-Source: AA6agR6R1aLc52UBz+r/zzyyf2WiwZszTIWjbB0izBL5EMq/+p/8KNN4FElnaye8WnA7eW47oxhcPw==
X-Received: by 2002:aa7:ca50:0:b0:44e:973b:461e with SMTP id j16-20020aa7ca50000000b0044e973b461emr8525535edt.414.1662664547688;
        Thu, 08 Sep 2022 12:15:47 -0700 (PDT)
Received: from [192.168.1.100] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id r16-20020a50c010000000b00447bd64d4f6sm12983987edb.73.2022.09.08.12.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 12:15:46 -0700 (PDT)
Message-ID: <b5d3f85e-9678-5cdf-4643-7f52d7e2cc82@gmail.com>
Date: Thu, 8 Sep 2022 21:15:43 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: r8188eu: remove some unused enums
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220908072815.31002-1-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220908072815.31002-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/22 09:28, Michael Straube wrote:
> Remove some unused enums to clean up the driver code.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>   drivers/staging/r8188eu/include/rtl8188e_xmit.h |  6 ------
>   drivers/staging/r8188eu/include/rtw_mlme.h      | 11 -----------
>   drivers/staging/r8188eu/include/wlan_bssdef.h   |  4 ----
>   3 files changed, 21 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/include/rtl8188e_xmit.h b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
> index c69fed23ded9..6db7fabebea9 100644
> --- a/drivers/staging/r8188eu/include/rtl8188e_xmit.h
> +++ b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
> @@ -83,12 +83,6 @@
>   /* OFFSET 20 */
>   #define	RTY_LMT_EN		BIT(17)
>   
> -enum TXDESC_SC {
> -	SC_DONT_CARE = 0x00,
> -	SC_UPPER = 0x01,
> -	SC_LOWER = 0x02,
> -	SC_DUPLICATE = 0x03
> -};
>   /* OFFSET 20 */
>   #define SGI			BIT(6)
>   #define USB_TXAGG_NUM_SHT	24
> diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
> index 5dc2fe74b7b7..a959e2100c3f 100644
> --- a/drivers/staging/r8188eu/include/rtw_mlme.h
> +++ b/drivers/staging/r8188eu/include/rtw_mlme.h
> @@ -63,17 +63,6 @@ enum rt_scan_type {
>   	SCAN_MIX,
>   };
>   
> -enum SCAN_RESULT_TYPE {
> -	SCAN_RESULT_P2P_ONLY = 0,	/* Will return all the P2P devices. */
> -	SCAN_RESULT_ALL = 1,		/* Will return all the scanned device,
> -					 * include AP. */
> -	SCAN_RESULT_WFD_TYPE = 2	/* Will just return the correct WFD
> -					 * device. */
> -					/* If this device is Miracast sink
> -					 * device, it will just return all the
> -					 * Miracast source devices. */
> -};
> -
>   /*
>   there are several "locks" in mlme_priv,
>   since mlme_priv is a shared resource between many threads,
> diff --git a/drivers/staging/r8188eu/include/wlan_bssdef.h b/drivers/staging/r8188eu/include/wlan_bssdef.h
> index 9d1c9e763287..81bda91a4136 100644
> --- a/drivers/staging/r8188eu/include/wlan_bssdef.h
> +++ b/drivers/staging/r8188eu/include/wlan_bssdef.h
> @@ -133,10 +133,6 @@ struct ndis_802_11_assoc_info {
>   	u32  OffsetResponseIEs;
>   };
>   
> -enum ndis_802_11_reload_def {
> -	Ndis802_11ReloadWEPKeys
> -};
> -
>   /*  Key mapping keys require a BSSID */
>   struct ndis_802_11_key {
>   	u32           Length;             /*  Length of this structure */

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
