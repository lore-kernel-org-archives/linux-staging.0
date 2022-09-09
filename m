Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A245A4C62
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 17:31:33 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id y17so538050ejo.6
        for <linux-staging@lists.linux.dev>; Fri, 09 Sep 2022 10:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=KBKK7iFKML2I5N/b2jqG9ifqUfWsm45jjFjrGgVshBE=;
        b=CXT/bIwlhl3oInco0vLlYWMvsALVMY9M2FFs4ZDXwEhUp9cwFSr3qLXyM2A+PlY/oH
         QIaE74MiTVwaYm8RgF/qWf8673QmZ8EmkBBjgtZa+scTL6LUJcfaNm7daNXdKNoc2HG+
         VPdeoQYnifePI1QUxmFiFUeL8+KaUePebSlJlE33OVrz8vBaDl7FYiMcpy168xGHp9Ty
         Bq3xS/48JbXF4YyrRX+Oczyl7jPMGuNSmszRoVFM30rA9hVr1n6owsQryJsAV3Gi+78L
         64jMueQqe/Kbms0DqG6Q+nMhJV4HRwWT7ATbXXs5zp17fkDFoQMnagvScpFPIw/nXdn4
         D+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=KBKK7iFKML2I5N/b2jqG9ifqUfWsm45jjFjrGgVshBE=;
        b=7MtZWUeWii2qLWbXxtrADqYLkf43TNpqL4PGcOqEBqdQooIlHUrwjviaEyvXOjHeCu
         m8ET8zh9BMMEqBA1a5ih2/1DJmGOs2BqCJbnwkGw3W15MEL6RJ/OtLa6subiqYy3DgTz
         zHW1Z+fIig33QkTHQ23MAu1F6F9FXzwwl3cmpeecmLM5C9To8/LGtIzhzwgP5tbbXkjM
         1cHUz0WmKuLcw+9KLaci6i3EfkUoc6cK+vE4GTAcO4Y4k9dALQ4WK9iVWrah9KZRnsST
         Gu8n0MDnYRwh1k553AtTM2zriD/kshfW0aj0/SfKa7X1hq8xc5lKjcGS8QenqBgwE1op
         dEjA==
X-Gm-Message-State: ACgBeo2LWe38Anou26dG53TYs19+4/glAK3J2sKd9XXTH4/FMl5pIJPH
	Lj9sHPyna/TodaoY1pa26HY=
X-Google-Smtp-Source: AA6agR7TS68ddeStQHKwymQaHg9a7RjDpF0riStmq2Xv/AAK1a36h+wA34hUefwEk/nMQoLUbLj3sw==
X-Received: by 2002:a17:907:7292:b0:733:1965:3176 with SMTP id dt18-20020a170907729200b0073319653176mr10437381ejc.318.1662744691733;
        Fri, 09 Sep 2022 10:31:31 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f3e:6a99:2499:da3b:c93f:9b48? (p200300c78f3e6a992499da3bc93f9b48.dip0.t-ipconnect.de. [2003:c7:8f3e:6a99:2499:da3b:c93f:9b48])
        by smtp.gmail.com with ESMTPSA id f9-20020a17090660c900b0073c80d008d5sm531354ejk.122.2022.09.09.10.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 10:31:31 -0700 (PDT)
Message-ID: <659ff470-a912-4f35-6cbe-e3f49ba29dc8@gmail.com>
Date: Fri, 9 Sep 2022 19:31:29 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4] staging: r8188eu: fix potential memory leak in
 rtw_os_xmit_resource_alloc()
Content-Language: en-US
To: xkernel.wang@foxmail.com, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <tencent_7705902B66DA5C1C0E3E8ACBF077A5C3FF07@qq.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <tencent_7705902B66DA5C1C0E3E8ACBF077A5C3FF07@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/22 13:44, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> In rtw_os_xmit_resource_alloc(), if usb_alloc_urb() fails, then the
> memory `pxmitbuf_pallocated_buf` which is allocated by kzalloc() is not
> properly released before returning.
> 
> So this patch add kfree() on the above error path to release it. As there
> is no proper device to test with, no runtime testing was performed.
> 
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
> ---
> ChangeLog:
> v1->v2 update the description.
> v2->v3 rebase.
> v3->v4 update the description.
>   drivers/staging/r8188eu/os_dep/xmit_linux.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/os_dep/xmit_linux.c b/drivers/staging/r8188eu/os_dep/xmit_linux.c
> index 89a598a..f25099d 100644
> --- a/drivers/staging/r8188eu/os_dep/xmit_linux.c
> +++ b/drivers/staging/r8188eu/os_dep/xmit_linux.c
> @@ -75,8 +75,10 @@ int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *pxmitb
>   	pxmitbuf->dma_transfer_addr = 0;
>   
>   	pxmitbuf->pxmit_urb = usb_alloc_urb(0, GFP_KERNEL);
> -	if (!pxmitbuf->pxmit_urb)
> +	if (!pxmitbuf->pxmit_urb) {
> +		kfree(pxmitbuf->pallocated_buf);
>   		return _FAIL;
> +	}
>   
>   	return _SUCCESS;
>   }

Hi,

I cannot apply your patch:

kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ cat 
~/Downloads/\[PATCH\ v4\]\ staging\ r8188eu\ fix\ potential\ memory\ 
leak\ in\ rtw_os_xmit_resource_alloc\(\).eml | git am
Applying: staging: r8188eu: fix potential memory leak in 
rtw_os_xmit_resource_alloc()
error: drivers/staging/r8188eu/os_dep/xmit_linux.c: does not exist in index
Patch failed at 0001 staging: r8188eu: fix potential memory leak in 
rtw_os_xmit_resource_alloc()

branch: staging-next
repository: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git

Sorry

Bye Philipp
