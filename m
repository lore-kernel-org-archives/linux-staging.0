Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DA43FC2
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 16:22:11 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id s25so14699384edw.0
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 09:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TF7JUFsQPDWcLYdKRqO8XAUiSDxHEbbClOj9sJNmRqc=;
        b=pg06Kz+WkTC16TVQsiF8NAwp8neuw+WECJE0ZgwPKyOCGjVq4zuntK+EUf858EZN8x
         tgwLwq8OJsDf0DNK1HShbI+/Sg1y2+HeJJ6FqQ8rnmPgvbqYX/4hxZMkfRXk0M2LrkM/
         M9bU6gIO8BfO2nSQW9kJpvnPwMvRXhHgCTA4+MxjW5VUSLEgeJS+V/hPZGVi+7zHt2SM
         ET5ia0Lkn2M5LeelzwIFM3t6tOotjUMpcyRVFmZvLv7Wkpv1ws90Uibdtr3SFU7AguxT
         tPq8hSJOglB9EW8B8cTZSijKhzpTR1CYirAYVpHlgbwKLSeSHlBQ/G+Q+Lah53a6DyhF
         9IZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TF7JUFsQPDWcLYdKRqO8XAUiSDxHEbbClOj9sJNmRqc=;
        b=rTl/B/dvY1MDIYUGZ1p4kcSQbBRnMOQ/ouI7wuUjWHsnK/ke03ilsS41evVm4ThcTO
         fBokWuEjMo0NN2SUP0E+dD4+v32bky7oBRkj6KnW6FUYJvUdoKR14fZ8Ava1Gl34m0fU
         miwBuXrSRclzySQv+tSSgcKlyVn019PyxEf3yQtUkoYOVAHf+XdnG04sg7PNaXq8OL8f
         NAbVObcfwZhGvEMFcyefC46lcCjt6JrxQBrqT+fgH+BoGZXfEwOjVcO6KN1IRDbO7mfB
         FkJtdmrs4U9qe+1Ud3cjpTwbLR9l3sbe3t2K68rY0kVq1ZjN4fMondM2eHFw8VNFHDO2
         scLg==
X-Gm-Message-State: AOAM531EAT10f1epwNfDUaupqcVesyq1KJOcSNa50vCXn30TUY2PQ7/h
	62YAryvhHT1yvmEUepHsdgc=
X-Google-Smtp-Source: ABdhPJx8NE9yF9rnSzHACWYgiYrUDfZpolR7S6CTEpDBzSCeMnfd69UKzp5Gutsr5361G+as9hqekA==
X-Received: by 2002:aa7:d0c3:: with SMTP id u3mr15574460edo.158.1630167730252;
        Sat, 28 Aug 2021 09:22:10 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::884b? ([2a02:8108:96c0:3b88::884b])
        by smtp.gmail.com with UTF8SMTPSA id i11sm4993832edu.97.2021.08.28.09.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Aug 2021 09:22:09 -0700 (PDT)
Message-ID: <9f5b45b7-050c-1a10-25f1-ca1d7543f602@gmail.com>
Date: Sat, 28 Aug 2021 18:22:07 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH] staging: r8188eu: core: remove unused function
Content-Language: en-US
To: Saurav Girepunje <saurav.girepunje@gmail.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org, fmdefrancesco@gmail.com,
 martin@kaiser.cx, linux-staging@lists.linux.dev
Cc: saurav.girepunje@hotmail.com
References: <YSpP0+aHdq3Roleo@user>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <YSpP0+aHdq3Roleo@user>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/28/21 17:01, Saurav Girepunje wrote:
> Remove unused function proc_get_adapter_state() from rtw_debug.c file.
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_debug.c    | 15 ---------------
>   drivers/staging/r8188eu/include/rtw_debug.h |  4 ----
>   2 files changed, 19 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_debug.c b/drivers/staging/r8188eu/core/rtw_debug.c
> index 2ee64cef73f7..c5bb8b05b3c2 100644
> --- a/drivers/staging/r8188eu/core/rtw_debug.c
> +++ b/drivers/staging/r8188eu/core/rtw_debug.c
> @@ -264,21 +264,6 @@ int proc_get_ap_info(char *page, char **start,
>   	return len;
>   }
> 
> -int proc_get_adapter_state(char *page, char **start,
> -			  off_t offset, int count,
> -			  int *eof, void *data)
> -{
> -	struct net_device *dev = data;
> -	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
> -	int len = 0;
> -
> -	len += snprintf(page + len, count - len, "bSurpriseRemoved=%d, bDriverStopped=%d\n",
> -						padapter->bSurpriseRemoved, padapter->bDriverStopped);
> -
> -	*eof = 1;
> -	return len;
> -}
> -
>   int proc_get_trx_info(char *page, char **start,
>   			  off_t offset, int count,
>   			  int *eof, void *data)
> diff --git a/drivers/staging/r8188eu/include/rtw_debug.h b/drivers/staging/r8188eu/include/rtw_debug.h
> index 3c3bf2a4f30e..9de3a0ed12ba 100644
> --- a/drivers/staging/r8188eu/include/rtw_debug.h
> +++ b/drivers/staging/r8188eu/include/rtw_debug.h
> @@ -112,10 +112,6 @@ int proc_get_ap_info(char *page, char **start,
>   		     off_t offset, int count,
>   		     int *eof, void *data);
> 
> -int proc_get_adapter_state(char *page, char **start,
> -			   off_t offset, int count,
> -			   int *eof, void *data);
> -
>   int proc_get_trx_info(char *page, char **start,
>   		      off_t offset, int count,
>   		      int *eof, void *data);
> --
> 2.32.0
> 

Looks good to me.

Acked-by: Michael Straube <straube.linux@gmail.com>


Thanks,
Michael
