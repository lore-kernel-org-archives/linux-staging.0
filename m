Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E674B4437F
	for <linux-staging@lists.linux.dev>; Fri,  2 Aug 2024 05:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722577553; cv=none; b=fgsYvp7jIMY5/IpzEH2espyiGZt9WmHSvehQtMOO/Wu+R0A5Pqgan9DSN49GC5Kt3sM3sPWH/nW3idO/Sj6sPCAYFeE1Gd5io5ZSadvgcMLhtF1/E3R4ywltHeABEtV/0TD8bIyUNA5F7fSYkaNAqT67LBzguBgeG5BQndlXoZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722577553; c=relaxed/simple;
	bh=Q0yAB9fGL/5NiS6EFNSaISF6pHTBZkj0KtQmn+C7hc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D8bYQsslfHBKwGkWqNO8cv362R3s/3FBl8LRKnhRQMUqiLo2AgWtdpcsnlt0w8vHVfeuZHdi/ugFJeEvUU+MnBTHOxu/7nfl32fqKAWsN7SENLov3RsuTv8vpZxr1/ur2QZjv0iipK76/NAtEUhwu2KdjN+tm2pGV/elAzakBI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ez2KN/Ap; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ez2KN/Ap"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a688e726755so105209166b.1
        for <linux-staging@lists.linux.dev>; Thu, 01 Aug 2024 22:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722577549; x=1723182349; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RigXAXY8XojMY0eL40pCCW/KOV/0idGGpOe3OTx1b1k=;
        b=ez2KN/ApHadu+o1SaRsZrx3nMvntAGZ5Sg5+pHJm9/6fT14Sc1jC2nRZOEAmIdmQdA
         tARKGlxE1UV/Kl4o8ZZJxz8v3OBY+X6Ib+mUAJUJOKnrgZTem32LvW3xa0ClI4946Qgq
         N30P5d7nAF7mtiruwrJNVkFtySN7thcnbuLBYZcV7ygXl1qMFuM4QrZr20Cu3Nu7YCuN
         1EHvvJVNTI77TJlbAYhVDht5KnYRZ4lRYqrJUwIQzYk98cTshkMQa92Xxd1YOHqhrkyU
         G4H1IlxKlAZ/FKHIhcEBUEmlja6pLWzUjIwDHK4TOfEviP3sxS8Cy4ho3JVaCN/m+Iu6
         zlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722577549; x=1723182349;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RigXAXY8XojMY0eL40pCCW/KOV/0idGGpOe3OTx1b1k=;
        b=mo9rXC99R10JSQHzCbpqMJDYxRVoKv2i8Q3LkRBCM+NSZxixpPYpR5hLER6ZPh/JV0
         kSWgnDpTppTT+nOpZuiDegmJCaM+vu0jnC1TIrQjarkyfkOxODkNvnou10V0xUpnqVIJ
         5Xd+VrBfhtxNsWhh1q7Cy/QpzXwNu2F6Fq+AmctF/uqe4SYc3qVNO1/+Dc1OBWzXTNVc
         bFShoy2VWlrDr0VTxggkpMdvLYVtRKftwXNl/8FbAsceKscOvjp3xMI/DzjhC9djv21g
         a7ZXEJMkxIeqFLsSWfCQlqjQFU4qEMxh2vNmYkvzVOccJAJJk2J3CfuJYFkTKEiEpFBD
         2SVQ==
X-Gm-Message-State: AOJu0YzSrOa867aikkI5R1KVDPA+gBRMjPSh89HslsFA587cXo7/mwja
	+6amzKHdBDbk+N3S8Ho5iIUdKiH3DMqt1ClpYU1ybScvhmfajekH
X-Google-Smtp-Source: AGHT+IFgVJrNhR4s9Ifa9W84XRJ00zIdgSl9ZMABKuDHEC/LVng8I81ppLHgXW4oIaKDH20HoC3JCw==
X-Received: by 2002:a17:907:728d:b0:a77:c825:2d0f with SMTP id a640c23a62f3a-a7dc508d453mr118562266b.6.1722577548892;
        Thu, 01 Aug 2024 22:45:48 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8543:bb0e:65aa:14e1:2135? (p200300c78f2a8543bb0e65aa14e12135.dip0.t-ipconnect.de. [2003:c7:8f2a:8543:bb0e:65aa:14e1:2135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc9dabsm56084066b.39.2024.08.01.22.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 22:45:48 -0700 (PDT)
Message-ID: <e4308685-bfd1-4795-bcc4-d2a246dae0c1@gmail.com>
Date: Fri, 2 Aug 2024 07:45:47 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] staging: rtl8723bs: Delete unnecessary braces
 for single statement blocks
To: jiwonaid0@gmail.com, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240801155138.25531-1-jiwonaid0@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240801155138.25531-1-jiwonaid0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/1/24 17:51, jiwonaid0@gmail.com wrote:
> From: Jiwon Kim <jiwonaid0@gmail.com>
please omit the previous line as it is not required.

> 
> Deleted braces {} for single statement blocks.
> 
> Addressed scripts/checkpatch.pl warning.
> 
Please do not add extra empty lines in the description when not 
required. Consider that we have a lot of commits and it is most wanted 
that the description is short.
It is not required to add the name of the tool who found this, but it 
can be named. Much more important is a good description why this change 
makes sense...
For example:
... to shorten code.
... to improve readability.
Use present in the description. So Deleted should be Delete.

> Signed-off-by: Jiwon Kim <jiwonaid0@gmail.com>
> ---
>   drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> index 1eeabfffd6d2..e0736707a211 100644
> --- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> +++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> @@ -144,9 +144,8 @@ static int rtw_mlcst2unicst(struct adapter *padapter, struct sk_buff *skb)
>   		psta = list_entry(plist, struct sta_info, asoc_list);
>   
>   		stainfo_offset = rtw_stainfo_offset(pstapriv, psta);
> -		if (stainfo_offset_valid(stainfo_offset)) {
> +		if (stainfo_offset_valid(stainfo_offset))
>   			chk_alive_list[chk_alive_num++] = stainfo_offset;
> -		}
>   	}
>   	spin_unlock_bh(&pstapriv->asoc_list_lock);
>   

Hi Jiwon,

please consider the above comments.

Please make your "Subject" line more unique. Consider that we may end up 
with having dozen of commits like yours, all of them referring to 
different removals and all without the necessary information to tell 
what they differ in (except the driver/subsystem). So it would help if 
you add the changed file or function to make it more unique.

If you send in a second version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks for your support.

Bye Philipp
