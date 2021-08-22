Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD5D3FC0
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 12:26:01 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id v10so10483201wrd.4
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 05:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=T7fSKli+UNhh3LDQln8Jkh3y6lz/VRyR8HfJLUjKlNA=;
        b=FBK1FL8fNHSQq1gCBSj6Ap9Osp+vqwiW2nN/mJ7UHg0KhPNhgMpgOjTADqc8ZjZ5y/
         aYiyt3HdzP++MSArOyajt5fIKzW3CPOCQOEbqweJB/+FtkmFe1JxZHcvLJsdYxhGr/Lx
         3FmFIpJZzoTOSvH35pgae4Rrffu85OVgXgMRF7Fcm+O5EYWUrcAQvA4+pGqmeUwPaEnZ
         iBmsSp3FugzE4PaEt8gylxyClQLcSnHMZSLLOT1clfwYIjpTBZlECEBRCaWcbouo0oJ2
         /1V/VIh1gkBXLTgCfodAh8KXMLKk1280XBWoNb1ipDEDSNCQLEWLw86zarhw7b1SBNhf
         ghUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=T7fSKli+UNhh3LDQln8Jkh3y6lz/VRyR8HfJLUjKlNA=;
        b=ogNkjINmFxQCTc7lQN5svBGR+exZ53N8mmn4lcu1nv1B+T1obxrPsdTJDDakG1CVhu
         rBupgHADHqt17Ww3zRQxSv2+H9/H33rtwkAHFsSn5G3j5ovI8zuhImSNwLRSY7I887Vc
         lnXjajmVHry3xsYcIE1Cu280QeZGu3Qr90sv7Mn+GNsfVTQPNspa1q+h/vQN4Yriei1R
         4JV7Ed0MCpZe4T1A2cIAtVpA2Zz2gwSKSKNMSgI0Sc5gwNVPnb9D+ABHtgSW0nMx82FM
         5pceWbqAiOrKF7KsJk5Zibta8KTBvS1WD/whggG+Yt80lr8jGD5jSNZHo4X8JA8ern7v
         Yp2w==
X-Gm-Message-State: AOAM533a3ebV83E9pRhHFZi1Oz0+vs6w9TDZB+TedrG1lN28436EJjlW
	h/EIaci/M4xnXKZ2KfBUTFw=
X-Google-Smtp-Source: ABdhPJyaUoGaLCl96GnyolGyPnFrfkYmoWgVBeON8SM1TyUuJcwolju3RU7XbBckEzWk4XPWoM9rVA==
X-Received: by 2002:a5d:49cd:: with SMTP id t13mr8396394wrs.217.1629635160105;
        Sun, 22 Aug 2021 05:26:00 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::687e? ([2a02:8108:96c0:3b88::687e])
        by smtp.gmail.com with ESMTPSA id x11sm4386842wro.83.2021.08.22.05.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Aug 2021 05:25:59 -0700 (PDT)
Subject: Re: [PATCH 06/10] staging: r8188eu: clean up the usb_readXY functions
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210821164859.4351-1-martin@kaiser.cx>
 <20210821164859.4351-6-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <ada3cb7d-79a2-791e-1744-b6f8ab380486@gmail.com>
Date: Sun, 22 Aug 2021 14:25:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210821164859.4351-6-martin@kaiser.cx>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/21/21 6:48 PM, Martin Kaiser wrote:
> Remove unnecessary variables, summarize declarations and assignments.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/hal/usb_ops_linux.c | 30 +++++----------------
>   1 file changed, 7 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> index dccb9fd34777..cb969a200681 100644
> --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> @@ -98,46 +98,30 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
>   
>   static u8 usb_read8(struct intf_hdl *pintfhdl, u32 addr)
>   {
> -	u16 wvalue;
> -	u16 len;
> -	u8 data = 0;
> -
> -
> -
> -	wvalue = (u16)(addr & 0x0000ffff);
> -	len = 1;
> -
> -	usbctrl_vendorreq(pintfhdl, wvalue, &data, len, REALTEK_USB_VENQT_READ);
> -
> +	u16 wvalue = (u16)(addr & 0x0000ffff);
> +	u8 data;
>   
> +	usbctrl_vendorreq(pintfhdl, wvalue, &data, 1, REALTEK_USB_VENQT_READ);
>   
>   	return data;
> -
>   }
>   
>   static u16 usb_read16(struct intf_hdl *pintfhdl, u32 addr)
>   {
> -	u16 wvalue;
> -	u16 len;
> +	u16 wvalue = (u16)(addr & 0x0000ffff);
>   	__le32 data;
>   
> -	wvalue = (u16)(addr & 0x0000ffff);
> -	len = 2;
> -	usbctrl_vendorreq(pintfhdl, wvalue, &data, len, REALTEK_USB_VENQT_READ);
> +	usbctrl_vendorreq(pintfhdl, wvalue, &data, 2, REALTEK_USB_VENQT_READ);
>   
>   	return (u16)(le32_to_cpu(data) & 0xffff);
>   }
>   
>   static u32 usb_read32(struct intf_hdl *pintfhdl, u32 addr)
>   {
> -	u16 wvalue;
> -	u16 len;
> +	u16 wvalue = (u16)(addr & 0x0000ffff);
>   	__le32 data;
>   
> -	wvalue = (u16)(addr & 0x0000ffff);
> -	len = 4;
> -
> -	usbctrl_vendorreq(pintfhdl, wvalue, &data, len, REALTEK_USB_VENQT_READ);
> +	usbctrl_vendorreq(pintfhdl, wvalue, &data, 4, REALTEK_USB_VENQT_READ);
>   
>   	return le32_to_cpu(data);
>   }
> 

Looks good to me.

Acked-by: Michael Straube <straube.linux@gmail.com>

Thanks,
Michael
