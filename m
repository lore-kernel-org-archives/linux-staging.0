Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DD43FC7
	for <linux-staging@lists.linux.dev>; Sun,  5 Sep 2021 07:55:52 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id v20-20020a1cf714000000b002e71f4d2026so1835558wmh.1
        for <linux-staging@lists.linux.dev>; Sun, 05 Sep 2021 00:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Y+rK5DuvhxVwRtS3sArMrVdmfKfsYPeSxUMrQtQ8RKA=;
        b=NymRjouTjiSsvoj8n3DXDlAaIXMF2oTGhpHn3rqi0OyG5Qn3VV49D/xgLppDJptArq
         8B20HykJFHhSMB5mASLU6vAHqjdl17E+RoTWuLeZMKAXnXU4WgkMjc7fFqHYsMrgyyO1
         fp9N1dJiz3h/nooRjW6Q7MXQYI/5xeE6thWE3i4P32YpNZ5fPycYQFf7t4IM0V2lPNHT
         SEfV4g7zxZZzes6MXQd5aHszwftB+oeHQxTEwyvzClIZZ5qFnWZwMtMWvzLSLogqHub2
         S+G80+1DWf/QCt6MnVuGzbawm/H7A2jPbpVE/WNVEjP2l2+RJ+EtCRddK+2dYJa4sxmn
         36NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Y+rK5DuvhxVwRtS3sArMrVdmfKfsYPeSxUMrQtQ8RKA=;
        b=qvD7/40KO39XKeJpSQ4i29wDE0Lkry55bff7ML4LUFo514fFG05zb/6rV5Xg4S5fkf
         449tJ4tLCAfNA431/LeiraHwcxN2GSB7tDCVYZec/0tHYmDok/j7UL40dMcHE70Mom7v
         bVxH15Y+nctdSIKpoedTF40ImnhaYQzEaUkHE8Hvv3jQytepyyrhyiG3/Nh6YCeYG41u
         0yEDByaGBUCxQ9OvkP6dZX77hNdh7rjNqqIMx7vMuDRDsmxfWr5H+76A4r0wRSF5Wje8
         fGZDIgf4Q4gTJGEJu9ZGgSzs3a1HJ4zrVLDMy/ZmG3WWLa9qi7s0J5jP0HKoCr6bLhuK
         6zFQ==
X-Gm-Message-State: AOAM530QPR9U/5vW1eRt+u/BolGlIrqa19OkfwAX1IWlVKtQJbVgUaAB
	WJ4WsSyQaVBPnGowKZ9e+7w=
X-Google-Smtp-Source: ABdhPJznRZcl0pp+K61vAQgAo3gWm12zlOxRHyvKbX2S7y3CaGR2xyy+Ao484odxRlyojDvfbzcZzQ==
X-Received: by 2002:a05:600c:1990:: with SMTP id t16mr6065013wmq.45.1630828551120;
        Sun, 05 Sep 2021 00:55:51 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::dc38? ([2a02:8108:96c0:3b88::dc38])
        by smtp.gmail.com with UTF8SMTPSA id l26sm3923669wmi.13.2021.09.05.00.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Sep 2021 00:55:50 -0700 (PDT)
Message-ID: <41f6eb79-c943-c8b4-78d9-cc10e8ffa7ea@gmail.com>
Date: Sun, 5 Sep 2021 09:55:49 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH] staging: r8188eu: core: remove condition never execute
Content-Language: en-US
To: Saurav Girepunje <saurav.girepunje@gmail.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
References: <YTNrjG1y05ByN54+@user>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <YTNrjG1y05ByN54+@user>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/21 14:50, Saurav Girepunje wrote:
> Remove condition which never get execute.
> as pattrib->mdata is always zero before if condition check.
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> index 4178b3c1ff57..f314f55997bf 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> @@ -5669,9 +5669,6 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16
>   	else if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE)
>   		SetToDs(fctrl);
> 
> -	if (pattrib->mdata)
> -		SetMData(fctrl);
> -
>   	qc = (unsigned short *)(pframe + pattrib->hdrlen - 2);
> 
>   	SetPriority(qc, tid);
> --
> 2.32.0
> 

Looks good to me.

Acked-by: Michael Straube <straube.linux@gmail.com>

Thanks,
Michael
