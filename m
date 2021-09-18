Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0965D72
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 15:16:38 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id j13so41764956edv.13
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 08:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=t3eMGUEJNYAjhTCkshwSSCcrwbmI90ywvcRzbi0dcEU=;
        b=lXJjlM8sL2lvHxRaLDsPB1fyT5HvqtlKxiZBjk9gcyi/T2wF9bY9WNgS//66lbAUrg
         bQ9f2Lqll3tNr54ikwdwqZZVxplUPeLAuhazr6O7PPyo5wNYlU+CzOm62z9CJoZ4umh+
         5eHm0sYnVEHfxuj+ycCRIQAHnsmwO0AtfhGdIY9xfzB4dV73qNRwUXHwWQP1KkBQJuCR
         XLdG+FX8K5X3HiC8B27qwugQnYzkIJ7er4tPPAstv/ViI/dzTIDG5i5lyrsAMgw2nQ0+
         tmRkd8uO6q5alsFgy/KeWEFBvDZAAx9SNw4fkuOkqBZFwOyXDWVmpKH7mK7gKaI93JDG
         lUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=t3eMGUEJNYAjhTCkshwSSCcrwbmI90ywvcRzbi0dcEU=;
        b=8GwWC3wxSaG8mPPX8ky2UFAwhSgILANVdIzkkzjCY9ZqlT5rfsHMlW5ONzkwQOCukK
         FIOEgGO8DaRCraN/YOxBtcRDU+m3CWZatuGqU8+G5rMRqRvyENiBIcV3vhcIdrW/u04m
         4SwH0zCnXcUHQII8p5JPAb+Z/dI/MNd2j7mEbTOX/B81bqYdq4K8WZNVh3jfBkRDjKxT
         xVB4UvAqkN8eVp44iuRysVr/SvuFxyop3nLiW77NUdqMgZFuZB7TKFqoLFomsQPCdKFI
         xecMnFXt1DX/LTGkpESPCH8BWwhyoxQXp3ORe2SMYBUhMV10fBjNR0+/HrQxI2V28s6j
         wJyg==
X-Gm-Message-State: AOAM531b4inO7uLejLrG97Y3KdvEvSPMnxCgSi/ctcz/nUp7MKbR4eZg
	Q/D+6yINWekCahlRPR6Whm0=
X-Google-Smtp-Source: ABdhPJxm/vxu2JFatsxBMA9yPsd3eO+040U+s0vyHXxtB906u/sWHk4i0U2FBv+5+XBlrnaYeE7muQ==
X-Received: by 2002:a05:6402:2061:: with SMTP id bd1mr19345566edb.186.1631978197327;
        Sat, 18 Sep 2021 08:16:37 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::cde? ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id br21sm3835483ejb.112.2021.09.18.08.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Sep 2021 08:16:36 -0700 (PDT)
Message-ID: <a1ef6b5a-43d0-3b45-7905-0f93e2a340c5@gmail.com>
Date: Sat, 18 Sep 2021 17:16:35 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 2/2] staging: r8188eu: remove rtw_hw_resume
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210911161019.26881-1-martin@kaiser.cx>
 <20210918135722.23976-1-martin@kaiser.cx>
 <20210918135722.23976-2-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20210918135722.23976-2-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/21 15:57, Martin Kaiser wrote:
> Commit c0a099b7341c ("staging: r8188eu: bHWPwrPindetect is always false")
> removed the only call to rtw_hw_resume.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
> v3:
> - another rebase against today's staging-testing branch
> 
> v2:
> - rebased against today's staging-testing branch
> 
>   drivers/staging/r8188eu/include/osdep_intf.h |  1 -
>   drivers/staging/r8188eu/os_dep/usb_intf.c    | 39 --------------------
>   2 files changed, 40 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/include/osdep_intf.h b/drivers/staging/r8188eu/include/osdep_intf.h
> index 5a2c7a98f023..da36770852f8 100644
> --- a/drivers/staging/r8188eu/include/osdep_intf.h
> +++ b/drivers/staging/r8188eu/include/osdep_intf.h
> @@ -58,6 +58,5 @@ void rtw_ips_dev_unload(struct adapter *padapter);
>   
>   int rtw_ips_pwr_up(struct adapter *padapter);
>   void rtw_ips_pwr_down(struct adapter *padapter);
> -int rtw_hw_resume(struct adapter *padapter);
>   
>   #endif	/* _OSDEP_INTF_H_ */
> diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
> index 25dc90847380..11a584cbe9d8 100644
> --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
> +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
> @@ -278,45 +278,6 @@ static void process_spec_devid(const struct usb_device_id *pdid)
>   	}
>   }
>   
> -int rtw_hw_resume(struct adapter *padapter)
> -{
> -	struct pwrctrl_priv *pwrpriv;
> -	struct net_device *pnetdev = padapter->pnetdev;
> -
> -	if (!padapter)
> -		goto error_exit;
> -	pwrpriv = &padapter->pwrctrlpriv;
> -	DBG_88E("==> rtw_hw_resume\n");
> -	_enter_pwrlock(&pwrpriv->lock);
> -	pwrpriv->bips_processing = true;
> -	rtw_reset_drv_sw(padapter);
> -
> -	if (pm_netdev_open(pnetdev, false) != 0) {
> -		_exit_pwrlock(&pwrpriv->lock);
> -		goto error_exit;
> -	}
> -
> -	netif_device_attach(pnetdev);
> -	netif_carrier_on(pnetdev);
> -
> -	if (!netif_queue_stopped(pnetdev))
> -		netif_start_queue(pnetdev);
> -	else
> -		netif_wake_queue(pnetdev);
> -
> -	pwrpriv->bkeepfwalive = false;
> -
> -	pwrpriv->rf_pwrstate = rf_on;
> -	pwrpriv->bips_processing = false;
> -
> -	_exit_pwrlock(&pwrpriv->lock);
> -
> -	return 0;
> -error_exit:
> -	DBG_88E("%s, Open net dev failed\n", __func__);
> -	return -1;
> -}
> -
>   static int rtw_suspend(struct usb_interface *pusb_intf, pm_message_t message)
>   {
>   	struct dvobj_priv *dvobj = usb_get_intfdata(pusb_intf);
> 

Looks good to me.

Acked-by: Michael Straube <straube.linux@gmail.com>

Thanks,
Michael
