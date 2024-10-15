Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4BE21E3D1
	for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 22:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729032466; cv=none; b=EhlFyJ1nS7AgOmqFEuxPC74CpQIsYu8VK5z4hiCQAaWMm8fdfNLuNLfzcuHE4KwCAffltS3y4UpgK0SsvspVHm85+BKXz/nE7TNoRZrObRTVNfXFEERhgoi/FTLjTCogy+QcF926NcdhHoOBloUyKGhAmeT8fKuJ5QedYHaFUW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729032466; c=relaxed/simple;
	bh=9/yMpBDQ4MgXG2JF/M1DyXAd4P4K7E/pFGhOwQo8lLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JdT2UfIXEIZsr4bS55OjLEPag9UqJRPoBYucOt5BnnQ4/fxoPGbAqDF+Xmxf7QigK4P2aNuj4VlVWZmq/sQ8iHyZwykXAJpuqejj0WG+CUa6eXWoXqL/Yd8UP3Uerqqg5QCN+0IjLDu7v3ZuOKLFRcYRWbwFEPMHLo5Jzp+NYxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ah7uMOqN; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ah7uMOqN"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-8354955f115so245214539f.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 15:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729032464; x=1729637264; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DI+wbwBHXGEyEuVIdZAIUUyrgbXUSc33fVGVN+YkPw4=;
        b=Ah7uMOqNCn1iqSq5qMO7EipYQpgDgSWZPeVMxEOSw0KJryRSN3trM4UqE01oJgrSeQ
         NJbvHSMYsFp0sSncbCgX/GKoyp2DFhGL1HMUt3pB6rLup5nFQNeWOYF1SY2Q4K38wrdo
         djZNB2p82OlPgvvwUshAF+uhsfhQzje3sWVX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729032464; x=1729637264;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DI+wbwBHXGEyEuVIdZAIUUyrgbXUSc33fVGVN+YkPw4=;
        b=m5RyffasF0sPzrR3soljsU9oeIwoAKLpQw4kYzIU3mhHTw8O9J6vpuiwBuVe1lx9hz
         LN0/+YT9/MZ48AI5pQl3CwOxrGpjvrr+bS2E8vRZ6AvmHW1EkFWzmhrBVIh7LQl0KX/9
         4m3N6X7+a4ZKzP+Qxd+iodG8B4mqYG8cQDPETsO08wU3HChD8TzaFT7BH/4aWHBVEy1S
         HOP1lDSBXKMV5C7QKihpa535DLE4sAnmGuBd8ruzsCAcealPZDSnRPtSF5tfPtTVf+EZ
         toFe1/eFUj9V2Y/+8waedmHt/KDaBBvd9nWHDMtPu7p+/DeXVyrLbuq1C9SU1munerlx
         G9lQ==
X-Gm-Message-State: AOJu0YzQ8m+0deFnA0X9ONeit8G5RA/IlJ0dyCc3Ai61S9lv1U94C4pu
	ku3DkNRP6fIilbCLBL1VqtFiVlhRsGu6aehWpZkmBqcf1cgpUyzsCDHdCM8hW3pY2bC7sV1ps+a
	L
X-Google-Smtp-Source: AGHT+IHJV0rzbHJHrUk9jakRVl53VDfEC+90zTQZ/dU8ydWTUn7uTDUdVw+xqFWw3ZDBaqvrD73k9A==
X-Received: by 2002:a05:6602:60c9:b0:837:6dae:207b with SMTP id ca18e2360f4ac-837956f9631mr1436289139f.16.1729032463609;
        Tue, 15 Oct 2024 15:47:43 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dbecb38deasm531415173.106.2024.10.15.15.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 15:47:43 -0700 (PDT)
Message-ID: <59521671-db23-42ba-8db3-ed48cef53c05@linuxfoundation.org>
Date: Tue, 15 Oct 2024 16:47:42 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: gpib: Remove a dead condition in if statement
To: "Everest K.C." <everestkc@everestkc.com.np>, dpenkler@gmail.com,
 gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241015200655.17444-1-everestkc@everestkc.com.np>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241015200655.17444-1-everestkc@everestkc.com.np>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/24 14:06, Everest K.C. wrote:
> The variable `residue` is an unsigned int, also the function
> `fluke_get_dma_residue` returns an unsigned int. The value of
> an unsigned int can only be 0 at minimum.
> The less-than-zero comparision can never be true.
> Fix it by removing the dead condition in the if statement.
> 
> This issue was reported by Coverity Scan.
> Report:
> CID 1600782: (#1 of 1): Macro compares unsigned to 0 (NO_EFFECT)
> unsigned_compare: This less-than-zero comparison of an unsigned value
> is never true. residue < 0U.
> 
> Fixes: 55936779f496 ("staging: gpib: Add Fluke cda based cards GPIB driver")
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> ---
>   drivers/staging/gpib/eastwood/fluke_gpib.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
> index f9f149db222d..51b4f9891a34 100644
> --- a/drivers/staging/gpib/eastwood/fluke_gpib.c
> +++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
> @@ -644,7 +644,7 @@ static int fluke_dma_read(gpib_board_t *board, uint8_t *buffer,
>   	 */
>   	usleep_range(10, 15);
>   	residue = fluke_get_dma_residue(e_priv->dma_channel, dma_cookie);
> -	if (WARN_ON_ONCE(residue > length || residue < 0))
> +	if (WARN_ON_ONCE(residue > length))

Are you sure this is the right fix? length is size_t
fluke_get_dma_residue() returns unsigned int - yes
the coverity report is correct, but should fluke_get_dma_residue()
return size_t?

>   		return -EFAULT;
>   	*bytes_read += length - residue;

bytes_read is also size_t

>   	dmaengine_terminate_all(e_priv->dma_channel);

The patch should indicate it is against next. [PATCH next].

thanks,
-- Shuah


