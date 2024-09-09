Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7A117A924
	for <linux-staging@lists.linux.dev>; Mon,  9 Sep 2024 17:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725903415; cv=none; b=FQfY++9ZyhB5Kq+3P8uDBnaGVZJUBq5gz3wRw76ZK7XETDWIrZTFTUaUQ/TzycKPW3eibExzCiHatuAFP8Wj02jqxklJppwQjfJogUZDLnomam5xbBuKVeIi1C09b8rrd1OhP8e7rN7gp20JaLNc7nkxqfT4pCS5uZ3FtF5BuQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725903415; c=relaxed/simple;
	bh=MTxKqsw5IqC4HqkVbXDcQ1y6sW/Td5RdD7+PeHVBnWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nouDcnwCXQ3xX8isL0nLtyvKpXIm7lQEnu3F4vOWSrJ1IsJW9KzR2oGMTVjgZHImLpjjGFyKBDMDfpb5Yp0U+3Dvr+qkUhEex/A9I1qy6YqFa4rzbrBgO9gU/UbfYG8S1EBxumePJmZ0krKPVMEi3srSGQyqz9IdruTOmjLtxSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdyzoLPG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdyzoLPG"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42c7b5b2d01so54491675e9.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 10:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725903412; x=1726508212; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=edu62SKFx/YpyglOioE6A1hLunOx30kHckG0mJ2Eplk=;
        b=AdyzoLPGsBF/1IbC9VQU//0nEdVU1Sq0q5IMpnx/0j2mmVovvHimiRQph/n0g0EFzT
         vFsBaG3I+9sX57LDJPsB816fqrLyyVxhMcTRYWHvEAaltYlY1d5clCrFoC0D3vYznHUv
         9XFLyoAje0340n0wbw/t+QydkFoEabcKw42l/WJ07YrF1EGRxbN1xB7Sm15x/LZ798PR
         x9ArKdksuF/aNBinjd7ewTnnGvaA+MyuAIvGcPlUIYcNdgx2r/O//27MuLmNsNQi59ga
         J5uoCOXasd7V3uSJF9nUTSMFOVdEcY+UqYOcn67kWb4XtWsIcLjlCIrg7Vj1Gatn1Z7L
         J26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725903412; x=1726508212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=edu62SKFx/YpyglOioE6A1hLunOx30kHckG0mJ2Eplk=;
        b=AjvdGOgWWkFNSbq7UnTG7i0kxU1oN7tO8AzxnWc7fYlgLXuyGHv9mEKglAcOTS4s2X
         oB0Mm6GGblICfQr0d4I2JzJ4d1RV3mAaWt+b1qXWzOyQey0HSe6nToZ+QhzmjaOYhgD7
         DCfg9fAoNR2ksjbM2UXcvAoJS5PPAUPSsI7Oniul4S65w7KY8mTZiDppXll5f7/hoIg0
         HsDpDwZBXQsScQQE8QrGU2vx6Liho/4Fin2SqjCH62DJPPbn4Y7NRleZ3fgWwKJUv4st
         kr5EzLsbOEenNqQGaf1dv6NxrK+7wkNWK4RCa2q3Ape9laCKvA/y8ihNVKEWyOW2OjjV
         y6LA==
X-Gm-Message-State: AOJu0YxAKOAQSLE7XJKBqHy7C1PdnmUr/b6K7gVTsrvAVrawXz2f3DGY
	ozttzFajzu8OAeGIywGOgJIatc7oh4cGR59jgzvmjC4JDPvFzZF1
X-Google-Smtp-Source: AGHT+IGrv5H+Lpsi965fERLzo//PdNn+OI+QnPSNR7zzAfkc9COJPnDwsUHRN5xXW1Kiu0i+PmDaJQ==
X-Received: by 2002:a5d:5547:0:b0:374:c8eb:9b18 with SMTP id ffacd0b85a97d-378922b690emr6684131f8f.24.1725903412165;
        Mon, 09 Sep 2024 10:36:52 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8598:2e4a:77ed:cf1f:2f2b? (p200300c78f2a85982e4a77edcf1f2f2b.dip0.t-ipconnect.de. [2003:c7:8f2a:8598:2e4a:77ed:cf1f:2f2b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25ceb1ffsm373610366b.146.2024.09.09.10.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 10:36:51 -0700 (PDT)
Message-ID: <0de6807e-c6d1-47c7-8f01-000800880c7f@gmail.com>
Date: Mon, 9 Sep 2024 19:36:51 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] staging: rtl8723bs: include: Fix spelling mistake
 in rtw_xmit.h
To: Roshan Khatri <topofeverest8848@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240909041352.2392-1-topofeverest8848@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240909041352.2392-1-topofeverest8848@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/24 06:13, Roshan Khatri wrote:
> This patch fixes spelling mistake to increase code readability
> and searching.
> 
> Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
> ---
> v2: Created patch series as suggested by Phillip
> v1: https://lore.kernel.org/all/20240906141024.10021-1-topofeverest8848@gmail.com/
> 
>   drivers/staging/rtl8723bs/include/rtw_xmit.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
> index a3b4310caddf..544468f57692 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
> @@ -15,7 +15,7 @@
>   
>   #define XMITBUF_ALIGN_SZ 512
>   
> -/*  xmit extension buff defination */
> +/*  xmit extension buff definition */
>   #define MAX_XMIT_EXTBUF_SZ	(1536)
>   #define NR_XMIT_EXTBUFF	(32)
>   


Hi Roshan,

something is wrong with your patch series.

When you look here you will see it is not a real series:
https://lore.kernel.org/linux-staging/

The command I use looks like this:
git format-patch -o ~/Documents/kernel/patches/ --cover-letter -n 
--thread=shallow --to="Greg Kroah-Hartman 
<gregkh@linuxfoundation.org>,linux-staging@lists.linux.dev,linux-kernel@vger.kernel.org" 
74d21cf6062fc65c61ca2c91b81a3a98a646a4f2^..HEAD

Hope this helps...

No need to call may name in the change history.

Thanks for your support.

Bye Philipp
