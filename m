Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C352F21
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 19:13:46 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id k13so6063193lfg.9
        for <linux-staging@lists.linux.dev>; Wed, 09 Feb 2022 11:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZqCsdtECQHXTZr8IpF8umy+6Cux+k4bWSLZZ1TOrY2Q=;
        b=IKDerEohVoRWS2zeh1Y+i/Y+oGfN/IIFKarRBaZ8JIubn4k6oVNLzPazkiW0fwezsf
         YxdtZPi0pw6Ij6mW7ItW3Vu5BrLzjD+LRKptIqk7vpZCndqBNDg4TNKyAxLECgzKxWh+
         +EHkydPog7Qvffd6Q0vrtErsXbnjvk60VQKwnagxLJoXh0SHAw5lbolnlCfSliKBdCwJ
         j8lF22zTpYNrWaDlsk0VQiQlgzS35UoMx9OeFTL2Esv4YFAiXkfnnpGzIVZ+yJMrT75i
         TzrEaR1OlxYBKfqDgtHCj+/6OzYw8fAuAxpstNl2j2awsd7nHBl/HOHk3cA3onHVIDZi
         BLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZqCsdtECQHXTZr8IpF8umy+6Cux+k4bWSLZZ1TOrY2Q=;
        b=XNVc6Zvo6SlNBligi1XacSWkrOZLZ7RTJQ9Ir2Rq8y/NmsV9/Uvwnv/b+SJq14obtx
         cyNBFJB1SLc97o8dysDwKKTD08qaqt6Hg4Jmn8RrtnT0ls2/XAd24oBwViqU8k4yBZcf
         SFduM7kSnLHEFwevNvFEHpzbWfcXx81NhFTYJncc8dK4rmJflQDZm/P84zwYlzq6+sXf
         cLgTCX/4j9EaqaLD3y9wbOQ4Cu5PD0QHxnwdxzVabdninDHNvg8YixFu6qcLgsCv9eTt
         /MYwI6YvkBUk+FgIIRONUQB8fxlxwgHsDvOiH74HMruzVuF5F2OJ5gTfSD+OyXy6rpeE
         BGfw==
X-Gm-Message-State: AOAM531k3CwqkJ9ERK3ez3TIf9rhDwblmtjd+7puCSzhDy++WPiqtniY
	t3YPYK0H0hmsGlTeEKEmGOw=
X-Google-Smtp-Source: ABdhPJy2qb10/B3KYND0/XbklU+DF93Riccx+K8hpY8eKGvHyAvHrLZ+V/+7irT5D4ivxTQ3OQ448Q==
X-Received: by 2002:a05:6512:3c96:: with SMTP id h22mr2539605lfv.262.1644434024921;
        Wed, 09 Feb 2022 11:13:44 -0800 (PST)
Received: from [192.168.1.11] ([217.117.245.154])
        by smtp.gmail.com with ESMTPSA id bt24sm285368lfb.246.2022.02.09.11.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 11:13:44 -0800 (PST)
Message-ID: <a67d6a88-491c-a393-6157-7de31375325d@gmail.com>
Date: Wed, 9 Feb 2022 22:13:42 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] staging: r8188eu: keep the success path and error path
 separate
Content-Language: en-US
To: Vihas Makwana <makvihas@gmail.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>, Martin Kaiser <martin@kaiser.cx>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220209190752.7232-1-makvihas@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220209190752.7232-1-makvihas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vihas,

On 2/9/22 22:07, Vihas Makwana wrote:
> Keep the success path and error path separate in rtw_usb_if1_init() and
> drop the "status" variable.
> Also, remove do-nothing gotos.
> 
> Signed-off-by: Vihas Makwana <makvihas@gmail.com>
> ---

Looks good, thanks

Reviewed-by: Pavel Skripkin <paskripkin@gmail.com>

> v1->v2:
>      Just `return NULL` instead of `padapter=NULL/return padapter`
>   drivers/staging/r8188eu/os_dep/usb_intf.c | 30 +++++++++--------------
>   1 file changed, 12 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
> index 10c33e2ae..668e79a3c 100644
> --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
> +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
> @@ -336,13 +336,13 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
>   {
>   	struct adapter *padapter = NULL;
>   	struct net_device *pnetdev = NULL;
> -	int status = _FAIL;
>   	struct io_priv *piopriv;
>   	struct intf_hdl *pintf;
>   
>   	padapter = vzalloc(sizeof(*padapter));
>   	if (!padapter)
> -		goto exit;
> +		return NULL;
> +
>   	padapter->dvobj = dvobj;
>   	dvobj->if1 = padapter;
>   
> @@ -421,26 +421,20 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
>   		, padapter->hw_init_completed
>   	);
>   
> -	status = _SUCCESS;
> +	return padapter;
>   
>   free_drv_sw:
> -	if (status != _SUCCESS) {
> -		rtw_cancel_all_timer(padapter);
> -		rtw_free_drv_sw(padapter);
> -	}
> +	rtw_cancel_all_timer(padapter);
> +	rtw_free_drv_sw(padapter);
>   handle_dualmac:
> -	if (status != _SUCCESS)
> -		rtw_handle_dualmac(padapter, 0);
> +	rtw_handle_dualmac(padapter, 0);
>   free_adapter:
> -	if (status != _SUCCESS) {
> -		if (pnetdev)
> -			rtw_free_netdev(pnetdev);
> -		else if (padapter)
> -			vfree(padapter);
> -		padapter = NULL;
> -	}
> -exit:
> -	return padapter;
> +	if (pnetdev)
> +		rtw_free_netdev(pnetdev);
> +	else if (padapter)
> +		vfree(padapter);
> +
> +	return NULL;
>   }
>   
>   static void rtw_usb_if1_deinit(struct adapter *if1)


With regards,
Pavel Skripkin
