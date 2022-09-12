Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96BF1C29
	for <linux-staging@lists.linux.dev>; Mon, 12 Sep 2022 18:41:46 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id dv25so22227517ejb.12
        for <linux-staging@lists.linux.dev>; Mon, 12 Sep 2022 11:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=MQD/YZKKsSAPByH7OP1dF0G+HDMpJwM4coeTZ3+yRho=;
        b=M1wTVRT5z2jhy1GkmMcs4SZSrW2CrhbUdl6/1dNTrQBLiIm/YdQaWXHcDGt9ofX6He
         I49SJfNf4Op9o+7kKDPgM3tf8+tPhsffZYE7qPthXT4oEn/RFQFrbInl7azTzQLP+WBg
         ilgiJpAXmGfZ5rM71YIflcJZgAPKUPbnfG13EU+raO74AqfC8tFzRcludXAjXEY4MMJ0
         zdpqOhEGS98cmcCDeAAtU5EghQiDhTlnJCCBQBK+6dDq+X9cANDHpn3lksZO1J/ZHLPU
         pn2/li0TbG8zidU32YxgE0+c+rFwnBC2UmQaONs2xKdyLLKJurLzb4hygrJDsmESuyHp
         yerw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=MQD/YZKKsSAPByH7OP1dF0G+HDMpJwM4coeTZ3+yRho=;
        b=NktTETf8V4TrB1gEXFaVzcHuoguYP/JQ2Esxr+MqBvAedoPIumIZ0ANQFdI+k+jhtF
         JLNLwB2lE6l6E2RT/bHBS/uRCCWG1m2kVT7FbkhFYsjmjbrN90frytI5IPjAsN+HZbS9
         LiZIvUrUHu0XMCbgKXN7D5ANYYBkRqCNVfIhmvGlCAv94T0aB7fPM6GPdiZdswDjn0Xw
         AGV6nsgve28PiRtgfsH0x9xFQUVQFgH9cme5mDgDTkdHTHqe5CLPyh0ULwyw2CKHfH12
         GEgYaehKWMVjps3A8qGLg2VSguBKjhMFfY8tpv642ZL9HYVafkYgWXWbSO4objTNkX9J
         l/NA==
X-Gm-Message-State: ACgBeo15XfQ0B38XtS06o3iBugDwdR/m8FaFTfxT6nPTQ3kpTHeGRXPd
	34/kCNf8cWcgXbqA8O8asv4=
X-Google-Smtp-Source: AA6agR6/EfLbd8HHkWtIOfJkgvXO/wNUcXLd8RXEpZvx5Wd6cNhgLW3awLT4MAkZ290gQnCWUw79/w==
X-Received: by 2002:a17:907:2d2a:b0:77e:def7:65e9 with SMTP id gs42-20020a1709072d2a00b0077edef765e9mr2618918ejc.85.1663008104955;
        Mon, 12 Sep 2022 11:41:44 -0700 (PDT)
Received: from [192.168.1.102] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id fw18-20020a170907501200b0073dbaeb50f6sm4797433ejc.169.2022.09.12.11.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 11:41:44 -0700 (PDT)
Message-ID: <872cb7eb-b0b8-2d0e-7fd1-5ac47af6bd55@gmail.com>
Date: Mon, 12 Sep 2022 20:41:41 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5] staging: r8188eu: add kfree() on an error path of
 rtw_xmit_resource_alloc()
Content-Language: en-US
To: xkernel.wang@foxmail.com, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <tencent_3B46EE3287288555389AD2EC3F388827B306@qq.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <tencent_3B46EE3287288555389AD2EC3F388827B306@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/22 04:50, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> In rtw_xmit_resource_alloc(), if usb_alloc_urb() fails, then the memory
> `pxmitbuf->pallocated_buf` which is allocated by kzalloc() is not properly
> released before returning.
> So this patch adds kfree() on the above error path to release it in time.
> 
> Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
> ---
> ChangeLog:
> v1->v2 update the description.
> v2->v3 rebase.
> v3->v4 update the description.
> v4->v5 rebase and update the corresponding subject and description.
> Note that the original function name was changed, so the subject of this
> patch is updated from "[PATCH v4] staging: r8188eu: fix potential memory
> leak in rtw_os_xmit_resource_alloc()" to "[PATCH v5] staging: r8188eu: add
> kfree() on an error path of rtw_xmit_resource_alloc()".
> In addition, thanks to Philipp Hortmann for his testing and advice.
>   drivers/staging/r8188eu/core/rtw_xmit.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
> index 67f9c05..9c39d08 100644
> --- a/drivers/staging/r8188eu/core/rtw_xmit.c
> +++ b/drivers/staging/r8188eu/core/rtw_xmit.c
> @@ -44,8 +44,10 @@ static int rtw_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *px
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

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
