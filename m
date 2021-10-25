Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323CD2CA4
	for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 15:06:59 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id u69so15964920oie.3
        for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 08:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oM8yA7a5dVE7JX8EcdvOiaf5ULOdCzfUf0V8tBfwui4=;
        b=ER0GMacpTnOTj7tzZfbyTloQJCQVh+rQsBqHcRfmmYdWOumvJXTe2HsV5ap6NC5GvJ
         aeMQktuglIYN7hDPxydn1Iq0XD8omM7TtYKFZTOB10t3OnlX5P+aPxMUthsIyTFSB4Cp
         GRX/YsZkRm3799hkSHKK7TsH338+CWVDoHp4rDR9/nDz6CYKygOMy5HPrXmrU8UlCfPZ
         ++1UzUoUGZ6tVgfI98SoCmh1srXoqE8q0xYkPx6z8ZweOgZuS5l4XQAoS5LqbfwALSpq
         +e6RhL7ppbzVGken8xBQ6Z6jmBIbUYNLgPqTIu57s/Pl/QtrX4eW34x2GMz+XSNwkC+F
         YqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oM8yA7a5dVE7JX8EcdvOiaf5ULOdCzfUf0V8tBfwui4=;
        b=lRC4lepn0RMwAObR/rz9YM8iaD6h8CYohI0CGlrVghv/X+/Ejz9IK4Z+QVNOHTXLv+
         8XyKV8EU3wEVcBR+bIJQXY3M+JOhDsGnY4Au5VW/Q/lSIF9tZMthzowJ3s1l0lZQHfHa
         ZStNX+vIg04HbpAYFifnTBguOb2w/ZkUueD2m7ldH6plm1NiaX5BxdIF2XYZUmyBYxk/
         VLNqh8Sal2EuuXzYowdX809kxfOQmYoKi+GAh/Np+E5Yc3pEg8hTC6yUNZ9xcJ/BbgL1
         Lrza+kOd0B6cfOEa/VBBqejch8ldA4inSQOpaqrHWUKOA/zPbKSfIAJwv1sKA0OeTDpZ
         PpRQ==
X-Gm-Message-State: AOAM533eS9A8QLKF43c/MoTl8RedChNRQu/SUssG9RgJftaE8goYQ1FY
	yz/xwZ8gyqSByTC3Bq4Wg4A=
X-Google-Smtp-Source: ABdhPJx7eHOV/Rj1dfcQbb+E4YkvGmIM8cWShmj+USs3dQQxpyMHv1C8wOTSbiYJDcuOPvRBc8Cdzw==
X-Received: by 2002:aca:ac82:: with SMTP id v124mr23639856oie.0.1635174418293;
        Mon, 25 Oct 2021 08:06:58 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::101e? (2603-8090-2005-39b3-0000-0000-0000-101e.res6.spectrum.com. [2603:8090:2005:39b3::101e])
        by smtp.gmail.com with ESMTPSA id bk8sm3803285oib.57.2021.10.25.08.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 08:06:57 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <fdb677be-6e06-fef9-811d-bb2c71246197@lwfinger.net>
Date: Mon, 25 Oct 2021 10:06:56 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/2] staging: rtl8192u: fix control-message timeouts
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 linux-staging@lists.linux.dev, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20211025120910.6339-1-johan@kernel.org>
 <20211025120910.6339-2-johan@kernel.org>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <20211025120910.6339-2-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/21 07:09, Johan Hovold wrote:
> USB control-message timeouts are specified in milliseconds and should
> specifically not vary with CONFIG_HZ.
> 
> Fixes: 8fc8598e61f6 ("Staging: Added Realtek rtl8192u driver to staging")
> Cc: stable@vger.kernel.org      # 2.6.33
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>   drivers/staging/rtl8192u/r8192U_core.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)

I would have preferred that you not use the magic number "500", but the patch is OK.

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Larry

