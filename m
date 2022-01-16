Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3669173
	for <linux-staging@lists.linux.dev>; Sun, 16 Jan 2022 21:47:07 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id bu18so27508683lfb.5
        for <linux-staging@lists.linux.dev>; Sun, 16 Jan 2022 13:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EvCUOP5l/xUm9Ih4QfQxYRATDJQR7bxJhJawcjpWBaQ=;
        b=Txv/NF3iEKEyQK1LuA1INgaaW3XLF23PzWKv3Ya6f01kRqh/aYGa3UohY2ARes5Tdu
         aT3inXEKixY/mZm8gaNM+nE2ms7FKWYRW3XPs/j+TRUTvy44fIWDYWvbg5iiRFkn1HmZ
         lLlEhmaOx+HBbtmtlbH9W91YyHxdj+DB1R0WVZNlJYP8fI7M9fm+br0iwo+qiSbYUymG
         o66X2pd4MpBgZXtEcmiz/1v0N2PGVCLQD8Lz0DAJg83JMZUbepjiP0evy617n8ZIzD9g
         eFoTUemnSFEmU5XP8yzuc9HU2aA/hrH+g3UkVQZoXXBcDd7PURpiSWaC4HzBz4JmfDl2
         G/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EvCUOP5l/xUm9Ih4QfQxYRATDJQR7bxJhJawcjpWBaQ=;
        b=Y9lt7nN2ws3bccGvQVZwQ6XHJU+W8lAAtW6vJghCxIc65a92b5zmQXzsQT6oadGISU
         h12tMkHGljZ3tLRIxpfgggMo100X9MDa3PtjRTavkl0SWDL/7OAE8aWVW93GByWB6b4f
         l3EmkH99QKwPbD+ae1bWUAbJcv0pC2bL4ieLaT8ypKkOYWmA0CxfDzO0o+/LUTpDTMAz
         dymf1lqSqTkEXLL8qJJ5gMOa44m4+9QL3IyRMmUlpSWu6eKdUpL1NUYAZR9mzwkXMsJd
         J2XcY9UZ3gDuMNRqcQdG0vWBZg+2zKbNHkHPE8SthmnJQ8paVb5eHxdVR/8tGKZZZCHM
         ZDFA==
X-Gm-Message-State: AOAM533qzWmoxnV4/S7N9Zt/26KPUYL9aEqPFra+qXqT4IOOnwh23q9Y
	1UeYSEAdfOYNaj/ssAP0eYs=
X-Google-Smtp-Source: ABdhPJyDya66CkmXshaXuImVg7rp1Y+lioNQqwieC9gFb7QSx0Qacr8x4blt2Qf3sU+PUxkaRx9+2g==
X-Received: by 2002:a2e:98c5:: with SMTP id s5mr14268358ljj.221.1642369625327;
        Sun, 16 Jan 2022 13:47:05 -0800 (PST)
Received: from [192.168.1.11] ([217.117.245.67])
        by smtp.gmail.com with ESMTPSA id h3sm940703lft.74.2022.01.16.13.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jan 2022 13:47:04 -0800 (PST)
Message-ID: <c908c21f-1de3-cb70-7694-54b3db669da6@gmail.com>
Date: Mon, 17 Jan 2022 00:47:03 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] staging: r8188eu: handle rtw_init_netdev_name() failure
 appropriately
Content-Language: en-US
To: Vihas Mak <makvihas@gmail.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org, martin@kaiser.cx,
 straube.linux@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220116192611.19224-1-makvihas@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220116192611.19224-1-makvihas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vihas,

On 1/16/22 22:26, Vihas Mak wrote:
> rtw_init_netdev_name() calls dev_alloc_name() which allocates the name
> for the device as per the given name format.
> It returns a negative err code if the format is invalid. Currently the
> name format is specified by the module parameter "ifname".
> Warn the user if "ifname" is invalid.
> 
> Signed-off-by: Vihas Mak <makvihas@gmail.com>
> ---
>   drivers/staging/r8188eu/os_dep/usb_intf.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
> index 91792dfd3..875815b5e 100644
> --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
> +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
> @@ -399,7 +399,10 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
>   			DBG_88E("can't get autopm:\n");
>   
>   	/*  alloc dev name after read efuse. */
> -	rtw_init_netdev_name(pnetdev, padapter->registrypriv.ifname);
> +	if (rtw_init_netdev_name(pnetdev, padapter->registrypriv.ifname) < 0) {
> +		DBG_88E("rtw_init_netdev_name failed, ifname:%s\n",
> +			padapter->registrypriv.ifname);
> +	}
>   	rtw_macaddr_cfg(padapter->eeprompriv.mac_addr);
>   	rtw_init_wifidirect_addrs(padapter, padapter->eeprompriv.mac_addr,
>   				  padapter->eeprompriv.mac_addr);

rtw_init_netdev_name() has an error message in case of allocation 
failure. It looks like it's better to handle the error normally and pass 
it to caller




With regards,
Pavel Skripkin
