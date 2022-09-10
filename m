Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC19A40
	for <linux-staging@lists.linux.dev>; Sat, 10 Sep 2022 06:29:07 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id dv25so8816139ejb.12
        for <linux-staging@lists.linux.dev>; Fri, 09 Sep 2022 23:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ZTuu2gUdZr5DySwjOMJBuPe4tNMA1YFFv9H1miY+0Uw=;
        b=jpEpO4i3fEtgVCvZ3Qs8weVO2BtRkvK9pU1/1eIO8Nclx8vvwswUG2ojYCYj7oxQJ8
         vmvvpxmgVQNu/J6h+F/LrTL8odjeBmR3LhHoz2XYjBzD8w4Stoq1eP79Yu5IrU7XxxD4
         eRzhf2MpKbQE4TSQYFNHX7gHx5PKRMA8X9Uif4B0RI7mlDVH5NwXGriVTujmQfFjCkwN
         yhk7Gh0zpB+pDfjtXMaXSQ7rjoMw2dTdTK01jBNBuvPrHj0x39A4nk1lUmR7zyNN3wwi
         hJOp5pCJXcbov+Tlk1OJprK7PuxQMslDwdhftsQcxb1Ss1apiskSP7I7NzaGOnNEI8Lj
         JCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ZTuu2gUdZr5DySwjOMJBuPe4tNMA1YFFv9H1miY+0Uw=;
        b=PXOiOgsEvRrDVvtG2pciiL4FSPVUkFotgYzjH9N45axM0mP+rZwCpH401BYAGUdCf4
         TaNqxTP36EsYifMun+CN34ukp7Y7YC8Ky22asNTpQuvFMpPSzKM98s0ldEkSrqc6FEhm
         P6kJVKIAIpLTla+u1Krl0IkWwXVdlGphIiazeqPwNqAf2R6iQXBJnsUe40hILWxGEW1M
         p0ygAKM38lM2lHR1ZODOd/xL0+RGa4Bmj01rKamJ9D5uRjfqyCZ/HIjyRWKHRq6r9V9s
         FIYsgcD64fmLV/DsynilypOtOmrDJ7rfKkdetal2Zl/TSuKyjnpmlD31yFDCm3U15Mw5
         WHqw==
X-Gm-Message-State: ACgBeo2BmNevjxKNEB0Et/NY1LUzSl3yljvJlrSUO1NF8sN8vT85s5eL
	Fzz4DCw+lpqb0/JexvuB7ME=
X-Google-Smtp-Source: AA6agR74ZdiJrO/fuR7ZfexUeUquOlWT8U8TOl3FcYfkoF0HTarb0jTxaZHGSvi5IKQjudYGXe4OUA==
X-Received: by 2002:a17:906:8477:b0:77a:6e22:72f9 with SMTP id hx23-20020a170906847700b0077a6e2272f9mr3057779ejc.170.1662791345365;
        Fri, 09 Sep 2022 23:29:05 -0700 (PDT)
Received: from [192.168.1.101] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id gx6-20020a1709068a4600b0073d68d2fc29sm1254282ejc.218.2022.09.09.23.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 23:29:05 -0700 (PDT)
Message-ID: <75e8636b-71f4-1334-47c6-0e60f26a2d0a@gmail.com>
Date: Sat, 10 Sep 2022 08:29:03 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: r8188eu: add kfree() on an error path of
 rtw_xmit_resource_alloc()
Content-Language: en-US
To: xkernel.wang@foxmail.com, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <tencent_DD1047278567B897D2CF7F13483573596E06@qq.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <tencent_DD1047278567B897D2CF7F13483573596E06@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/22 02:29, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> In rtw_xmit_resource_alloc(), if usb_alloc_urb() fails, then the memory
> `pxmitbuf->pallocated_buf` which is allocated by kzalloc() is not properly
> released before returning.
> 
> So this patch adds kfree() on the above error path to release it. As there
> is no proper device to test with, no runtime testing was performed.
> 
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
> ---
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

Hi Xiaoke,

I applied your patch and tested it. That is OK.

But you excluded the change history. Usually this is not accepted by 
Greg. Reason is that what identifies the patch is the change itself. The 
change itself is the same as: "[PATCH v4] staging: r8188eu: fix 
potential memory leak in rtw_os_xmit_resource_alloc()" Even if you 
change the Subject, Description and the branch it remains the same patch 
for Greg.

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150

