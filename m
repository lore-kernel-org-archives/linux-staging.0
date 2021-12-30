Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A3129CA
	for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 20:11:14 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id o12so56638330lfk.1
        for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 12:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=D5OpIvSfY687ZPsc4rtmiNJ18f7af4DJBRMrvJ8i7c8=;
        b=lBwV1MKOGArwVuJreNpk69P1xSjDiao+JLSeG8U2SC+re7P3K0WzovMoulqaHXAliu
         AQ8hRATVRxj7jTKVQa7efRJQlTdKLhQiIHiDzSnqQv6nAbKXSssHc3cb60l169z6C7Hc
         OIDH0xG2kYhSnPsO30XBOo6ECec0TEFjPVcG6XWkH3L7uyLwo15UuNqhdty6JqaaULgQ
         keKFVnY7H4H4pSdZ6vXkqF0rg9A3bfKTP+cfuewlt7hIp+a25iq2J7K+bRIrmwyx+vpb
         /0CuZvhQitlDHDlIQI+sW39WNgxax95weJ6It+Sviw3e0lF96TIYRMfZqV6MpjCcMfJd
         qMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=D5OpIvSfY687ZPsc4rtmiNJ18f7af4DJBRMrvJ8i7c8=;
        b=r9IdDvyU/2qbby81RNde/CZfkNQ8T+6luDim+boHipv75uTFGIu8+Fo8Vs3rfoE3O7
         Zt9cmeuxY/DezuWqeMFty3lcTwApD6OgFkypU5SFGUaP8RB3WwGWc+L11gJ82SI9FUQ2
         D76TQKO3zA/SFwOKT4PeEufln7yUiGnCWMWi9XRAycIh+ygbbtnwHXp56GZVSkCA7mfG
         Dqx/UJs83lb3/IqS9QMsySY4jAE+MZG+dtpm4ILMBgxOIkujEOZqbQgfrrg1tgFe7C2E
         Dq5fqaZCmihx/uptsHMUBYglXq8/FM2O7BPT69F3tNVfbFMaahoe4I7tRwQ3mk9Xo/fd
         8QJg==
X-Gm-Message-State: AOAM533lMSxblngYJlw53wLyQxfEFIHKeHpeol6xF+DnWh8Bo9aXlaDI
	urDnwXkfu/nX61aafFLuCVE=
X-Google-Smtp-Source: ABdhPJyxAQTnaDZ8/NtfWRTmPBqi8ZcRtkAX6434doC+Gj827J4c4344J+F0Aq7bHdqy4fQ/h/ORZQ==
X-Received: by 2002:ac2:5547:: with SMTP id l7mr29125759lfk.324.1640895072475;
        Thu, 30 Dec 2021 12:11:12 -0800 (PST)
Received: from [192.168.1.11] ([94.103.235.97])
        by smtp.gmail.com with ESMTPSA id n11sm914635ljj.70.2021.12.30.12.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Dec 2021 12:11:12 -0800 (PST)
Message-ID: <2838d56e-9618-1582-4127-9dc3d56ff311@gmail.com>
Date: Thu, 30 Dec 2021 23:11:10 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 6/7] staging: r8188eu: IntArray and C2hArray are set but
 never used
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20211230200059.13406-1-straube.linux@gmail.com>
 <20211230200059.13406-7-straube.linux@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20211230200059.13406-7-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/30/21 23:00, Michael Straube wrote:
> The fields IntArray and C2hArray of struct hal_data_8188e are set but
> never used. Remove them.
> 
> While at it, remove the unsed defines USB_INTR_CONTENT_CPWM1_OFFSET
> and USB_INTR_CONTENT_CPWM2_OFFSET as well.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---

Hi Michael,

thanks for your clean ups!

>   drivers/staging/r8188eu/hal/usb_ops_linux.c     | 10 ----------
>   drivers/staging/r8188eu/include/rtl8188e_hal.h  |  3 ---
>   drivers/staging/r8188eu/include/rtl8188e_spec.h |  7 -------
>   3 files changed, 20 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> index 9ec55a77dccd..85bcde5ee79a 100644
> --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> @@ -185,20 +185,10 @@ int rtw_writeN(struct adapter *adapter, u32 addr, u32 length, u8 *data)
>   
>   static void interrupt_handler_8188eu(struct adapter *adapt, u16 pkt_len, u8 *pbuf)
>   {
> -	struct hal_data_8188e *haldata = &adapt->haldata;
> -
>   	if (pkt_len != INTERRUPT_MSG_FORMAT_LEN) {
>   		DBG_88E("%s Invalid interrupt content length (%d)!\n", __func__, pkt_len);
>   		return;
>   	}
> -
> -	/*  HISR */
> -	memcpy(&haldata->IntArray[0], &pbuf[USB_INTR_CONTENT_HISR_OFFSET], 4);
> -	memcpy(&haldata->IntArray[1], &pbuf[USB_INTR_CONTENT_HISRE_OFFSET], 4);
> -
> -	/*  C2H Event */
> -	if (pbuf[0] != 0)
> -		memcpy(&haldata->C2hArray[0], &pbuf[USB_INTR_CONTENT_C2H_OFFSET], 16);
>   }
>   

This function can be removed totally then, since it does nothing. Not 
sure if function removal fits this patch, but why not :)



With regards,
Pavel Skripkin
