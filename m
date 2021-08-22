Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDF23FC1
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 13:25:36 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id f10so8822576wml.2
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 06:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kZw4V2Zva7YZ4ZIBobOrnt2elWvFQ0nGG2fMiXvkreg=;
        b=e9MHF138iOszSWiu/z/oFHbPB0n6q7aUnWysxNFTpiW0GA0/SR5eQIt5KlXXoiQPhT
         6KGTYbb6npHFiiMCwjjA2sNzdOBvnrDPEIFQTG+jyH7eKuFUKBUXE2zaBC1sbiOzMJ23
         UtcrQckzLt0P19mZbYZWm9iMqZ/e/1xp/DhhyifO/nKfeiX0OK5YCcVnMaoxr+fkhtMI
         LJ9M7a03BVa2wkn0sY9ppjg7HYJNiZCSKzaUpyiZAOVA3HaRiZTHwZ2Ej2Q2TEtWDptZ
         2lmgarcnDev9X3cuhI+hpBuDIOATfmW101pBYpk59vjwcdbZda0hbRTatIVxczdRwcxk
         Sq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kZw4V2Zva7YZ4ZIBobOrnt2elWvFQ0nGG2fMiXvkreg=;
        b=et4W7RMig1gT43aq15JZI/6OGY6WURSTUJjw4VBtarA24KtfSZuAXjAuxdmJJJ63I5
         yrsQobZvO6EDDkBtGjI7xZpZrIiAyaXb+6O0NicF1uBviZH3GkbDgyWo6Hg/vIWIPqde
         lh40CkLP0T2ZEL2O3zkIT6tRlbXXVCvmOuWyxUIyzLk9jhViDWKPhIU4tmlPTQNLSrwQ
         mhb4CNj2G6+Le5MSrR1ypuTYyxsMYbYyAQhpvAaD7xFikhH6c/7p5otgZ4kxlEOIlkU7
         HmYLmXp4Nw8XeNQjxh6L6eskKA02u2YIkf96QHQrX1+kYMJFxARJkLTbvTzkzwlwoC1x
         Mukg==
X-Gm-Message-State: AOAM530MpTo9n5j94dhlbGWEMY+itxBAcJqqtaGVQKKwimdoi7B3szhg
	vFheDIw5aEgGEd7CsPsg0rM=
X-Google-Smtp-Source: ABdhPJzJD/D5Vd4j8FYUKzHj6M0sF8kJAvRDQicS2NBxK4KpfLL6TCNaByg7u9S+h/wHX8gE29pLWA==
X-Received: by 2002:a05:600c:4656:: with SMTP id n22mr8006302wmo.74.1629638734921;
        Sun, 22 Aug 2021 06:25:34 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::687e? ([2a02:8108:96c0:3b88::687e])
        by smtp.gmail.com with ESMTPSA id q11sm3747298wrx.85.2021.08.22.06.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Aug 2021 06:25:34 -0700 (PDT)
Subject: Re: [PATCH 08/10] staging: r8188eu: clean up the usb_writeN
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210821164859.4351-1-martin@kaiser.cx>
 <20210821164859.4351-8-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <6593f24b-8986-df5f-e2ba-5358360939df@gmail.com>
Date: Sun, 22 Aug 2021 15:24:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210821164859.4351-8-martin@kaiser.cx>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/21/21 6:48 PM, Martin Kaiser wrote:
> Remove unnecessary variables, check the length.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/hal/usb_ops_linux.c | 15 +++++----------
>   1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> index e01f1ac19596..5408383ccec3 100644
> --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> @@ -151,20 +151,15 @@ static int usb_write32(struct intf_hdl *pintfhdl, u32 addr, u32 val)
>   
>   static int usb_writeN(struct intf_hdl *pintfhdl, u32 addr, u32 length, u8 *pdata)
>   {
> -	u16 wvalue;
> -	u16 len;
> +	u16 wvalue = (u16)(addr & 0x0000ffff);
>   	u8 buf[VENDOR_CMD_MAX_DATA_LEN] = {0};
> -	int ret;
> -
>   
> +	if (length > VENDOR_CMD_MAX_DATA_LEN)
> +		return -EINVAL;
>   
> -	wvalue = (u16)(addr & 0x0000ffff);
> -	len = length;
> -	memcpy(buf, pdata, len);
> +	memcpy(buf, pdata, length);

Hi Martin, shouldn't this be

memcpy(buf, pdata, (length & 0xffff));

>   
> -	ret = usbctrl_vendorreq(pintfhdl, wvalue, buf, len, REALTEK_USB_VENQT_WRITE);
> -
> -	return ret;
> +	return usbctrl_vendorreq(pintfhdl, wvalue, buf, (length & 0xffff), REALTEK_USB_VENQT_WRITE);
>   }
>   
>   static void interrupt_handler_8188eu(struct adapter *adapt, u16 pkt_len, u8 *pbuf)
> 

Regards,
Michael
