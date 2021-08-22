Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3823FC0
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 12:28:49 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id j12-20020a05600c1c0c00b002e6d80c902dso8916431wms.4
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 05:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1jPp7QEaPt1Sw5YHA6F6IZfCBjiMiNjX+vQKALZJ4QI=;
        b=eVg11WaVtYLB5ceZ8giZlV2tN6dioW/R3JazFuYxWaaNoCVeNxUnIeDAZ+VO4+AN6u
         uz4ViYuelrrHtsvEtK2ICH59/xo1VIkmd7FWdK8LJk6/EsmvqeptAHb5hNHcenN869i0
         g0we1hZpBpBa8BXy1gNpRdpU09ZaFGtvuRNAu1H0Yn28nHm8afXs05JDSL02e9vxCfm/
         HOApYjzLF3J9sInBiEO6Umb3QWi+WCJt1jm1wx0uJ5urh8lir+f5uNm+QPegCTVJDfX1
         kWbaD5BSdP/iecviZ9AyuLHtAK6Zu4z5ZF7gYWTGvDY//FvQhBSHLpxE1MJ0E+ufTGtF
         mZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1jPp7QEaPt1Sw5YHA6F6IZfCBjiMiNjX+vQKALZJ4QI=;
        b=aY4FMt9s7ALXD8+pCFn0z9JV0tHZEWoFqNGMvwPyuDpa81efmflBh7jDISSxogo3eU
         uRS9J/uYOttXYT/+qYSCL4aUMUNpkb0EqE5gxO/19j3LWjUBiahMPoGDKDMIsW/UGe4W
         ED1uMUftzqSe57LniEc50eH6rm85njhJtc8CAj/X0gUXUHfqaJQobJiRkEXVp78R+Vv0
         ZjQf9B3DsINlXewSQWPtJfntt7WlD70fssU/m6aiR1cS6CUG0qoPwgwRAoDCgmG1CwFN
         Ljr2bQTDoYeZoBWgTsHAR8NrRdJDLv9HeYiv7ABBfMGYlvk0gVDWymZZDe1lcI0TkQvW
         Gv1Q==
X-Gm-Message-State: AOAM532qsoR8KGA2mY1UrlvnaJWi9eZBHzM09m9dBX8CPhsFAoNlKKu2
	IYCZWvq/XQAXbEZvDaKGFyQ=
X-Google-Smtp-Source: ABdhPJydQRA/FCE3APD0sPKHzXyd7WiVc/HpIAwqKQa110LOXauvfeiaclR8MLzayJAxdW/dLPH8dg==
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr12230151wmk.51.1629635327606;
        Sun, 22 Aug 2021 05:28:47 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::687e? ([2a02:8108:96c0:3b88::687e])
        by smtp.gmail.com with ESMTPSA id n15sm500015wrv.48.2021.08.22.05.28.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Aug 2021 05:28:47 -0700 (PDT)
Subject: Re: [PATCH 07/10] staging: r8188eu: clean up the usb_writeXY
 functions
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210821164859.4351-1-martin@kaiser.cx>
 <20210821164859.4351-7-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <a146d415-3cd9-8ad1-4a20-06f304eb0487@gmail.com>
Date: Sun, 22 Aug 2021 14:27:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210821164859.4351-7-martin@kaiser.cx>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/21/21 6:48 PM, Martin Kaiser wrote:
> Remove unnecessary variables, summarize declarations and assignments.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/hal/usb_ops_linux.c | 50 ++++-----------------
>   1 file changed, 8 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> index cb969a200681..e01f1ac19596 100644
> --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> @@ -128,59 +128,25 @@ static u32 usb_read32(struct intf_hdl *pintfhdl, u32 addr)
>   
>   static int usb_write8(struct intf_hdl *pintfhdl, u32 addr, u8 val)
>   {
> -	u16 wvalue;
> -	u16 len;
> -	u8 data;
> -	int ret;
> -
> -
> -	wvalue = (u16)(addr & 0x0000ffff);
> -	len = 1;
> -	data = val;
> -	ret = usbctrl_vendorreq(pintfhdl, wvalue, &data, len, REALTEK_USB_VENQT_WRITE);
> +	u16 wvalue = (u16)(addr & 0x0000ffff);
>   
> -	return ret;
> +	return usbctrl_vendorreq(pintfhdl, wvalue, &val, 1, REALTEK_USB_VENQT_WRITE);
>   }
>   
>   static int usb_write16(struct intf_hdl *pintfhdl, u32 addr, u16 val)
>   {
> -	u16 wvalue;
> -	u16 len;
> -	__le32 data;
> -	int ret;
> -
> -
> -
> -	wvalue = (u16)(addr & 0x0000ffff);
> -	len = 2;
> -
> -	data = cpu_to_le32(val & 0x0000ffff);
> -
> -	ret = usbctrl_vendorreq(pintfhdl, wvalue, &data, len, REALTEK_USB_VENQT_WRITE);
> -
> -
> +	u16 wvalue = (u16)(addr & 0x0000ffff);
> +	__le32 data = cpu_to_le32(val & 0x0000ffff);
>   
> -	return ret;
> +	return usbctrl_vendorreq(pintfhdl, wvalue, &data, 2, REALTEK_USB_VENQT_WRITE);
>   }
>   
>   static int usb_write32(struct intf_hdl *pintfhdl, u32 addr, u32 val)
>   {
> -	u16 wvalue;
> -	u16 len;
> -	__le32 data;
> -	int ret;
> -
> -
> -
> -	wvalue = (u16)(addr & 0x0000ffff);
> -	len = 4;
> -	data = cpu_to_le32(val);
> -
> -	ret = usbctrl_vendorreq(pintfhdl, wvalue, &data, len, REALTEK_USB_VENQT_WRITE);
> -
> -
> +	u16 wvalue = (u16)(addr & 0x0000ffff);
> +	__le32 data = cpu_to_le32(val);
>   
> -	return ret;
> +	return usbctrl_vendorreq(pintfhdl, wvalue, &data, 4, REALTEK_USB_VENQT_WRITE);
>   }
>   
>   static int usb_writeN(struct intf_hdl *pintfhdl, u32 addr, u32 length, u8 *pdata)
> 

Looks good to me.

Acked-by: Michael Straube <straube.linux@gmail.com>

Thanks,
Michael
