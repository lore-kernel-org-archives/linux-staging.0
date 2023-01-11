Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DD5BD28
	for <linux-staging@lists.linux.dev>; Wed, 11 Jan 2023 22:09:51 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id vm8so40386819ejc.2
        for <linux-staging@lists.linux.dev>; Wed, 11 Jan 2023 14:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yxBTVvtQmWuJNtulasWvUWRckn18pgjUJsMduZ9gth8=;
        b=MLykj0kjmN8I5Uclna25NMEdgbMI6q4xpEHdnPmv2/2W2UWpz8uw8OG2vTgVlV5BMC
         0JNhxY6Bhfp9zJ+4dGPkuIsJ4THanAxM50A7tI/O64pC+2b8q33+MKdHOsTcJs9bHrOM
         jOnb8ghW55naNZ6sw9SiQqyWoNImv+5f/6/qS1Fz8IyI8AvVpEk24TueUa/1ECh/Vork
         DMD9ucLAB2gYlYauhUWAmJVoTiboqZ3y8XSM5ZgnbgWF0quKmLEj3Vgba3S3dpB+uom+
         Ui2oeRUSovHxpKXi0lIicmzQpy0Qb1sIgJb7Ce3vVb7aRCE/8Rc6qF27DmU30LIcB/T4
         Y4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yxBTVvtQmWuJNtulasWvUWRckn18pgjUJsMduZ9gth8=;
        b=1fKe282iikYEEtXwd5QFMu4TXPeMhqw2Bvsf7WTXbSo9yN+7pnv07z1m+vhDuz17yb
         dVOWFXMywoyLdVAYRYfewMpRSUGQIsaMcI/vvcqOYXsDKnEnaorDXpTjHbdmlI7iuljY
         GqDmYzlIp6ZsW4XTTuvteGWGjxzEveMUzbRbal6jyebjyULEU2TdxRmQsywZdGwZCtrk
         e3FWwXsaj/ZHFaHUdbMZSqNSTuJzsjGC/khsJ+/sXD8anv+S7JNEKTgKZGL/a2aRvppA
         ZJLThqctYlZMmIhFbWbFM7eNySWb2l1w/U56XSam1GKSbW4bX3orkQIiiKjBJEYXJ80R
         GnLQ==
X-Gm-Message-State: AFqh2krRuJF9AYfgyNIaiJogYaf3ttGtArA0DiVb46s60X1HcT4SdGo1
	zpuBENuaqMaOoopyREuRtVs=
X-Google-Smtp-Source: AMrXdXuvzCZRuvDoZTAN3AY/HQW4rf4kXn+Qd1IFUIfCId19rPx8DduId1fS2pVqJqZpLQI2oNgtmw==
X-Received: by 2002:a17:907:8a20:b0:7c1:27c:2530 with SMTP id sc32-20020a1709078a2000b007c1027c2530mr18371437ejc.3.1673474989968;
        Wed, 11 Jan 2023 14:09:49 -0800 (PST)
Received: from [192.168.1.102] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id ja25-20020a170907989900b0084d1160a19dsm6776634ejc.98.2023.01.11.14.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 14:09:49 -0800 (PST)
Message-ID: <b910456d-6306-d532-224e-81f862636930@gmail.com>
Date: Wed, 11 Jan 2023 23:09:47 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] staging: r8188eu: remove NULL check for usb_kill_urb
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230111100201.251905-1-martin@kaiser.cx>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230111100201.251905-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/11/23 11:02, Martin Kaiser wrote:
> usb_kill_urb handles a NULL parameter. There's no need for NULL checks
> before we call usb_kill_urb.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/os_dep/usb_ops_linux.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
> index 62106d2f82ad..583533631133 100644
> --- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
> +++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
> @@ -29,8 +29,7 @@ void rtw_read_port_cancel(struct adapter *padapter)
>   
>   	for (i = 0; i < NR_RECVBUFF; i++) {
>   		precvbuf->reuse = true;
> -		if (precvbuf->purb)
> -			usb_kill_urb(precvbuf->purb);
> +		usb_kill_urb(precvbuf->purb);
>   		precvbuf++;
>   	}
>   }
> @@ -153,15 +152,13 @@ void rtw_write_port_cancel(struct adapter *padapter)
>   	padapter->bWritePortCancel = true;
>   
>   	for (i = 0; i < NR_XMITBUFF; i++) {
> -		if (pxmitbuf->pxmit_urb)
> -			usb_kill_urb(pxmitbuf->pxmit_urb);
> +		usb_kill_urb(pxmitbuf->pxmit_urb);
>   		pxmitbuf++;
>   	}
>   
>   	pxmitbuf = (struct xmit_buf *)padapter->xmitpriv.pxmit_extbuf;
>   	for (i = 0; i < NR_XMIT_EXTBUFF; i++) {
> -		if (pxmitbuf->pxmit_urb)
> -			usb_kill_urb(pxmitbuf->pxmit_urb);
> +		usb_kill_urb(pxmitbuf->pxmit_urb);
>   		pxmitbuf++;
>   	}
>   }


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
