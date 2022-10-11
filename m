Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CA23D75
	for <linux-staging@lists.linux.dev>; Tue, 11 Oct 2022 19:44:37 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id v12so3342073edc.6
        for <linux-staging@lists.linux.dev>; Tue, 11 Oct 2022 12:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MHcyhXBS8LO+1pTGUBy6875y1oBGWuaCiIaP8C/oCic=;
        b=LaTXMmM76cYuz6MbiBv81nh/oLam6SjjvVL0PCGEwxnNOACwAsqvz7AAospOvs2t3e
         6kcMT3jOcY1KeSdYSMhkssSjkgv/Das6SAxpA9BU6aVpl1Ys14xxqw5EZs7I5J4IWkUg
         pEp7TwOJBtoJpaFXOR4yG4UWKIiHQSoTzS3dRFxYVjOr5+kq2ZTlmzzmpWF6sOlpbpyy
         K18DDWq1OIH9+PRQFud0sg1FKK+nwStGtVUPSf/Ia8Oqslv9HtuHU3+7kgVNlDfkhCXe
         /8XfAx6Sl4DZ1V+v5YhXRGQP2tfacXM91tdqY6xFYLy5MkYwRAc1HsIGHMjvnhShDw1L
         oG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MHcyhXBS8LO+1pTGUBy6875y1oBGWuaCiIaP8C/oCic=;
        b=7tEg8wHgKbLLJSU0vp96GqF44+fPaZhbmnu5vjZSmmaUtB47YQnRHPgBU7b7GgpI7E
         trapYCnzGK6MSWlfQHgQZ4U5q81WJV6cyNkgJKhd4xn2a/zSQtQ5zsmByMvBjfbSdwrX
         qho+vInYYO7gSYyndbMrO3ljzNIpYFdsCMRfCnnElxB72CTUGoYHivtBscjZl8SA/v6l
         OQuckj5wTLw9S03b+RU6GwXAUVRrrsLJexYFrChgYGzoHJu2iRoazhkb48yM+157f4wI
         hnSRaEpgIBKzcfAzyC9v6hgeJzaGBcRGL1td1AfznnLl2D8fOQaUdT2PuABDsusVyDJR
         7/3Q==
X-Gm-Message-State: ACrzQf194QWlAk82OKyYkS9jMlgKndgV+ELWxwaAK9GepSL4egYL9AC1
	twbGfiMKk6ARV40wjKl1pF4=
X-Google-Smtp-Source: AMsMyM7J/Datky3CcDpyErFNVWXXewoU1ysci2hdUpQTsxkNV1fXPV+wNo3d7NidfpcugfFX1nz6OA==
X-Received: by 2002:a05:6402:358e:b0:45c:aa8b:f7e9 with SMTP id y14-20020a056402358e00b0045caa8bf7e9mr6767edc.33.1665517475883;
        Tue, 11 Oct 2022 12:44:35 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f3e:6a25:da79:77b5:fd5d:5e3f? (p200300c78f3e6a25da7977b5fd5d5e3f.dip0.t-ipconnect.de. [2003:c7:8f3e:6a25:da79:77b5:fd5d:5e3f])
        by smtp.gmail.com with ESMTPSA id e15-20020a50fb8f000000b00459f4974128sm9808966edq.50.2022.10.11.12.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 12:44:35 -0700 (PDT)
Message-ID: <633927a0-c763-ae41-e023-1e797d95f1d9@gmail.com>
Date: Tue, 11 Oct 2022 21:44:34 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: rtl8192e: Remove single statement braces
Content-Language: en-US
To: Dragan Cvetic <dragan.m.cvetic@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221010190252.12402-1-dragan.m.cvetic@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221010190252.12402-1-dragan.m.cvetic@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/22 21:02, Dragan Cvetic wrote:
> Remove braces around single line statement, to resolve checkpatch.pl
> warnings "braces {} are not necessary for single statement blocks"
> 
> Signed-off-by: Dragan Cvetic <dragan.m.cvetic@gmail.com>
> ---
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
> index 702551056227..d7bfaf68291c 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
> @@ -267,10 +267,8 @@ static void _rtl92e_dm_check_ac_dc_power(struct net_device *dev)
>   			"PATH=/usr/bin:/bin",
>   			 NULL};
>   
> -	if (priv->ResetProgress == RESET_TYPE_SILENT) {
> +	if (priv->ResetProgress == RESET_TYPE_SILENT)
>   		return;
> -	}
> -
>   	if (priv->rtllib->state != RTLLIB_LINKED)
>   		return;
>   	call_usermodehelper(ac_dc_script, argv, envp, UMH_WAIT_PROC);
> @@ -330,9 +328,8 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
>   	bool bshort_gi_enabled = false;
>   	static u8 ping_rssi_state;
>   
> -	if (!priv->up) {
> +	if (!priv->up)
>   		return;
> -	}
>   
>   	if (pra->rate_adaptive_disabled)
>   		return;
> @@ -777,9 +774,8 @@ static void _rtl92e_dm_tx_power_tracking_cb_thermal(struct net_device *dev)
>   		tmpRegA = rtl92e_get_bb_reg(dev, rOFDM0_XATxIQImbalance,
>   					    bMaskDWord);
>   		for (i = 0; i < OFDM_Table_Length; i++) {
> -			if (tmpRegA == OFDMSwingTable[i]) {
> +			if (tmpRegA == OFDMSwingTable[i])
>   				priv->OFDM_index[0] = i;
> -			}
>   		}
>   
>   		TempCCk = rtl92e_get_bb_reg(dev, rCCK0_TxFilter1, bMaskByte2);
> @@ -1066,9 +1062,8 @@ void rtl92e_dm_restore_state(struct net_device *dev)
>   	u32	reg_ratr = priv->rate_adaptive.last_ratr;
>   	u32 ratr_value;
>   
> -	if (!priv->up) {
> +	if (!priv->up)
>   		return;
> -	}
>   
>   	if (priv->rate_adaptive.rate_adaptive_disabled)
>   		return;

This patch interferes with:
[PATCH v3] staging: rtl8192e: remove unnecessary braces for single 
statement blocks
from: me@lirui.org

Bye Philipp

