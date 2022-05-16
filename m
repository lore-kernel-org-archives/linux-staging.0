Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5096A1376
	for <linux-staging@lists.linux.dev>; Mon, 16 May 2022 19:45:24 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id u23so27657229lfc.1
        for <linux-staging@lists.linux.dev>; Mon, 16 May 2022 12:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=uUfVm42ZQNq+014IW1sf3DQHsLIVj6aXXsUckSeTuwM=;
        b=V+moZ65xYCfiJkcirAAUUuL5GWd5JL8+6D06wvLfUPuwIY6fNQFLXCAGe/bRJTef3D
         dDtxNiVCSGvpF6a+vuzD4/4m62cQbzbEa8GF7YowgtPbzyuEmFkzUdXjuKBlkS0V9dZn
         yfUZ0Vt/Q8KvCThJcOvDYklKjRzc7VRy+mapzNeeCaAw0lICrm+n0tgI9iRkNlBhdAgM
         c/uBJL9pO7GAr52HJyVUOvhXHfJghKczv5N1p8pOCsztPc0Zz4SA/FsN20HeHrsRzHJ4
         cn/uR0ZaUd4zFd8jIsYLDI0waodll597mK8FXXX/t2TaVZcv8Ya26f3XMJonPjDAar7F
         FQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uUfVm42ZQNq+014IW1sf3DQHsLIVj6aXXsUckSeTuwM=;
        b=C3Vek6FRQU8ve5Cjp7GHU5D5AS/M7cd+jGWmOPGUY+NhfwXu9+lhEQ3h4vlE1KHxs4
         vGWaYxPN6c9ChJE3j6ozQcjox/BRIte9Wqa60N7hL/yhXA22Yyui4ELJ8HB0skKEZJle
         khMQEwAxUBf4X7qB+kK9VwT/8EzcQODxxw8+b3P+plGAEqjCjArx6qBVC9/6xL+GUsU6
         h3ElAcMaiYmjrHjhOx8A03lFAVjVge//3n2gF9bzqWF4oT7sadJm8ZdiiJKZ53AV50ot
         9WmxDT+sxE9U/V1bpBvk+RUCwnIvWnHv5CxsP/x6CcpwLODzdCkahIfan0ueFfTutM+f
         TtDw==
X-Gm-Message-State: AOAM533bHW3ZRrRpSp4KWjqoB+BbXDaW/5x11E1kCawssaF9EPpZbYVQ
	vaKgX8tN0l4129TI6m1qu1Q=
X-Google-Smtp-Source: ABdhPJzhuBrUIgSvINGOPQFV34k2TU982jsDwjgoIihymBDOgC4KtnTFCODJapFZn8pyN89Sc2pNzg==
X-Received: by 2002:a05:6512:1154:b0:472:65ab:4159 with SMTP id m20-20020a056512115400b0047265ab4159mr13927604lfg.411.1652730322328;
        Mon, 16 May 2022 12:45:22 -0700 (PDT)
Received: from [192.168.1.11] ([217.117.245.216])
        by smtp.gmail.com with ESMTPSA id j10-20020a2e800a000000b002539c858cccsm1424256ljg.49.2022.05.16.12.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 12:45:21 -0700 (PDT)
Message-ID: <7b926f43-8c6b-6eae-edc6-02dc16376eb0@gmail.com>
Date: Mon, 16 May 2022 22:45:20 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/3] staging: r8188eu: fix checkpatch.pl warnings in
 rtw_pwrctrl
Content-Language: en-US
To: Vihas Makwana <makvihas@gmail.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20220516170306.6008-1-makvihas@gmail.com>
 <20220516170306.6008-3-makvihas@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220516170306.6008-3-makvihas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vihas,

On 5/16/22 20:03, Vihas Makwana wrote:
> Refactor the code to fix following warnings:
>      WARNING: Comparisons should place the constant on the right side of the test
> 
> Signed-off-by: Vihas Makwana <makvihas@gmail.com>
> ---

[code snip]

>   		if ((pwrpriv->smart_ps == smart_ps) &&
> @@ -356,7 +356,7 @@ void rtw_init_pwrctrl_priv(struct adapter *padapter)
>   
>   	pwrctrlpriv->LpsIdleCount = 0;
>   	pwrctrlpriv->power_mgnt = padapter->registrypriv.power_mgnt;/*  PS_MODE_MIN; */
> -	pwrctrlpriv->bLeisurePs = PS_MODE_ACTIVE != pwrctrlpriv->power_mgnt;
> +	pwrctrlpriv->bLeisurePs =  pwrctrlpriv->power_mgnt != PS_MODE_ACTIVE;
>   

Please remove extra space




With regards,
Pavel Skripkin
