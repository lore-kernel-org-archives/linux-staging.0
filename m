Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9189470
	for <linux-staging@lists.linux.dev>; Mon,  7 Jun 2021 14:49:17 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id l9so1229877wms.1
        for <linux-staging@lists.linux.dev>; Mon, 07 Jun 2021 07:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KV3zPs4im4phSjU/52hl/BfQSATdJYqhk/PrHcx2zz0=;
        b=nCT2Uck+ppudDmlZd58SohO6wRPIWG5d2DSvA3RejmUNR0hKuOtAJSxgr6xD1Sz5d2
         8oWB8Gjaa4VrCgACwRfTXsdavosuLKerEF6gY79l0xErlRHAJNj0W545e7saKMNpKSE9
         baxJ/eyeDEvp3FWIEiK8CY98x1iZSkrumTzb+BW37VbXOy/tdd3Nu5lAJU1mjDjIHvIP
         qTuFFub28DMAd4vLZ7iF0MT/xtGkIW0Gl+7hzgERcWGCaOJUFmY/WLDRnL/92VnOERRX
         R9+426CC70bePn2S6Etj66uYRV0O3BuZTck2xQSJeO1953C3/+DiO62jhnmBH8YOV6qK
         068w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KV3zPs4im4phSjU/52hl/BfQSATdJYqhk/PrHcx2zz0=;
        b=pBgCHMbKjO01invzRfdkeXePSBtEI+NkHw/Z4lMqCRl8AnNcMDF+RwCPyXEWG6quBb
         gKq5RKQPAlHq4L6e5YjvcV2r5VbqIzoc3hL/C+sW/pk4hFeaR9ksgQgiEUADVM55k0o4
         f4Vvmwz6XkpG/93sxWnaDEAsX9VetKix1AcmrV0KEf9gVMqF+b73APrMEdJLGIR2mdIZ
         9suWXspl9QV6ZT/op9OFBPq+4K6EFtHLPzjr5U9WyDjoyg3M6fjgbxhLKz5v9zypzt1P
         R9n2dQWkej3jVdOoRL1ZWW+VHCUeXziq0WcqDlZNnOvwDK//77/kbrgj2PLdNI5MXZnn
         7ujA==
X-Gm-Message-State: AOAM530/1tLr29ZE1tt9McBq0YUHB4K22PnulQKsmqeLIXMZt+SsANIB
	tKuSYiJYpqYpexV220IvCe8=
X-Google-Smtp-Source: ABdhPJz7byVCgomQHWfqmTxuAfGFw4I0TYizHnTU7u6Ipz9/AscEmlH/KB9YAqIzPvR/8H7HsYg13A==
X-Received: by 2002:a05:600c:1994:: with SMTP id t20mr17320874wmq.177.1623077356153;
        Mon, 07 Jun 2021 07:49:16 -0700 (PDT)
Received: from agape.jhs ([5.171.73.82])
        by smtp.gmail.com with ESMTPSA id n13sm18372021wrg.75.2021.06.07.07.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 07:49:16 -0700 (PDT)
Date: Mon, 7 Jun 2021 16:49:13 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joe Perches <joe@perches.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: os_dep: Remove conditions with no
 effects
Message-ID: <20210607144912.GA1401@agape.jhs>
References: <20210606074216.26495-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210606074216.26495-1-fmdefrancesco@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sun, Jun 06, 2021 at 09:42:16AM +0200, Fabio M. De Francesco wrote:
> Removed conditions with no effects. Detected by Coccinelle.
> It seems that these conditions with no effects had been inadvertently
> left while deleting code that had to be conditionally compiled by 
> unused definition CONFIG_AP_WOWLAN (see commit dc365d2cc579).
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
> 
> v1 -> v2: Rewrote the changelog according to suggestion by 
> Joe Perches <joe@perches.com>
> 
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> index 213ec5b4ce98..2035573ee5a0 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -1187,10 +1187,7 @@ void rtw_suspend_common(struct adapter *padapter)
>  
>  	rtw_ps_deny_cancel(padapter, PS_DENY_SUSPEND);
>  
> -	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE))
> -		rtw_suspend_normal(padapter);
> -	else
> -		rtw_suspend_normal(padapter);
> +	rtw_suspend_normal(padapter);
>  
>  	netdev_dbg(padapter->pnetdev, "rtw suspend success in %d ms\n",
>  		   jiffies_to_msecs(jiffies - start_time));
> @@ -1268,11 +1265,7 @@ int rtw_resume_common(struct adapter *padapter)
>  
>  	netdev_dbg(padapter->pnetdev, "resume start\n");
>  
> -	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
> -		rtw_resume_process_normal(padapter);
> -	} else {
> -		rtw_resume_process_normal(padapter);
> -	}
> +	rtw_resume_process_normal(padapter);
>  
>  	hal_btcoex_SuspendNotify(padapter, 0);
>  
> -- 
> 2.31.1
> 
> 

Thank you Fabio :)

Reviewed-by: Fabio Aiuto <fabioaiuto83@gmail.com>
