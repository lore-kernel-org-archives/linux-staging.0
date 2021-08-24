Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB323FC1
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 08:13:49 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id k5so43676926lfu.4
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 01:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=AgeEwGNV/wNzrPf/FKB8cVKReR6L7EhRt0SuLyHNHGo=;
        b=q6Ba1Gip+2Ytcz+JIX4C2qOSOHa7+/2pV4or3lnzQwbp4zYo5b3xYUNJs9z7ZtRXJO
         pQpPPxsFOLPa2caYEeaMhiYfFvShNfLiizpjllWoyKC6ojmQtXXu42rKH2rbpA1V2Cfu
         WmbqvapGFiYEnMfnIR04LlxvTA1oHdNyYlVyJ8R93El02KbHukLX7/iKUyuk47pYYJmX
         E44yMt0bxQLozQQEk0dUvY/1fwhe0CPeLeunsByq36NKTWhx8gvFaSPtXBSQ7xcQMfCA
         CjBPMiF7LfE0fyUA2Z3W7vExxO6Gbs9tyU5dFmS9S5mAcwr6c4Y0QCpwMMDxgByi9nBF
         NnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AgeEwGNV/wNzrPf/FKB8cVKReR6L7EhRt0SuLyHNHGo=;
        b=ZwK6+pZ+onExGi50Gm4HNFW+W8qeSlmw6dxQN33huLAyQw2yfr3OQp2CfLzHjeiBoR
         d5y4lupcdNbx/SlrElHmUBP+lKkMCAp6Gx3dGjaCceLa5w9Kl9SaftAyLr79lA0W7dhS
         nt8LrzJkjcZwutDjtrvaHHVK61XiqFGLTOOvgIa+/Za6fmvj/dQtlkuwREPcCbrTj7bA
         A6yMeDinj/nq8RaX9uz9bvJ3j4UzLlcDQdxUtCx7Qq/rsNgtauZZnGBIjLjIG1qWJSKQ
         q6G4AVlzYziPWkN7wgzV1Xd43s6WaohFeu2d+DX/zJVLQ/32Nh/Tg4v+wd6lN8p+bozE
         st9w==
X-Gm-Message-State: AOAM530Ioy7DRbQAxhRj0QtMp/vUScEytY/Nq4vekYCH0Iac/zuqgBzo
	JEPn3kfAFYAS/DoBuGZP8bU=
X-Google-Smtp-Source: ABdhPJzgZr37Q5o4qbry5OMUI/gfBPb+dSKoL+Tk5uVFykzdBaIh2uPbBUjBlGt2XrkknvcbaqwF6w==
X-Received: by 2002:a05:6512:31ce:: with SMTP id j14mr24236976lfe.646.1629792827319;
        Tue, 24 Aug 2021 01:13:47 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id u8sm1682746lfg.31.2021.08.24.01.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 01:13:47 -0700 (PDT)
Subject: Re: [PATCH 1/2] staging: r8188eu: Use usb_control_msg_recv/send() in
 usbctrl_vendorreq()
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210823223751.25104-1-fmdefrancesco@gmail.com>
 <20210823223751.25104-2-fmdefrancesco@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <68eebfaf-50a3-a7ec-12ba-cde33c74c9ce@gmail.com>
Date: Tue, 24 Aug 2021 11:13:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210823223751.25104-2-fmdefrancesco@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/24/21 1:37 AM, Fabio M. De Francesco wrote:
> Replace usb_control_msg() with the new usb_control_msg_recv() and
> usb_control_msg_send() API of USB Core in usbctrl_vendorreq().
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
> 
> Thanks to Pavel Skripkin <paskripkin@gmail.com> for his review of the
> RFC patch.
>   
> drivers/staging/r8188eu/hal/usb_ops_linux.c | 25 ++++++++++-----------
> 1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> index a93d5cfe4635..6f51660b967a 100644
> --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> @@ -15,9 +15,8 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
>   	struct adapter	*adapt = pintfhdl->padapter;
>   	struct dvobj_priv  *dvobjpriv = adapter_to_dvobj(adapt);
>   	struct usb_device *udev = dvobjpriv->pusbdev;
> -	unsigned int pipe;
> +	u8 pipe;
>   	int status = 0;
> -	u8 reqtype;
>   	u8 *pIo_buf;
>   	int vendorreq_times = 0;
>   
> @@ -44,22 +43,22 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
>   	}
>   
>   	while (++vendorreq_times <= MAX_USBCTRL_VENDORREQ_TIMES) {
> -		memset(pIo_buf, 0, len);
> -
>   		if (requesttype == 0x01) {
> -			pipe = usb_rcvctrlpipe(udev, 0);/* read_in */
> -			reqtype =  REALTEK_USB_VENQT_READ;
> +			status = usb_control_msg_recv(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
> +						      REALTEK_USB_VENQT_READ, value,
> +						      REALTEK_USB_VENQT_CMD_IDX,
> +						      pIo_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT,
> +						      GFP_KERNEL);
>   		} else {
> -			pipe = usb_sndctrlpipe(udev, 0);/* write_out */
> -			reqtype =  REALTEK_USB_VENQT_WRITE;
>   			memcpy(pIo_buf, pdata, len);
> +			status = usb_control_msg_send(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
> +						      REALTEK_USB_VENQT_WRITE, value,
> +						      REALTEK_USB_VENQT_CMD_IDX,
> +						      pIo_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT,
> +						      GFP_KERNEL);
>   		}
>   
> -		status = usb_control_msg(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
> -					 reqtype, value, REALTEK_USB_VENQT_CMD_IDX,
> -					 pIo_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT);
> -
> -		if (status == len) {   /*  Success this control transfer. */
> +		if (!status) {   /*  Success this control transfer. */
>   			rtw_reset_continual_urb_error(dvobjpriv);
>   			if (requesttype == 0x01)
>   				memcpy(pdata, pIo_buf,  len);
> 

Hi, Fabio!

Christophe is right about semantic part. Also,

if (!status) {

} else {
	if (status < 0) {		<-
					  |
	} else {			  |
					  |
	}				<-
}					


Extra if-else is not needed, since status can be 0 and < 0, there is no 
3rd state, like it was before.




With regards,
Pavel Skripkin
