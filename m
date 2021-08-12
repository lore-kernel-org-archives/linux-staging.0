Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8947372
	for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 13:32:13 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id bj40so10332662oib.6
        for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 06:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R9HVDpRhXwfFRF2AntRCJkLCvu7sh5TaAycq7OJv9Kg=;
        b=Zlt8B8nlGRTB+9ShaE4Bxw8SWOxqOIOL0DeVa4yr0t9rctsN0vKsFoeq6aieEZmvR2
         3J1hoeLH9HyF0k/aUxAf9fsth3F7eP7sHDkPYBmIdOu4rE7QudjACkcpWDexsgAqZ1cz
         jimzUhkAZhrL4e2SCr5jbP9Xite6g3mPtyCBBn/VV8TIux3pyqe+aQDaK41dg/RVPkPS
         r/saFJOG8CwTffKUPlw5tPdkxdLOgYCRVHS8DrAukCQ/YrRQ3Y1m/aVXcufPN9K3tdAK
         JtalYHrBw8XN1V0OgnpkvOJgaFKJ592jzoI1oFH6k6ZQR7ruxQbfUBBfBeLLWVGf4dET
         MTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R9HVDpRhXwfFRF2AntRCJkLCvu7sh5TaAycq7OJv9Kg=;
        b=Z/EhBu4Wca/J0gAUBApFJm6RsmgFgdvkLkmCShrCIOysRbdC/EfCbMEto9jLuESoRD
         pxsO3m+raZqX1jM79pJzis/Gga1PYnkjw5McMBBMIYI5RyUf+Dv+1UwqFrQGN0O2Ma4u
         atiaIforElokKlvl0iNSIMYrzOEsOq+q3ZbmACjRKp0PXFEv7qc71BeCv5lnWAHSW3Co
         qZnSVRJGLW2DXzgZgm2I+K5HWGiBwugfFk4dK/YnYiYUeDC7tY98z4uUq6b0COILI4KE
         A2zwzaFlesaN3leaqNLiEqsPdjd1JMLLBgv0gLJxMQwwMlDA+xTEZ1bQdSheoRJVqBXf
         LQVQ==
X-Gm-Message-State: AOAM530jD86tVfI/eru+TFe7QRiICFFsWJEasmzBUdr+SV52nE/RrUAQ
	wO0lnpWZcSJm9bhDOyI2rO8=
X-Google-Smtp-Source: ABdhPJxfUn+mqYNqION2sR82duuBTqyFkfDRc4yBGJdDaNtoPa8tYkYM+QHcojboLqHavDUOH4pZYQ==
X-Received: by 2002:a05:6808:2116:: with SMTP id r22mr3368516oiw.155.1628775132788;
        Thu, 12 Aug 2021 06:32:12 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id w13sm621171otl.41.2021.08.12.06.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 06:32:12 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH] staging: r8188eu: Fix a couple scheduling in atomic bugs
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 kernel-janitors@vger.kernel.org
References: <20210812065710.GA31863@kili>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <2d74ec95-2611-25ca-c0a8-00092c56ff5d@lwfinger.net>
Date: Thu, 12 Aug 2021 08:32:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210812065710.GA31863@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/12/21 1:57 AM, Dan Carpenter wrote:
> These allocations are sometimes done while holding a spin_lock so they
> have to be atomic.  The call tree looks like this:
> 
> -> rtw_set_802_11_connect() <- takes a spin_lock
>     -> rtw_do_join()
>        -> rtw_sitesurvey_cmd()  <-- does a GFP_ATOMIC allocation
>           -> p2p_ps_wk_cmd()
> 
> Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/staging/r8188eu/core/rtw_p2p.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_p2p.c b/drivers/staging/r8188eu/core/rtw_p2p.c
> index b4497444a7af..04480a86902e 100644
> --- a/drivers/staging/r8188eu/core/rtw_p2p.c
> +++ b/drivers/staging/r8188eu/core/rtw_p2p.c
> @@ -1697,13 +1697,13 @@ u8 p2p_ps_wk_cmd(struct adapter *padapter, u8 p2p_ps_state, u8 enqueue)
>   		return res;
>   
>   	if (enqueue) {
> -		ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
> +		ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
>   		if (!ph2c) {
>   			res = _FAIL;
>   			goto exit;
>   		}
>   
> -		pdrvextra_cmd_parm = kzalloc(sizeof(struct drvextra_cmd_parm), GFP_KERNEL);
> +		pdrvextra_cmd_parm = kzalloc(sizeof(struct drvextra_cmd_parm), GFP_ATOMIC);
>   		if (!pdrvextra_cmd_parm) {
>   			kfree(ph2c);
>   			res = _FAIL;

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Thanks,

Larry