> 
> diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
> index b6698656fc01..cf5cfee2936f 100644
> --- a/drivers/staging/rtl8192u/r8192U_core.c
> +++ b/drivers/staging/rtl8192u/r8192U_core.c
> @@ -229,7 +229,7 @@ int write_nic_byte_E(struct net_device *dev, int indx, u8 data)
>   
>   	status = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
>   				 RTL8187_REQ_SET_REGS, RTL8187_REQT_WRITE,
> -				 indx | 0xfe00, 0, usbdata, 1, HZ / 2);
> +				 indx | 0xfe00, 0, usbdata, 1, 500);
>   	kfree(usbdata);
>   
>   	if (status < 0) {
> @@ -251,7 +251,7 @@ int read_nic_byte_E(struct net_device *dev, int indx, u8 *data)
>   
>   	status = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
>   				 RTL8187_REQ_GET_REGS, RTL8187_REQT_READ,
> -				 indx | 0xfe00, 0, usbdata, 1, HZ / 2);
> +				 indx | 0xfe00, 0, usbdata, 1, 500);
>   	*data = *usbdata;
>   	kfree(usbdata);
>   
> @@ -279,7 +279,7 @@ int write_nic_byte(struct net_device *dev, int indx, u8 data)
>   	status = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
>   				 RTL8187_REQ_SET_REGS, RTL8187_REQT_WRITE,
>   				 (indx & 0xff) | 0xff00, (indx >> 8) & 0x0f,
> -				 usbdata, 1, HZ / 2);
> +				 usbdata, 1, 500);
>   	kfree(usbdata);
>   
>   	if (status < 0) {
> @@ -305,7 +305,7 @@ int write_nic_word(struct net_device *dev, int indx, u16 data)
>   	status = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
>   				 RTL8187_REQ_SET_REGS, RTL8187_REQT_WRITE,
>   				 (indx & 0xff) | 0xff00, (indx >> 8) & 0x0f,
> -				 usbdata, 2, HZ / 2);
> +				 usbdata, 2, 500);
>   	kfree(usbdata);
>   
>   	if (status < 0) {
> @@ -331,7 +331,7 @@ int write_nic_dword(struct net_device *dev, int indx, u32 data)
>   	status = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
>   				 RTL8187_REQ_SET_REGS, RTL8187_REQT_WRITE,
>   				 (indx & 0xff) | 0xff00, (indx >> 8) & 0x0f,
> -				 usbdata, 4, HZ / 2);
> +				 usbdata, 4, 500);
>   	kfree(usbdata);
>   
>   	if (status < 0) {
> @@ -355,7 +355,7 @@ int read_nic_byte(struct net_device *dev, int indx, u8 *data)
>   	status = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
>   				 RTL8187_REQ_GET_REGS, RTL8187_REQT_READ,
>   				 (indx & 0xff) | 0xff00, (indx >> 8) & 0x0f,
> -				 usbdata, 1, HZ / 2);
> +				 usbdata, 1, 500);
>   	*data = *usbdata;
>   	kfree(usbdata);
>   
> @@ -380,7 +380,7 @@ int read_nic_word(struct net_device *dev, int indx, u16 *data)
>   	status = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
>   				 RTL8187_REQ_GET_REGS, RTL8187_REQT_READ,
>   				 (indx & 0xff) | 0xff00, (indx >> 8) & 0x0f,
> -				 usbdata, 2, HZ / 2);
> +				 usbdata, 2, 500);
>   	*data = *usbdata;
>   	kfree(usbdata);
>   
> @@ -404,7 +404,7 @@ static int read_nic_word_E(struct net_device *dev, int indx, u16 *data)
>   
>   	status = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
>   				 RTL8187_REQ_GET_REGS, RTL8187_REQT_READ,
> -				 indx | 0xfe00, 0, usbdata, 2, HZ / 2);
> +				 indx | 0xfe00, 0, usbdata, 2, 500);
>   	*data = *usbdata;
>   	kfree(usbdata);
>   
> @@ -430,7 +430,7 @@ int read_nic_dword(struct net_device *dev, int indx, u32 *data)
>   	status = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
>   				 RTL8187_REQ_GET_REGS, RTL8187_REQT_READ,
>   				 (indx & 0xff) | 0xff00, (indx >> 8) & 0x0f,
> -				 usbdata, 4, HZ / 2);
> +				 usbdata, 4, 500);
>   	*data = *usbdata;
>   	kfree(usbdata);
>   
> 

