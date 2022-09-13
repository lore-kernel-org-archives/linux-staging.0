Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919DC66E8
	for <linux-staging@lists.linux.dev>; Tue, 13 Sep 2022 18:59:11 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id 29so18985641edv.2
        for <linux-staging@lists.linux.dev>; Tue, 13 Sep 2022 11:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=wnjNLWqLvxTBVKq68tZoPQz/0p3I7bskBpdhNCw1moo=;
        b=UKsIK9iUoyOlYvzHPAI2yW+XoD1zh6MVa5jIsepLGTY2sjM7j7ykL8Wpv8kflswoIy
         njHDnOB5F8qPtRK1rQCABBdjvnptyPMIMTnzxYZHl4DWLiyt4MCbyCkyF0LscrC9kSTk
         SsFDG4igKf7FnAXPUWm+3+EZ1Fd21A4aRG/YAfmjj5GFC34Y2cUbslMNv9c+bI3Gsbfn
         QaDdSK5jGt5nmbMla8I/UGqO9S8Fo2bgOZHUdLA+0pFzAjlKlNTU6otsMp0rJjMTzJPa
         7w8Jt3repjs524DcYdSgGhM3okJftK9olGiMp3Ozmie2s0nzzIHQIyHywgmtd77Oc0DJ
         UehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=wnjNLWqLvxTBVKq68tZoPQz/0p3I7bskBpdhNCw1moo=;
        b=3UJgNhDaF9D1Cf6xOk1aLPVQBtF8tWoZN9lz2Y8/fGZBWsZ4qN+I1RmPM/LKzchPJX
         akK+9L95nNVGU0qKRqABa0cjM22sNfqmTyQa0EJTuqvAlnU1RR3u9TLeB466BLWct6F8
         usn1kUjO7fJdbJGFkvC4Y30XCaTK2++HvziZeGS9d6/6gWZTXlev9cFyV7SDLaGbP4el
         g9aAeOD6C0C/QdjYIYgdw8wGhT6BnxAlI1gMiJ+Zx638ViTCqWgUEbk1Rf9WgrNR+F61
         2cSkPkDuc2LX3hCCJSW4YohY7GP4PxwXo8IJxmQyl/jmBIBrqrLq/bWbQW5Gu/0t5ZL1
         /thg==
X-Gm-Message-State: ACgBeo3dLG/69GLgh0Z+vGg2str6w8Q875Yfpyd8y1YmaqGkrSFF1um7
	Jww4K0uRXA4IU1naOrGJVQE=
X-Google-Smtp-Source: AA6agR7qFa3g0Aca1/JOZTw2TqhrknVx2ZyiJb8q4AWRpkw4HKQ7MDymWkNciSDNGORCrbqSathjug==
X-Received: by 2002:a05:6402:42d3:b0:435:2c49:313d with SMTP id i19-20020a05640242d300b004352c49313dmr27393235edc.86.1663095549640;
        Tue, 13 Sep 2022 11:59:09 -0700 (PDT)
Received: from [192.168.1.100] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id c26-20020a056402101a00b0044792480994sm8170318edu.68.2022.09.13.11.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 11:59:09 -0700 (PDT)
Message-ID: <32f21c8e-d5c1-0582-f31c-24f521e7eb9a@gmail.com>
Date: Tue, 13 Sep 2022 20:59:07 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4] staging: r8188eu: fix potential memory leak in
 _rtw_init_xmit_priv()
Content-Language: en-US
To: xkernel.wang@foxmail.com, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <tencent_DB57E4F270F4539485C32B05FDAF8394310A@qq.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <tencent_DB57E4F270F4539485C32B05FDAF8394310A@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/13/22 15:24, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> In _rtw_init_xmit_priv(), there are several error paths for allocation
> failures just jump to the `exit` section. However, there is no action
> will be performed, so the allocated resources are not properly released,
> which leads to various memory leaks.
> 
> To properly release them, this patch unifies the error handling code and
> several error handling paths are added.
> According to the allocation sequence, if the validation fails, it will
> jump to its corresponding error tag to release the resources.
> 
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
> ---
> ChangeLog:
> v1->v2 update the description and adjust the sequence of patches.
> v2->v3 None to this patch, but some to another patch in this series.
> v3->v4 rebase the original series and merge them due to the missing check
> for kzalloc() in rtw_alloc_hwxmits() had been added.
>   drivers/staging/r8188eu/core/rtw_xmit.c | 30 ++++++++++++++++++++-----
>   1 file changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
> index 9c39d08..9e70c79 100644
> --- a/drivers/staging/r8188eu/core/rtw_xmit.c
> +++ b/drivers/staging/r8188eu/core/rtw_xmit.c
> @@ -134,7 +134,7 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
>   
>   	if (!pxmitpriv->pallocated_xmitbuf) {
>   		res = _FAIL;
> -		goto exit;
> +		goto free_frame_buf;
>   	}
>   
>   	pxmitpriv->pxmitbuf = (u8 *)ALIGN((size_t)(pxmitpriv->pallocated_xmitbuf), 4);
> @@ -156,7 +156,7 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
>   			msleep(10);
>   			res = rtw_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ));
>   			if (res == _FAIL)
> -				goto exit;
> +				goto free_xmitbuf;
>   		}
>   
>   		pxmitbuf->flags = XMIT_VO_QUEUE;
> @@ -174,7 +174,7 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
>   
>   	if (!pxmitpriv->pallocated_xmit_extbuf) {
>   		res = _FAIL;
> -		goto exit;
> +		goto free_xmitbuf;
>   	}
>   
>   	pxmitpriv->pxmit_extbuf = (u8 *)ALIGN((size_t)(pxmitpriv->pallocated_xmit_extbuf), 4);
> @@ -191,7 +191,7 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
>   		res = rtw_xmit_resource_alloc(padapter, pxmitbuf, max_xmit_extbuf_size + XMITBUF_ALIGN_SZ);
>   		if (res == _FAIL) {
>   			res = _FAIL;
> -			goto exit;
> +			goto free_xmit_extbuf;
>   		}
>   
>   		list_add_tail(&pxmitbuf->list, &pxmitpriv->free_xmit_extbuf_queue.queue);
> @@ -202,7 +202,7 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
>   
>   	if (rtw_alloc_hwxmits(padapter)) {
>   		res = _FAIL;
> -		goto exit;
> +		goto free_xmit_extbuf;
>   	}
>   
>   	rtw_init_hwxmits(pxmitpriv->hwxmits, pxmitpriv->hwxmit_entry);
> @@ -226,8 +226,26 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
>   
>   	rtl8188eu_init_xmit_priv(padapter);
>   
> -exit:
> +	return _SUCCESS;
>   
> +free_xmit_extbuf:
> +	pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmit_extbuf;
> +	while (i--) {
> +		rtw_xmit_resource_free(padapter, pxmitbuf, (max_xmit_extbuf_size + XMITBUF_ALIGN_SZ));
> +		pxmitbuf++;
> +	}
> +	vfree(pxmitpriv->pallocated_xmit_extbuf);
> +	i = NR_XMITBUFF;
> +free_xmitbuf:
> +	pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmitbuf;
> +	while (i--) {
> +		rtw_xmit_resource_free(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ));
> +		pxmitbuf++;
> +	}
> +	vfree(pxmitpriv->pallocated_xmitbuf);
> +free_frame_buf:
> +	vfree(pxmitpriv->pallocated_frame_buf);
> +exit:
>   	return res;
>   }
>   

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
