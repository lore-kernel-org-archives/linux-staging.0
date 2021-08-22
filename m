Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37F93FC1
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 14:06:03 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id f5so21917182wrm.13
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 07:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p7ph3WcOBLhIzLLXreA5sxLtbJ/7/kTwoO02MA088Jk=;
        b=esvH4DB7Y0QbmDJBfJhGYqLk+7oDXzoCRsI/j0NfluAIVS17q9u56DM3wQAysgTQL+
         5eJYqzEcBbNpvXRTN8lXm2/x9YlrXL0Dx0RZ1U7ezRdGgbdz2qOMz5ViaBThSa4MXy0V
         56JyuufHqxaTF6KhJbeIhQySqpIaVax6Z4Giv22FrmxpznwHLXV4dTuxLYIFvKMKhwZu
         ly1icmr2l0DMH7aFYzE82taNHSggZMRHQmbwmQPcOGZzOP1r8mV+LYw/NEBQGS2hQhbP
         Ec88ezHiYlyi/FBefl4T5VfWFImeis4tu+4EBk8BdSaJWp/9/DtPTdH0OYiY5HKOoZgi
         ircw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p7ph3WcOBLhIzLLXreA5sxLtbJ/7/kTwoO02MA088Jk=;
        b=P0yeJbK4vxoSQ/fIK9AHc+Kjo5c3i2zpYMDnfgPLEnoZKO0fDxkGsrM0rtvvji41s8
         fDzF4ObAMhiE3DVc1NY5skCeTsKPkKuEruwKo0TqWczc3+cRntvWqaqeq54/+qBuGrx7
         6/lCIOw6uAJ412/Dcc4PihpcV+PxuxNz4MPitIPOtreCqvrwqT71/2e9dHvM5hCTS7SQ
         SNecOPeAv1P/hma0YPBEf4TdwXpjJiJve9WMthB8dkt6YBH2lt2UOyMPYtRCewb5tFAi
         YRoaIyatpIRWhHNqG+g3ta5TFmwcYiNf78vzL8OPHwt3h2ioJx+pR2xjnz2punCKOlQD
         B3dw==
X-Gm-Message-State: AOAM532HmG4sd/HyNaJJPS3UrBVRdyUxGP/6i98tceQ6Wn6gXZlfjWUc
	kPjYwTYqLZA02QpojoMfMCc=
X-Google-Smtp-Source: ABdhPJypQdvMGuxBIT1Ij27zwny4+xrymYItqJ+7TKyqWeH5NyozhFwU/5Ou9E0HWtwugVEXWnX7OQ==
X-Received: by 2002:a5d:456a:: with SMTP id a10mr8726291wrc.339.1629641162075;
        Sun, 22 Aug 2021 07:06:02 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::687e? ([2a02:8108:96c0:3b88::687e])
        by smtp.gmail.com with ESMTPSA id b15sm12363863wrq.5.2021.08.22.07.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Aug 2021 07:06:01 -0700 (PDT)
Subject: Re: [PATCH 10/10] staging: r8188eu: set pipe only once
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210821164859.4351-1-martin@kaiser.cx>
 <20210821164859.4351-10-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <088d6fbb-b231-e669-1f0d-5adea7ac4685@gmail.com>
Date: Sun, 22 Aug 2021 16:05:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210821164859.4351-10-martin@kaiser.cx>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/21/21 6:48 PM, Martin Kaiser wrote:
> Set the pipe for reading or writing in usbctrl_vendorreq only once.
> There's no need to set it again for every retry.
> 
> This patch is an adaptation of commit 889ed8b5e374 ("staging: rtl8188eu:
> set pipe only once") for the new r8188eu driver.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/hal/usb_ops_linux.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> index 5408383ccec3..5a55ee38d7b8 100644
> --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> @@ -40,15 +40,16 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
>   		goto release_mutex;
>   	}
>   
> -	while (++vendorreq_times <= MAX_USBCTRL_VENDORREQ_TIMES) {
> -		memset(pIo_buf, 0, len);
> +	if (requesttype == REALTEK_USB_VENQT_READ)
> +		pipe = usb_rcvctrlpipe(udev, 0);/* read_in */
> +	else
> +		pipe = usb_sndctrlpipe(udev, 0);/* write_out */
>   
> -		if (requesttype == REALTEK_USB_VENQT_READ) {
> -			pipe = usb_rcvctrlpipe(udev, 0);/* read_in */
> -		} else {
> -			pipe = usb_sndctrlpipe(udev, 0);/* write_out */
> +	while (++vendorreq_times <= MAX_USBCTRL_VENDORREQ_TIMES) {
> +		if (requesttype == REALTEK_USB_VENQT_READ)
> +			memset(pIo_buf, 0, len);
> +		else
>   			memcpy(pIo_buf, pdata, len);
> -		}
>   
>   		status = usb_control_msg(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
>   					 requesttype, value, REALTEK_USB_VENQT_CMD_IDX,
> 

Looks good to me.

Acked-by: Michael Straube <straube.linux@gmail.com>

Thanks,
Michael
