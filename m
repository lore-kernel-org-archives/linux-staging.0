Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488AE23AB;
	Wed, 13 Apr 2022 20:34:19 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id k5so5608516lfg.9;
        Wed, 13 Apr 2022 13:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=v/vz88+MzPaF9+gxdJjGj9X24km3lwGNweK9uHwzCBE=;
        b=LcP3wgBirZj9Ean8yRjuduXu8kcCP+8ZJJviSlkM0WcUGQVUW9r3Beube3Q/w8167U
         fnHJSfeViDL5ZLnwl2lHsNXTGGa/t9CWxXeKtalepowghtRZk9bEIHwhvd5q5oqJpLm7
         VVFbNA4biJ541tbDKQ8QEPuLizcbl8zNut09yKmxiQc+gdabofYoBL8Nt/FWJIgzbD3c
         LFVVIa5vbG8JX4fcNjf73J6MyM+b4z/Cv/+MN08wa8Qnp9GrySucokoF6dA9F2VSPVwp
         +5jQn+c2Oe42MgA5kJyoh+SlTHli796o4nSdsTdXLAhnhdgJ8nRebGXKgVWJ73xQo/im
         61zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=v/vz88+MzPaF9+gxdJjGj9X24km3lwGNweK9uHwzCBE=;
        b=xIHyGVbyjeD8PYNA63tDNil9M+ic9oR+WP7Xs/1xyiRhk+8qeOWVeL1RmSmCYrcF69
         RT8oKBEQDxcnTK86phcsK+Ia3Uanb20K5LKwf3Osv36IewIKsbAUSbB2HJg+x5/EzE9K
         oqbYKirjA0K8BbxZo865qUh0lQdy1sXM4tgF2SNJeu91zLnN44XrWS9p2nM2kyS3CS7y
         nYJ6xjveONk6rrUWANTy8usSLKKkAT9gTg1QnjKSxJkR/kokDO/NZa/rJjJ1V7nvqSCj
         XtoFTL/ywxJxO48mvplxNSplaDWbuFuArJ4piYBc3vjXhAAME10Cwg8sD1cm90QYJKV0
         3ctQ==
X-Gm-Message-State: AOAM533zYkHxpqd1yH+byF2Q5yvJHtdJOeYSzQxhaGnzdK9psm5pEdRi
	nN0ebeIyN8MHN72gJaKyPcKWOiD5jPtxjw==
X-Google-Smtp-Source: ABdhPJxN01CWnr32DOv6C3yB1Nh97ZYIuWrEWuN2tQ9CtSTD4i8eVnP0H+vGx/FX7bTWphFt6EEtuQ==
X-Received: by 2002:a05:6512:1322:b0:44b:75d:ac8 with SMTP id x34-20020a056512132200b0044b075d0ac8mr28290383lfu.213.1649882057138;
        Wed, 13 Apr 2022 13:34:17 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.225.17])
        by smtp.gmail.com with ESMTPSA id e18-20020a196752000000b0046b8d3cd18csm2754lfj.55.2022.04.13.13.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 13:34:16 -0700 (PDT)
Message-ID: <e32f1f61-127c-3e90-0f06-7b60cdca9ef7@gmail.com>
Date: Wed, 13 Apr 2022 23:34:14 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 5/6] staging: r8188eu: replace spaces with tabs
Content-Language: en-US
To: Jaehee Park <jhpark1013@gmail.com>, Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
References: <cover.1649880454.git.jhpark1013@gmail.com>
 <c2d719eba2a374be573034022218a098e4db9e77.1649880454.git.jhpark1013@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <c2d719eba2a374be573034022218a098e4db9e77.1649880454.git.jhpark1013@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jaehee,

On 4/13/22 23:11, Jaehee Park wrote:
> Use tabs instead of spaces. Issue found with checkpatch.
> WARNING: suspect code indent for conditional statements
> 
> Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_mlme.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
> index b943fb190e4c..7a90fe826d1d 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme.c
> @@ -722,7 +722,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
>   			pmlmepriv->to_join = false;
>   			s_ret = rtw_select_and_join_from_scanned_queue(pmlmepriv);
>   			if (s_ret == _SUCCESS) {
> -			     _set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
> +				_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
>   			} else if (s_ret == 2) { /* there is no need to wait for join */
>   				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
>   				rtw_indicate_connect(adapter);

Not related to your patch, but looks like `s_ret` can't be 2.

rtw_select_and_join_from_scanned_queue

   rtw_joinbss_cmd

     rtw_enqueue_cmd
       _rtw_enqueue_cmd <- always returns SUCCESS


Other functions from calltrace may return _FAIL, but _FAIL is not equal 
2, right?



With regards,
Pavel Skripkin
