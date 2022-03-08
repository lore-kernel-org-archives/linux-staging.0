Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3A24C88
	for <linux-staging@lists.linux.dev>; Tue,  8 Mar 2022 21:13:55 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id h14so208696lfk.11
        for <linux-staging@lists.linux.dev>; Tue, 08 Mar 2022 13:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=m0/8sk6gVvfrZi40mwng+FUCP1kcZ21w5gsjbQW+jrM=;
        b=gXJzdw//hwZUJwUfVmASwdiGtxcIEwMvM9cEBlXwXPjiBKJ1TT6awhKi928+TwJ56V
         CaLlnHnEL9uPTdutzTSNR9L2giSncZhOfb/JBz4BhN/VKHFt7+9NNrNzVbck2BafRCHG
         FAJ3y4srZEdDT2YDMkzgG/QRjloci1teTLqJbjbGfb1+MoDNW1W2Xj3Z7m+i/R3VjDfW
         EKwyXOkJ7twGbPdMEIGBQiAv/0CdoQBt+PnG4SeKaoQIxeDFpoNrvDItpOF6SsHW1wPy
         KWlSQCB60frkA8Q+ULHldnDMt1ZViGHqQndjVw1+XU5iglFzuCmHduL/j8hS7NApIU+4
         TO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=m0/8sk6gVvfrZi40mwng+FUCP1kcZ21w5gsjbQW+jrM=;
        b=7YD39K50wxXomGBA+smQDK7UH4kc9eXjJCaud2IPm1Ge0jDn/qS/w2fFpUWBeTdzIA
         AVkY5ksaFoP8ii1ihLTafc+oM2TTICFgyDeUa5c0bnJcpf5hQDwc7GOKzrnXWxB90P1v
         wgwxbpJ6Zk9eVUrXWykNohQHfAJuWTdgBddXJeBEo/kbQOS7jS3mURPus6PIQNX3RLEa
         +n2SlgrxuBKJrCWHlPnEBPDpH89JYRv615lG2BGhY5RAiGJpJGRwtwBc992V21tYsyfM
         x9axGhWx08sKewnsfKe3aO9HVAzwTF/mddOI9bytrlb7GBPBbyhAx1qq+/q9mbDJMVe5
         94Uw==
X-Gm-Message-State: AOAM533heYvVFI/0cE+jRqX+xrIrs4RDqg9mg/s76ICxwkBh7D721pCB
	AAPOuRYACBiFipfBx2KiehE=
X-Google-Smtp-Source: ABdhPJwtcOjTXd69ii9+/wSYLlrXYrNW+Itc7rTNm3XvC3Y30flrQW8pqKlCcZqWHLpRC9EQHb7twg==
X-Received: by 2002:a05:6512:3619:b0:443:1597:8293 with SMTP id f25-20020a056512361900b0044315978293mr12502051lfs.439.1646774033201;
        Tue, 08 Mar 2022 13:13:53 -0800 (PST)
Received: from [192.168.1.11] ([94.103.229.107])
        by smtp.gmail.com with ESMTPSA id f17-20020a2e1f11000000b00247f8eb86a7sm449827ljf.108.2022.03.08.13.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 13:13:52 -0800 (PST)
Message-ID: <b5f9dda7-269a-6b50-ddf2-b5fa05aa1d72@gmail.com>
Date: Wed, 9 Mar 2022 00:13:50 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 2/2] staging: r8188eu: proper error handling in
 rtw_init_drv_sw
Content-Language: en-US
To: Vihas Makwana <makvihas@gmail.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>, Martin Kaiser <martin@kaiser.cx>,
 Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220308205510.48431-1-makvihas@gmail.com>
 <20220308205510.48431-3-makvihas@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220308205510.48431-3-makvihas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vihas,

On 3/8/22 23:55, Vihas Makwana wrote:
> The code inside rtw_init_drv_sw() calls various init functions to
> populate the padapter structure and checks for their return values
> respectively.
> But if one of the functions in middle fails then it simply returns
> _FAIL instead of proper logging and calling freeing counterparts
> of previous init functions.
> This leads to various memory leaks and can be found in
> /sys/kernel/debug/kmemleak if kernel is compiled with DEBUG_KMEMLEAK=y.
> 
> Fix this and keep the success and error separate.
> 
> 
> Signed-off-by: Vihas Makwana <makvihas@gmail.com>
> ---

Fixes: 2b42bd58b321 ("staging: r8188eu: introduce new os_dep dir for 
RTL8188eu driver")
> Tested on Comfast CF-WU810N RTL8188EUS wireless adapter.
> This patch depends on "[PATCH 1/2] staging: r8188eu: call _cancel_timer_ex from
>   _rtw_free_recv_priv"
> ---

No need to say that 1/2 depends on 2/2 since they are already in same 
patch series :)

>   drivers/staging/r8188eu/os_dep/os_intfs.c | 60 ++++++++++++++++++-----
>   1 file changed, 47 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
> index 197568422..6279bba07 100644
> --- a/drivers/staging/r8188eu/os_dep/os_intfs.c
> +++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
> @@ -469,32 +469,46 @@ u8 rtw_reset_drv_sw(struct adapter *padapter)
>   
>   u8 rtw_init_drv_sw(struct adapter *padapter)
>   {
> -	if ((rtw_init_cmd_priv(&padapter->cmdpriv)) == _FAIL)
> +	if ((rtw_init_cmd_priv(&padapter->cmdpriv)) == _FAIL) {
> +		pr_err("rtw_init_cmd_priv failed\n");

Hm, what about
dev_err(dvobj_to_dev(padapter->dvobj), "..."); ?

IIRC it's main usb device for this driver.

@Phillip, @Larry, @Martin, please, correct me if I am wrong here


Random note: We can't use netdev_err here since rtw_init_drv_sw() is 
called before netdev registration


>   		return _FAIL;
> +	}
>   
>   	padapter->cmdpriv.padapter = padapter;

Otherwise looks good to me


With regards,
Pavel Skripkin
