Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A149C2C80
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 17:43:24 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id k37-20020a05600c1ca500b00330cb84834fso8931612wms.2
        for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 09:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TN/QQkM1NntF1m6fJ6zPw0ksMJntIEEt1v1JsMs1Xxo=;
        b=B1VT2bhTux1ksTjwklT4nU8DwdebnyeqDKHMURVCvjSfmdeO1f/8M2a9FWPxk5FCGS
         OOkYiv9ftxyumKk2tbeuPy6mBkAQLiKPns7VlGlGV5ofSxb9gIkCdiAWMrseQwRsKDoh
         gcPu/JksJjPXXfceYxQv/W7m7lJ2aCHKDBrqLOcm6EaUtzTKCnqVLZE6ATUAk1lmpziL
         VhCTNvVp8Dn9DYXRMx6cY58qYUe0gKNWCQQ8vPT7zMRV+H3fbx5getsGTqV+gOwhoHSJ
         eugfrVYM9RG3zwx5qSuP1fxUf4gjyQEyXAagV/O/6j+e5lPSeqEk8erqsqdKhnEVZ2DZ
         WKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TN/QQkM1NntF1m6fJ6zPw0ksMJntIEEt1v1JsMs1Xxo=;
        b=WHbkG7sdcSospuZRUCJK9/K2mwfWuQXfOs0SotN2zIM+RumwO5UV5aMjcFAnkFxleR
         WQ0xwNDuRp8gZ3k8lr4TMXcAAbwQBLr6u+hTKMuTVWkBj0OWolJuLodwAOauktOq7Oh9
         ELYrGpcRt2BA+PAbZTRkw5xUD/tAsF7OxkFQwu0D4pCoH/J2gBkq3+9metVcFwVKcoCI
         CF/9ma2kN1po9tXxrNcDcqflujRUdaNybOMnEqfTuhdi1MI636DusPTQoLRiJmqGfkJy
         zq4SQQ1eVs56Kd/nh1rNKo2Lz6CFwy8LUvO/+r0fgMuV+XPKfeXLthOuqvrRlK8dwn2R
         kgGw==
X-Gm-Message-State: AOAM533lRS4LN+2VwU+nIQXL6TCIO924fjLk2S0Pp/ePFByMDu2WBNh7
	z9dBFmknSm3OZ9PPyne06EE=
X-Google-Smtp-Source: ABdhPJxu1FQCs/jtd196x1cJ2eMVoJbQ2skwTguVLKbWh/iEbr/dKD9GzyfX56fGeuMtaP/s0Ai/oA==
X-Received: by 2002:a05:600c:4e45:: with SMTP id e5mr9548080wmq.43.1637862202950;
        Thu, 25 Nov 2021 09:43:22 -0800 (PST)
Received: from ?IPV6:2a02:8108:96c0:3b88::7311? ([2a02:8108:96c0:3b88::7311])
        by smtp.gmail.com with ESMTPSA id f7sm4168768wri.74.2021.11.25.09.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 09:43:22 -0800 (PST)
Message-ID: <813f1715-181f-515b-46c9-fafa374453a2@gmail.com>
Date: Thu, 25 Nov 2021 18:43:21 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/4] staging: r8188eu: remove pm_netdev_open
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211125164745.8188-1-martin@kaiser.cx>
 <20211125164745.8188-2-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20211125164745.8188-2-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/25/21 17:47, Martin Kaiser wrote:
> The only caller of pm_netdev_open sets bnormal to true. In this case,
> pm_netdev_open just calls netdev_open.
> 
> Remove pm_netdev_open and call netdev_open directly.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/include/usb_osintf.h |  1 -
>   drivers/staging/r8188eu/os_dep/os_intfs.c    | 11 -----------
>   drivers/staging/r8188eu/os_dep/usb_intf.c    |  2 +-
>   3 files changed, 1 insertion(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/include/usb_osintf.h b/drivers/staging/r8188eu/include/usb_osintf.h
> index 624298b4bd0b..3e777ca52745 100644
> --- a/drivers/staging/r8188eu/include/usb_osintf.h
> +++ b/drivers/staging/r8188eu/include/usb_osintf.h
> @@ -16,7 +16,6 @@ extern int rtw_mc2u_disable;
>   u8 usbvendorrequest(struct dvobj_priv *pdvobjpriv, enum bt_usb_request brequest,
>   		    enum rt_usb_wvalue wvalue, u8 windex, void *data,
>   		    u8 datalen, u8 isdirectionin);
> -int pm_netdev_open(struct net_device *pnetdev, u8 bnormal);
>   void netdev_br_init(struct net_device *netdev);
>   void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb);
>   void *scdb_findEntry(struct adapter *priv, unsigned char *ipAddr);
> diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
> index 5a5f182d30c9..397981bc9a62 100644
> --- a/drivers/staging/r8188eu/os_dep/os_intfs.c
> +++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
> @@ -760,17 +760,6 @@ void rtw_ips_dev_unload(struct adapter *padapter)
>   		rtw_hal_deinit(padapter);
>   }
>   
> -int pm_netdev_open(struct net_device *pnetdev, u8 bnormal)
> -{
> -	int status;
> -
> -	if (bnormal)
> -		status = netdev_open(pnetdev);
> -	else
> -		status =  (_SUCCESS == ips_netdrv_open((struct adapter *)rtw_netdev_priv(pnetdev))) ? (0) : (-1);
> -	return status;
> -}
> -
>   int netdev_close(struct net_device *pnetdev)
>   {
>   	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(pnetdev);
> diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
> index eca1036a721f..984e408f9366 100644
> --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
> +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
> @@ -298,7 +298,7 @@ static int rtw_resume(struct usb_interface *pusb_intf)
>   		pwrpriv->bkeepfwalive = false;
>   
>   	DBG_88E("bkeepfwalive(%x)\n", pwrpriv->bkeepfwalive);
> -	if (pm_netdev_open(pnetdev, true) != 0) {
> +	if (netdev_open(pnetdev) != 0) {
>   		mutex_unlock(&pwrpriv->lock);
>   		goto exit;
>   	}
> 

Reviewed-by: Michael Straube <straube.linux@gmail.com>
