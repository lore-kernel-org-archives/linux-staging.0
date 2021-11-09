Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA422C8B
	for <linux-staging@lists.linux.dev>; Tue,  9 Nov 2021 12:09:25 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id 207so17654622ljf.10
        for <linux-staging@lists.linux.dev>; Tue, 09 Nov 2021 04:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=inlLdvzpkoaRfvqDwdO6AfqkbuKQgWLvBaKrT5vBfYk=;
        b=EBuzXgtUvQLReUBjLxFxKdPdPYPCcOlvCejKMTin63FG4IH10VVAZnb7nbzj3yUb/u
         AcprCIx829hd3wpJqtFkij64c8cAZqWS4E0jECZnMQAiWXHR7FzsNkew8yiY4ZhHPq2J
         yCnph55c5lZ2NqFTwgDfWOldpaT6GNVLsL77pyZXTEkdjFRl2eGarYFNTDiEgQP7h0wt
         Wm2nHwxnkiEPdGfHsITNQzw4CkoQOGqwPoXkEQzTDc5KjP2sow2XEv4ZEuTn6z9Skyfw
         zpzbxXzIkDYPjVaMVM2mnagFhJI4sL3jP6pCe9Bx0nRVINm/FHlXOraTJgEiQvtvOEyX
         5Ebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=inlLdvzpkoaRfvqDwdO6AfqkbuKQgWLvBaKrT5vBfYk=;
        b=01Gns/zSlHe+liODUDehKApyT+dn5nP+S48qvbTE4iMltACp2mxhanLm0YvhCw7N7j
         V8IV3/bYMmgQcJ9QZr0L0ZEUXH9zJASguBNTm2SWPazYD2cr37GDhf58k97CqZC5rCqO
         qJKdpf2cDqI5l3vuj5y5yDy7fnLSB5oKCJdMoKRK90aS8ObGeKKrPVFxxP6HJAZtcPqD
         9kAujp6wLcEoDqVzHLdMq23Va27C/ZFufyE7KepnwAd4LbsnBV+mpaHsRVr6KPepOwwk
         SOo/lsUjNFpHE3Pv6v1T6s+gpoUcnKnJdL/3meSozl2sv/0+snAbgMOHCRQ7s7Glje2I
         kKDw==
X-Gm-Message-State: AOAM5320Z6G08rvxD0bOTT1VpVvCuxjaWtxUApWRch3xbwu6yXZWNlIO
	SOtTydeWyh+3TChISXHGVyk=
X-Google-Smtp-Source: ABdhPJzeds/S7/9nXN47o0qtmg1EMzrpqkvsglDR37h1QniEy4BVnJprmaj2aIOD9NojmKrUCzY2UA==
X-Received: by 2002:a05:651c:1548:: with SMTP id y8mr4933721ljp.458.1636459763068;
        Tue, 09 Nov 2021 04:09:23 -0800 (PST)
Received: from [192.168.1.11] ([94.103.224.112])
        by smtp.gmail.com with ESMTPSA id c1sm1809788ljr.111.2021.11.09.04.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 04:09:22 -0800 (PST)
Message-ID: <c2c36a95-be34-bcaf-0224-a513e33a902e@gmail.com>
Date: Tue, 9 Nov 2021 15:09:21 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] staging: r8188eu: remove unneeded variable
Content-Language: en-US
To: cgel.zte@gmail.com, Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk, gregkh@linuxfoundation.org,
 straube.linux@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Changcheng Deng <deng.changcheng@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
References: <20211109115307.133100-1-deng.changcheng@zte.com.cn>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20211109115307.133100-1-deng.changcheng@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/9/21 14:53, cgel.zte@gmail.com wrote:
> From: Changcheng Deng <deng.changcheng@zte.com.cn>
> 
> Fix the following coccicheck review:
> ./drivers/staging/r8188eu/core/rtw_cmd.c: 66: 5-8: Unneeded variable
> 
> Remove unneeded variable used to store return value.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
> ---
>   drivers/staging/r8188eu/core/rtw_cmd.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> index e17332677daa..1b1c47f4a34e 100644
> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> @@ -62,8 +62,6 @@ static void c2h_wk_callback(struct work_struct *work);
>   
>   static int _rtw_init_evt_priv(struct evt_priv *pevtpriv)
>   {
> -	int res = _SUCCESS;
> -
>   	/* allocate DMA-able/Non-Page memory for cmd_buf and rsp_buf */
>   	atomic_set(&pevtpriv->event_seq, 0);
>   	pevtpriv->evt_done_cnt = 0;
> @@ -72,7 +70,7 @@ static int _rtw_init_evt_priv(struct evt_priv *pevtpriv)
>   	pevtpriv->c2h_wk_alive = false;
>   	pevtpriv->c2h_queue = rtw_cbuf_alloc(C2H_QUEUE_MAX_LEN + 1);
>   
> -	return res;
> +	return _SUCCESS;
>   }
>   

Shouldn't it return just void then?



With regards,
Pavel Skripkin
