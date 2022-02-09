Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FF929CA
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 20:33:25 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id bu29so1226464lfb.0
        for <linux-staging@lists.linux.dev>; Wed, 09 Feb 2022 12:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=NF9zbk0D0Y3erel7tZF3i+ekloEMwIpuyMDBcQMQrrs=;
        b=VAJ1k7CK2/skYA9GXLBz/RAqXiI5gxRFVBlhzPK69YUu61yQixrpiX5/26987vS+36
         mjDMxhSVZbB796MA5caEVhDsz54JuTPC2Ywo0/5RAECuZmb6tBiEEf0mWYRsm8pPnv7F
         wLLgZ9e+YdDWiPzxK3tVORwM0tmanF3vBZS/1c37aeN/fADzQl3P0//yCmuTUrsDiQVu
         mnb2WsXlK0K/97JKKVeSHNROG3eIrJDJt0z/KcWss1AMHAshC5mZuprcF/Mj8Sqfu52X
         l+eKprVTBVJIM/+v5+G7EX2RluLMVDHeKWhWw4KOH9SinKxUzZnqYNW4oOeJ4rdv0Z/D
         Hw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NF9zbk0D0Y3erel7tZF3i+ekloEMwIpuyMDBcQMQrrs=;
        b=NyXf4lPqIIymMDdVbexaguSCR4f+QwpNrcZKqR+0THMq+QISw1jcBgIphz+Qelack3
         t+aV3uxFpTNre2imDD+3pkjBZ17aDp9d6b2qtFoB+q6pKYqdEuzBZPGrfP36zNbWdBb0
         5uxKcED+d6XMf+1VhjOfdnS+2dLa2izv0Ng/oo4Z2qX1apjBFjSs/sPd4FXDmKZ4KoNI
         NuP2VzsNe3q4JTX8kf9FJi7isw+1aXgEfT61+iEJAiyok64nOWzdH0TBmt5aizN75UlI
         qbD+C2q+00crMuvK3249+87j87S+djrhnLhU6NNGE1K9aVsIiZb2IwNIm4yX+FQFxkvU
         cgog==
X-Gm-Message-State: AOAM533x0kCaINF/inlaQnxVDsY0fRi3EX03vsiXdiM6gGVh97fQiPmF
	daKZPYpGM5WAvNFbPLUxM+I=
X-Google-Smtp-Source: ABdhPJzi07lxSmAR55Homq9Mwd/SChq7a+ulh7a93B2AmGz1YTCq7kuawz0B+qaL7x64Xo3/oW41Bw==
X-Received: by 2002:a05:6512:3a88:: with SMTP id q8mr2858003lfu.349.1644438803823;
        Wed, 09 Feb 2022 12:33:23 -0800 (PST)
Received: from [192.168.1.11] ([217.117.245.154])
        by smtp.gmail.com with ESMTPSA id q28sm2508062lfp.272.2022.02.09.12.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 12:33:23 -0800 (PST)
Message-ID: <3448c8bf-a72b-803b-bb50-f5d74340d6db@gmail.com>
Date: Wed, 9 Feb 2022 23:33:22 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] Staging: r8188eu: core: Comparisons should place the
 constant on the right side of the test
Content-Language: en-US
To: Leonardo Araujo <leonardo.aa88@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20220209202758.2940-1-leonardo.aa88@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220209202758.2940-1-leonardo.aa88@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Leonardo,

On 2/9/22 23:27, Leonardo Araujo wrote:
> This patch fixes the following checkpatch.pl warning:
> 
> WARNING: Comparisons should place the constant on the right side of the test
> 
> Signed-off-by: Leonardo Araujo <leonardo.aa88@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_cmd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> index a9a5453aa1cc..e236316188c1 100644
> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> @@ -618,7 +618,7 @@ u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueu
>   		res = rtw_enqueue_cmd(cmdpriv, cmdobj);
>   	} else {
>   		/* no need to enqueue, do the cmd hdl directly and free cmd parameter */
> -		if (H2C_SUCCESS != disconnect_hdl(padapter, (u8 *)param))
> +		if (disconnect_hdl(padapter, (u8 *)param) != H2C_SUCCESS)

Actually disconnect_hdl() always return H2C_SUCCESS. Looks like this 
check can be dropped completely

Unfortunately, we can't make it return void, since it's used as part of 
wlancmds array :(



With regards,
Pavel Skripkin
