Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1152C80
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 17:45:52 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 133so6258593wme.0
        for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 09:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4vKqoKfjDwsNRdAizQ80SN172ZaMHTtRepnJkLw9D24=;
        b=jXcv+8tm92aTNy0ngcHrZEFmgOqgRAV0p1GYWK5dAoWC3KDsYbfKcT9deZSlDsgzww
         dCEnyMEYlYdaGiDAzL3l49J9OefCtj32tRakYPAx1cKtNhzOweg0lnImcrCh6zrqq9jf
         ze/NoEl2eCLFCZW7SydWLI5Jy+UkEG26MSjjciakeFp1rsb76sY7ovij45yinkTxYxJx
         S6DaZAGDH7LkT85Vj8GWjWZcP6pn0ALEMAA0ao+PfXaM3YE6oH7Gi4buVPmR6WNjnezk
         oxF9Z3XJv6SJV/OUJGREOIYC7u29ZjKyRrZtbZ8rzfEytQ7soUIm+1LbHKw2/ctcj2oM
         yzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4vKqoKfjDwsNRdAizQ80SN172ZaMHTtRepnJkLw9D24=;
        b=VNsagZHwDueGCBbEkGM1Q2/4l9RyUrsyJ867UNsSdCPbiIGS6Mlkce3NxTZZmsN1GQ
         C0ecxQmQYZkVDQUisnuZcLmitvkEkH4k6FfLwE4GZxT09hzfJ23unINlwXdg9cunLJW7
         Rv6FN3ifT2SiYfSfi8LbetcG9twfz/U8sNktXCKdifA8x6bCTgM2UB3LkdOGUmdBgqQ0
         2p/gDfeC5pEhPfG7MErOEnH/VXBd7wULzIfx+NCcx8urmbQc6W4YJCSngd9S9xc3Vr1v
         jz/EYKPg3ceF8K1jGXvnGqEKTNmd0Khc36yxzVEnUGW4cd5389kMJechuy291XgoMZD3
         fhyA==
X-Gm-Message-State: AOAM532y/OmkmF0I/UBydU4TvGWKGyphNlRi3f2DgoLaVsgx0f2S6q0d
	s+EpwMEQrGfSFSBNQewAz0U=
X-Google-Smtp-Source: ABdhPJxH0bo/xUh688xVLIl06WpH3hPkdySXAVIOcjOcP/WVpDGWSc8Si3r1Udvhh9k0LVEjSKpiAQ==
X-Received: by 2002:a05:600c:6016:: with SMTP id az22mr9726744wmb.11.1637862351044;
        Thu, 25 Nov 2021 09:45:51 -0800 (PST)
Received: from ?IPV6:2a02:8108:96c0:3b88::7311? ([2a02:8108:96c0:3b88::7311])
        by smtp.gmail.com with ESMTPSA id r83sm8596136wma.22.2021.11.25.09.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 09:45:50 -0800 (PST)
Message-ID: <a484ba55-7d3c-4238-7821-08826e8b0faa@gmail.com>
Date: Thu, 25 Nov 2021 18:45:50 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/4] staging: r8188eu: remove _ps_open_RF
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211125164745.8188-1-martin@kaiser.cx>
 <20211125164745.8188-3-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20211125164745.8188-3-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/25/21 17:47, Martin Kaiser wrote:
> The _ps_open_RF function is empty. Remove it.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/hal/usb_halinit.c | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
> index 04518e9838ea..995ea4a55435 100644
> --- a/drivers/staging/r8188eu/hal/usb_halinit.c
> +++ b/drivers/staging/r8188eu/hal/usb_halinit.c
> @@ -615,8 +615,6 @@ u32 rtl8188eu_hal_init(struct adapter *Adapter)
>   	HAL_INIT_PROFILE_TAG(HAL_INIT_STAGES_BEGIN);
>   
>   	if (Adapter->pwrctrlpriv.bkeepfwalive) {
> -		_ps_open_RF(Adapter);
> -
>   		if (haldata->odmpriv.RFCalibrateInfo.bIQKInitialized) {
>   			PHY_IQCalibrate_8188E(Adapter, true);
>   		} else {
> @@ -852,12 +850,6 @@ u32 rtl8188eu_hal_init(struct adapter *Adapter)
>   	return status;
>   }
>   
> -void _ps_open_RF(struct adapter *adapt)
> -{
> -	/* here call with bRegSSPwrLvl 1, bRegSSPwrLvl 2 needs to be verified */
> -	/* phy_SsPwrSwitch92CU(adapt, rf_on, 1); */
> -}
> -
>   static void _ps_close_RF(struct adapter *adapt)
>   {
>   	/* here call with bRegSSPwrLvl 1, bRegSSPwrLvl 2 needs to be verified */
> 

Hi Martin,

The prototype of _ps_open_RF() should also be removed from
rtl8188e_hal.h.

Thanks,
Michael
