Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA41F7C
	for <linux-staging@lists.linux.dev>; Fri, 24 Jun 2022 18:01:44 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id fd6so4532942edb.5
        for <linux-staging@lists.linux.dev>; Fri, 24 Jun 2022 11:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FihH+wFZdHJzWdAHO5W9L+MEXrCjKPFXmbCyP+M30fc=;
        b=CfgI1rTukijr/p19JI7e9i/2E8rGCaNwtR63+EGnzZQdw3kfOo75LFCH8sm5OrZU+h
         yVfD+TuO+K2UfqyURxxTXLnV2sH0dBr3kGYBdUvFM2+sxlbxuYm3YI57KUSBXi4L3Q+J
         R33opJx/huDwfocZTx3naQjd6b0xK4xVIPsE52Cci0GHpW79/doJv6s9Bw+Ni853gTkv
         xV5t/D7uKH9Psp46Kh1C9RXSEfBDE5cPmYDE07Ss9/euZrTHI+6lZdAVhWOouc55yd/M
         uwnwrOJ7OOMBHbMLdWt1Iiv4GlnD7amK/jWdG4zmm0Bx1Sv7zIyX5QJY1yVg8dUFxoVX
         mT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FihH+wFZdHJzWdAHO5W9L+MEXrCjKPFXmbCyP+M30fc=;
        b=anBnFfLf2Pzc3RpcU2roq7TRLRP+Qg9cLGgIhpwtTS3XxK4o3NKjaqJRivLAvnkJQY
         Cz6aiDSJ8l9KnrDTLfIqQJ89fEKKe9ZeLqNGbLtkBS0ntfO/TpqQ5JEtW/5ikABX3F3+
         9TPw55NzfSKbtwo2jiumRu1TaEGP2km/xBlqNH4rwos3ySE7MqYmqW+jTRMvaR1RTdb2
         g866n9tyAUkICQa5JeWNXdTNYOYEwgPP5Rrw2YFO3sQ2DGZtT5f0rbfSo+SIX6gLFGtq
         rjTQrvYjUOcUpZjtaBPml3xhzwOd6zr+//uauHpBgx6Q2wsfugzhkglDjT8Z0xpWpYBT
         irbw==
X-Gm-Message-State: AJIora+JRpL+iESJculZVH2Hw9mvPGd2/SsKFJ1TyxjkMz2GG/940O+i
	WBusf7jmF2NIUdf5emSOAYQ=
X-Google-Smtp-Source: AGRyM1td++ElRAofxZa9qKQ/SuYdcx8iXCAN3JnpO5oQCuWWgdSayAZaLIykYwWrH0+Plit+9wT68g==
X-Received: by 2002:a05:6402:2706:b0:430:6238:78d5 with SMTP id y6-20020a056402270600b00430623878d5mr329759edd.413.1656093702880;
        Fri, 24 Jun 2022 11:01:42 -0700 (PDT)
Received: from [192.168.1.100] (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id x10-20020a170906298a00b00705cd37fd5asm1489202eje.72.2022.06.24.11.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 11:01:42 -0700 (PDT)
Message-ID: <50badb0b-0cac-d935-02bf-f05403f6d765@gmail.com>
Date: Fri, 24 Jun 2022 20:01:41 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4] staging: r8188eu: core/rtw_recv.c: clean up nested if
 statements
Content-Language: en-US
To: Chang Yu <marcus.yu.56@gmail.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220624144526.437322-1-marcus.yu.56@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220624144526.437322-1-marcus.yu.56@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/22 16:45, Chang Yu wrote:
> Combine two nested if statements into a single one to fix indentation
> issue and improve readability, as suggested by checkpatch.pl
> 
> Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
> ---
> Changes in v4:
>   - Added missing change log and resend
> 
> Changes in v3:
>   - Modified subject and description to be more descriptive
> 
> Changes in v2:
>   - Added a pair of parentheses to make operator precedence explicit
> 
> 
>   drivers/staging/r8188eu/core/rtw_recv.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
> index 6564e82ddd66..020bc212532f 100644
> --- a/drivers/staging/r8188eu/core/rtw_recv.c
> +++ b/drivers/staging/r8188eu/core/rtw_recv.c
> @@ -166,10 +166,8 @@ int rtw_free_recvframe(struct recv_frame *precvframe, struct __queue *pfree_recv
>   
>   	list_add_tail(&precvframe->list, get_list_head(pfree_recv_queue));
>   
> -	if (padapter) {
> -		if (pfree_recv_queue == &precvpriv->free_recv_queue)
> -				precvpriv->free_recvframe_cnt++;
> -	}
> +	if (padapter && (pfree_recv_queue == &precvpriv->free_recv_queue))
> +		precvpriv->free_recvframe_cnt++;
>   
>   	spin_unlock_bh(&pfree_recv_queue->lock);
>   

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
