Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A6129A8
	for <linux-staging@lists.linux.dev>; Tue, 27 Sep 2022 18:31:14 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id 13so22521522ejn.3
        for <linux-staging@lists.linux.dev>; Tue, 27 Sep 2022 11:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=GbjflNmyKcHQxtBbRY2ZYzdhvy4qhxHQV+4ZwrGPvwg=;
        b=KAy4MKDlNOgEBuGEMZtOxpukgzSN95Rg+eSyP70/KcEGoSit7Dqe/sOMRGpc/ih+jY
         MeN5iG6MjlpvuwahxSc16HIe5/hFMJiSNjIntnawqEKotpluIqwCmzJS2iwzLNVshQZ8
         4FtIXLhXLpbT2F5seQ8jh1kg+Ona2vhkvGLr+46msFD5iCxuzoehm5vLkyC9jDWaA0RP
         5Oa0mT6BZQUnlzpVqGhqq7Rzih/jND5L2FELTd91rmIiz8iIb4quWgOrcS9zJP4FJHFe
         qzxJY3IvSwx9T5STQ3Jll7hVUPmOdwB8H3fAJnf4yNfdbkxuJG3d3Pw2udYoMV0/IP1P
         K6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=GbjflNmyKcHQxtBbRY2ZYzdhvy4qhxHQV+4ZwrGPvwg=;
        b=DlGYLrfnFh2ocdUDBe5j1eCSfL9BbN2iO53P2Xf7Joq4294G8gFQkmYfM9IC84o7Zc
         r5dImqQxC1VJI4UpOosNA0p4vArVhJ9Jtu9JiEMMDli+r1czO6oIjNNJnE+X9OrVwb3d
         cxu7GyJV/SRqLoQK5bZKwO8f34ADwiMaRxhTS0G5L+hnfCQA+5AaY3ZXeOfhZ2c02kmP
         MOEniuRyDdKQPJkxg0s4o7b+6agck6rhPKihjrOdCg8MGo/OuivNHLF6BaH+/NSlnJyT
         rnevpJUoAKKyjABDU1zzHP3m+Sp1c1kDldTq/M7VX2C6QznFbxZ0oLi/VsE4rFg49mnZ
         szmQ==
X-Gm-Message-State: ACrzQf1LATrnH/ufQB766Zon6KwqMcU6jIjoJC3RwOffRbJs64oYxO5f
	hcNK9U4xpLH0ZhV3Zl2JlzMuVjjQ65U=
X-Google-Smtp-Source: AMsMyM6jE98KQoqconk08AtEp7D2EPPFP+OtUG70HRU010HCh92MlJWWPooqU/s89b9Rli6uTwMx/Q==
X-Received: by 2002:a17:907:6ea1:b0:783:cc69:342 with SMTP id sh33-20020a1709076ea100b00783cc690342mr6642508ejc.97.1664303473135;
        Tue, 27 Sep 2022 11:31:13 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id l10-20020a1709063d2a00b0076fcde2ff37sm1179359ejf.70.2022.09.27.11.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 11:31:12 -0700 (PDT)
Date: Tue, 27 Sep 2022 20:31:10 +0200
From: philipp hortmann <philipp.g.hortmann@gmail.com>
To: Shang XiaoJing <shangxiaojing@huawei.com>
Cc: gregkh@linuxfoundation.org, wjsota@gmail.com,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH -next] staging: rtl8192e: cmdpkt: Use skb_put_data()
 instead of skb_put/memcpy pair
Message-ID: <20220927183110.GA16965@matrix-ESPRIMO-P710>
References: <20220927024220.14044-1-shangxiaojing@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927024220.14044-1-shangxiaojing@huawei.com>

Tue, Sep 27, 2022 at 10:42:20AM +0800, Shang XiaoJing wrote:
> Use skb_put_data() instead of skb_put() and memcpy(), which is shorter
> and clear.
> 
> Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
> ---
>  drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
> index cd8bbc358d01..57b4c8433e8e 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
> @@ -61,8 +61,7 @@ bool rtl92e_send_cmd_pkt(struct net_device *dev, u32 type, const void *data,
>  			tcb_desc->txbuf_size = frag_length;
>  		}
>  
> -		seg_ptr = skb_put(skb, frag_length);
> -		memcpy(seg_ptr, data, (u32)frag_length);
> +		skb_put_data(skb, data, frag_length);
>  
>  		if (type == DESC_PACKET_TYPE_INIT &&
>  		    (!priv->rtllib->check_nic_enough_desc(dev, TXCMD_QUEUE) ||
> -- 
> 2.17.1
>
Applying: staging: rtl8192e: cmdpkt: Use skb_put_data() instead of skb_put/memcpy pair
error: patch failed: drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c:61
error: drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c: patch does not apply
Patch failed at 0001 staging: rtl8192e: cmdpkt: Use skb_put_data() instead of skb_put/memcpy pair

Sorry 
Bye Philipp
