Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED927F7
	for <linux-staging@lists.linux.dev>; Sat, 17 Dec 2022 09:36:01 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id e13so6705589edj.7
        for <linux-staging@lists.linux.dev>; Sat, 17 Dec 2022 01:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OEPCT4FJ6pAWdhKShStAS/tGijfNEuYVpX12bBpatgQ=;
        b=pY/RV03V0hPP5Pc6uzfBFPHJF5Opsaj8c5CI349870eDQrgeO9up1Y4vajrbVtvPzw
         y+Cj5ndo5h9DR3sMmSjqSwEkUITb5GwKWlzFJzbpm00t4jjF7MKh9Y3kjMS5Rz4Sq4Da
         ybl5pK5wOV1ORIJN7V+AbLcaF4ND8hcgrfRCbEQmwMOeBiFJv4wjd0kA331fnLoea8kr
         kLCKehlWbb37BVAAiF0VgfsnVvrmTffXqsQkRsISv5+hGOMBdS5ZaKaZ+zo8F+oznDbd
         3CE85DH1WoRAnmP1NCDVVWbMVtxXxah710WXf3f5D1XMSuMdlzqPyKDHOgWFvuZ3refi
         XcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OEPCT4FJ6pAWdhKShStAS/tGijfNEuYVpX12bBpatgQ=;
        b=GFCPqdpmOQGqx/1cNfx5WxgiHXHpk4woI+k1dgpakGbXPNjvEnlXIWmwZdwOAkxwYg
         4DUz1w7Gmxtpm8/C1rOLuvlxD/OBEeV8EITWhgZXVu4sihbOTz1Ru1y6PypXBVDfTaEw
         1gYc2AZQIWsJPOTLcpY8kUq3q9d3I0kOTTUsKwNt0z4AhpnyoZtUojO+KF+9mNXe7Wuh
         LhEutSymXaq3PkyeXy6hySL9XDFD+8cQH2auQq7Y+AFZcSYi4/JwIkIvH4r0K0t6Ktjx
         MXdJ8kyLOyZoxl2BtF5Y/9BOVflWgQEdZVmHFX5DHhxjs+VPV87lRjGpcJS3WfeSaDY3
         zv5A==
X-Gm-Message-State: ANoB5pnLezj30iqHSZwyHuM7EWUv07VOrfcxOPgEkm1Coh7Pr0wigSWd
	/p9iOgHv8sE/85wi63+ilAM=
X-Google-Smtp-Source: AA0mqf5qnLChFrLKh4m4JvtCg1Pr2jVj/JbQ0OvS72KJ/OCiaYIaCeVXhBCa1ueeDQqbX2KC+J3KOg==
X-Received: by 2002:aa7:cdd6:0:b0:46d:6f14:aed with SMTP id h22-20020aa7cdd6000000b0046d6f140aedmr7559693edw.0.1671269759412;
        Sat, 17 Dec 2022 01:35:59 -0800 (PST)
Received: from [192.168.1.102] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id d30-20020a056402401e00b0046b25b93451sm1759478eda.85.2022.12.17.01.35.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 01:35:58 -0800 (PST)
Message-ID: <81feafc6-d070-e551-6f85-73073238b511@gmail.com>
Date: Sat, 17 Dec 2022 10:35:56 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] staging: r8188eu: Prefer kcalloc over kzalloc
To: Kang Minchul <tegongkang@gmail.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>
Cc: Pavel Skripkin <paskripkin@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221216223942.334221-1-tegongkang@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221216223942.334221-1-tegongkang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/22 23:39, Kang Minchul wrote:
> Fixed following checkpatch.pl warning:
>   * WARNING: Prefer kcalloc over kzalloc with multiply
> 
> Instead of specifying (number of bytes) * (size) as arugment
> in kzalloc, prefer kcalloc.
> 
> Signed-off-by: Kang Minchul <tegongkang@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_xmit.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
> index 34494f08c0cd..36ce1e3f9c81 100644
> --- a/drivers/staging/r8188eu/core/rtw_xmit.c
> +++ b/drivers/staging/r8188eu/core/rtw_xmit.c
> @@ -1564,7 +1564,7 @@ int rtw_alloc_hwxmits(struct adapter *padapter)
>   
>   	pxmitpriv->hwxmit_entry = HWXMIT_ENTRY;
>   
> -	pxmitpriv->hwxmits = kzalloc(sizeof(struct hw_xmit) * pxmitpriv->hwxmit_entry, GFP_KERNEL);
> +	pxmitpriv->hwxmits = kcalloc(pxmitpriv->hwxmit_entry, sizeof(struct hw_xmit), GFP_KERNEL);
>   	if (!pxmitpriv->hwxmits)
>   		return -ENOMEM;
>   

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
