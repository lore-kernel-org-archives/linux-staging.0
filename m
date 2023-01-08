Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891B4256A
	for <linux-staging@lists.linux.dev>; Sun,  8 Jan 2023 16:43:50 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id fy8so14547893ejc.13
        for <linux-staging@lists.linux.dev>; Sun, 08 Jan 2023 08:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1qSYeheKKTbQuWeKS3E1J2NUuqVJNCq9nE1pOULvlwM=;
        b=aNuD7uCbHuJoZneb2RVkRnwWJdXhlI73o+lHiIYSEpgau+fmrV7l0Sdtmx3XqXRvav
         bUhaxz1I4RFj9RCWNR9DKnybIi1XI/Dq5YPVQ0FoWwBUr2sgl/GSd9+f/5VqHjmBveiI
         dE1ImhM0gY5IORmeyQX7F+BKSXp5sXhwCwdsaZse7TI8awAzR0vteiVE+w8FNn1big+t
         9Z7sZR8WWcwYRMqMoc52AFAKeTt4ByAAH5ix84hoRVF92+6f5h7ZorjbJaicBaTsm+tx
         errbaMIxMGeFEJ5sjyI0PgWqBgds0rpk/1ti3TXoydmnGS73SS/F3xdoEw9S8ne3/h/c
         xrNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1qSYeheKKTbQuWeKS3E1J2NUuqVJNCq9nE1pOULvlwM=;
        b=QSaq0C4URH902ydEzk74WXU/+8WOAYd709gv5cqJFkZPYopYeq4veikcLBCB5uvIGM
         kt2rPnZTFY4fLWh0SrxU6whoV9ub2wfmyF0ZchPailSjDuYss65TbmWjSKZ7BT3Pcbyf
         nrlRPbiIXsqiHvQAuihUk8JuT9uRov1Jctt79lS6kneOXcN2d6VGvRLWtpv+qSBDJGoh
         kdeoUQcjuqO+0taVxtUfbjljD4eOkUHSmlPALmCaqNsTJFttflLbf4MVhNwvI1ZmBJLJ
         MJ3Jr2wU4vQIIliNnGL8soZh5PQFGFQWlrfJQXRRrnoGnnd4v2ZRjljEV3LioAzUoy/G
         2lEQ==
X-Gm-Message-State: AFqh2koqkdwEhg0/GsbSo/Eei59ftuKqlhpWhNnqfRFNWIB5hWZ/VX7X
	nQRPIhgLsNFMg+nUbg5HLo4=
X-Google-Smtp-Source: AMrXdXuDaO6OKioHRedbTGXTeBvgg0JrRgP7fUZfb/Z6HiTyvxSnxUj7oQ5cRRAARl9Q4AZpcU1AAA==
X-Received: by 2002:a17:907:9d0e:b0:7c1:6433:90ab with SMTP id kt14-20020a1709079d0e00b007c1643390abmr12791367ejc.5.1673196228600;
        Sun, 08 Jan 2023 08:43:48 -0800 (PST)
Received: from [192.168.1.102] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id ja25-20020a170907989900b0084d1160a19dsm2701040ejc.98.2023.01.08.08.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jan 2023 08:43:48 -0800 (PST)
Message-ID: <47aa174f-d284-6dad-c684-5ee42c736ada@gmail.com>
Date: Sun, 8 Jan 2023 17:43:47 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] staging: r8188eu: convert rtw_writeN() to common error
 logic
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230108123804.3754-1-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230108123804.3754-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/8/23 13:38, Michael Straube wrote:
> Convert the function rtw_writeN() away from returning _FAIL or
> _SUCCESS which uses inverted error logic. Use the common error logic
> instead. Return 0 for success and negative values for failure.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
> Tested on x86_64 with Inter-Tech DMG-02.
> 
>   drivers/staging/r8188eu/core/rtw_fw.c       | 10 ++++------
>   drivers/staging/r8188eu/hal/usb_ops_linux.c |  7 ++-----
>   2 files changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
> index 682c65b1e04c..1e4baf74ecd5 100644
> --- a/drivers/staging/r8188eu/core/rtw_fw.c
> +++ b/drivers/staging/r8188eu/core/rtw_fw.c
> @@ -89,9 +89,8 @@ static int block_write(struct adapter *padapter, u8 *buffer, u32 size)
>   		addr = FW_8188E_START_ADDRESS + i * block_size;
>   		data = buffer + i * block_size;
>   
> -		ret = rtw_writeN(padapter, addr, block_size, data);
> -		if (ret == _FAIL)
> -			goto exit;
> +		if (rtw_writeN(padapter, addr, block_size, data))
> +			return _FAIL;
>   	}
>   
>   	if (remain) {
> @@ -105,9 +104,8 @@ static int block_write(struct adapter *padapter, u8 *buffer, u32 size)
>   			addr = FW_8188E_START_ADDRESS + offset + i * block_size;
>   			data = buffer + offset + i * block_size;
>   
> -			ret = rtw_writeN(padapter, addr, block_size, data);
> -			if (ret == _FAIL)
> -				goto exit;
> +			if (rtw_writeN(padapter, addr, block_size, data))
> +				return _FAIL;
>   		}
>   	}
>   
> diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> index 7c72f5e04d9b..f02f8568cdcf 100644
> --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> @@ -179,14 +179,11 @@ int rtw_writeN(struct adapter *adapter, u32 addr, u32 length, u8 *data)
>   	struct io_priv *io_priv = &adapter->iopriv;
>   	struct intf_hdl *intf = &io_priv->intf;
>   	u16 value = addr & 0xffff;
> -	int ret;
>   
>   	if (length > VENDOR_CMD_MAX_DATA_LEN)
> -		return _FAIL;
> +		return -EINVAL;
>   
> -	ret = usb_write(intf, value, data, length);
> -
> -	return RTW_STATUS_CODE(ret);
> +	return usb_write(intf, value, data, length);
>   }
>   
>   static void handle_txrpt_ccx_88e(struct adapter *adapter, u8 *buf)

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
