Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA858490
	for <linux-staging@lists.linux.dev>; Fri,  4 Nov 2022 18:21:56 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id kt23so15394965ejc.7
        for <linux-staging@lists.linux.dev>; Fri, 04 Nov 2022 11:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sFmEFntrpXTlbTEQ0DoAwZpXgc7ElcMBwCl9NY4ZlBo=;
        b=bZqHX9AUdPofmljUxapDDGVsLlE019jqlAWVFSqKWiATVMB/wAzNjLWtn+u7+qQeTB
         fMJEy7EmUWFVghynz7ljKWvllM8JCcSruuA3aavw4phRg7gJ47mqi5ndQ7ek0sQX3Mg0
         e+D/2/s/byTsDxoNASJa0+KfYCueXpBRnxiZFbstEnyigmnnwOjyec3XAGw89BNGSq7G
         2edSyWJ0Ni60cAaFGhRJJi/zissvY48sJsSDOE4qJh9IeCZE/8k7t75l7n9cmm8jVRsJ
         KJVLeGOXBxjp37CujI2sy5thOMCAtp4LACOr3IN9zSpXr/RX5vEFO0eQEUi8g5ctZ+qk
         rgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sFmEFntrpXTlbTEQ0DoAwZpXgc7ElcMBwCl9NY4ZlBo=;
        b=kYzMm/vEWs7D65ebmplU4KqjTbMW1FhDpfwp9seJa4HUNA/cclAtWZF0lM4Q1Jrisp
         ruIkEvRi0vVY+CJg+bSUtaO+EuFONyL4yVMpZEjzB3hY2dVEhr3w+rrIMFPp/XZo/xyZ
         kxGAg+9BnXEbl7CyDVjfXRXA0BwdA6LEUVdm6jT0Jj/jTPPDSr5J/AFOxLSwEaqwlq8S
         1TqPArINX6urhJ7QE6Tj/dZsi7xtTd5yufP+aNnjriYpgnewpDwyySFoeTmdJZY7sCAg
         I6djbGptaZQzqR6o2iaIB8ifhTzb55gLGECe+lZp7MmGeVCLPYCsJE+ISNAkAkwFcml4
         u0Ig==
X-Gm-Message-State: ACrzQf2Bn8VTzZ92aqXKTDQ5+jI83QliTWVYRJ8pSdSHvsuA28irMAn1
	W0c9OwmM7k+xsrO6tYSucRWM1btbhsA=
X-Google-Smtp-Source: AMsMyM6bj/b8Vp4cAfCg1no2f6ax4I0ptcgjquR9WxzfTsePaZ203iAarPy0okqqJPrX9vsOs1g39g==
X-Received: by 2002:a17:907:d22:b0:78e:2788:51ae with SMTP id gn34-20020a1709070d2200b0078e278851aemr34582590ejc.689.1667586114624;
        Fri, 04 Nov 2022 11:21:54 -0700 (PDT)
Received: from [192.168.1.100] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id k22-20020aa7c396000000b00461bd82581asm51030edq.84.2022.11.04.11.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 11:21:54 -0700 (PDT)
Message-ID: <754301ee-c430-60ff-1c87-ba96fd032550@gmail.com>
Date: Fri, 4 Nov 2022 19:21:52 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] staging: r8188eu: change return type of
 rtw_set_802_11_disassociate to void
Content-Language: en-US
To: Phillip Potter <phil@philpotter.co.uk>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, paskripkin@gmail.com, straube.linux@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221103230632.6946-1-phil@philpotter.co.uk>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221103230632.6946-1-phil@philpotter.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/22 00:06, Phillip Potter wrote:
> Change return type of rtw_set_802_11_disassociate to void. This function
> always returns 'true' no matter what, so there is no need to return a
> value, and no need to check for it in the two call sites within
> rtw_wx_set_mlme. Also, as we are no longer using ret in rtw_wx_set_mlme
> except as the return value, just remove it and return 0 directly.
> 
> Suggested-by: Michael Straube <straube.linux@gmail.com>
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---
> 
> Changes from V1: Act on feedback from Michael Straube:
> * Remove ret variable from rtw_wx_set_mlme and return 0 directly in
>    success case.
> 
> ---
>   drivers/staging/r8188eu/core/rtw_ioctl_set.c    | 4 +---
>   drivers/staging/r8188eu/include/rtw_ioctl_set.h | 2 +-
>   drivers/staging/r8188eu/os_dep/ioctl_linux.c    | 9 +++------
>   3 files changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_ioctl_set.c b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
> index 786431826659..785c0dba508f 100644
> --- a/drivers/staging/r8188eu/core/rtw_ioctl_set.c
> +++ b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
> @@ -314,7 +314,7 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
>   	return true;
>   }
>   
> -u8 rtw_set_802_11_disassociate(struct adapter *padapter)
> +void rtw_set_802_11_disassociate(struct adapter *padapter)
>   {
>   	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
>   
> @@ -328,8 +328,6 @@ u8 rtw_set_802_11_disassociate(struct adapter *padapter)
>   	}
>   
>   	spin_unlock_bh(&pmlmepriv->lock);
> -
> -	return true;
>   }
>   
>   u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_ssid *pssid, int ssid_max_num)
> diff --git a/drivers/staging/r8188eu/include/rtw_ioctl_set.h b/drivers/staging/r8188eu/include/rtw_ioctl_set.h
> index abe460d6504d..c3eb2479f27b 100644
> --- a/drivers/staging/r8188eu/include/rtw_ioctl_set.h
> +++ b/drivers/staging/r8188eu/include/rtw_ioctl_set.h
> @@ -12,7 +12,7 @@ u8 rtw_set_802_11_authentication_mode(struct adapter *adapt,
>   				      enum ndis_802_11_auth_mode authmode);
>   u8 rtw_set_802_11_bssid(struct adapter *adapter, u8 *bssid);
>   u8 rtw_set_802_11_add_wep(struct adapter *adapter, struct ndis_802_11_wep *wep);
> -u8 rtw_set_802_11_disassociate(struct adapter *adapter);
> +void rtw_set_802_11_disassociate(struct adapter *adapter);
>   u8 rtw_set_802_11_bssid_list_scan(struct adapter *adapter,
>   				  struct ndis_802_11_ssid *pssid,
>   				  int ssid_max_num);
> diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> index dda48a2a6d0c..8e9b7b0664bc 100644
> --- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> +++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> @@ -1011,7 +1011,6 @@ static int rtw_wx_set_mlme(struct net_device *dev,
>   			     struct iw_request_info *info,
>   			     union iwreq_data *wrqu, char *extra)
>   {
> -	int ret = 0;
>   	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
>   	struct iw_mlme *mlme = (struct iw_mlme *)extra;
>   
> @@ -1020,17 +1019,15 @@ static int rtw_wx_set_mlme(struct net_device *dev,
>   
>   	switch (mlme->cmd) {
>   	case IW_MLME_DEAUTH:
> -		if (!rtw_set_802_11_disassociate(padapter))
> -			ret = -1;
> +		rtw_set_802_11_disassociate(padapter);
>   		break;
>   	case IW_MLME_DISASSOC:
> -		if (!rtw_set_802_11_disassociate(padapter))
> -			ret = -1;
> +		rtw_set_802_11_disassociate(padapter);
>   		break;
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> -	return ret;
> +	return 0;
>   }
>   
>   static int rtw_wx_set_scan(struct net_device *dev, struct iw_request_info *a,

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
