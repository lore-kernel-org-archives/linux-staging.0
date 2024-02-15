Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D561D12BF1E
	for <linux-staging@lists.linux.dev>; Thu, 15 Feb 2024 19:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708026803; cv=none; b=aLBJDgWr3uRnZCfEXGsZRaCWsZTgHGiFRy8LRnnFvQPyYfdFICcAnIcVNXEHYoxQnogKeXSXxnWLJB0k3j6YRdqsFmSC5M3TZ1wbd+xc4GQb3/DGQIPQDNvIFavyo/6WuFij23Ch3hV43FgetZkGrza4PZr9ruQjHoYt8anqXW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708026803; c=relaxed/simple;
	bh=bcaDsLqllFV09FolTRkyNclQnzrPYm9pxiVwZqFXlxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d7VNkld7C2bArrp/8xOVBjG/iOQgQK/mXlDf9+GMqfmQtna/kE2N/pDLPbn8bj2K++rG9XZMMXSuI3oLOT8jseEMeku+E8jwYLt2rPxPaOhRQsxI8kzSUkALL7NmK8jV3AXKNVegUtq+FD92VilV5kbw8GcrLYdSrSkTCpWtex8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TgCEemEk; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TgCEemEk"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a28cfca3c45so50013766b.1
        for <linux-staging@lists.linux.dev>; Thu, 15 Feb 2024 11:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708026800; x=1708631600; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HRrM47UslnlmuRTWOp2JJ1DzYUX+lqfl80GleBMNoms=;
        b=TgCEemEkdh6DsXlYzk/X/hhJg6Bn6usSQ+EV1XoWD/0a0AMdU/ePnl6f4Hb9ZRm6vj
         yLHUd5ft19cm3Z7GPTQPEnmpqksj6p9cPRc8ZC6Zoa40QYtM4MjSF0xUyDpQWHnH+Q/E
         y1dsMX+LaDTz8uAGcIJ/fr/+uPO+cibDWsI33MPkvWgX9qdwVEdvVCie/hxorUAHDiiI
         9lKwlHi+N0Ejp/0uiWglPSJoAaFB/VAnUfUFNCE1IkvlPDHeQcVA1DqPO8/wC8WP2idC
         Gv2dLCOgadlsX0FuBZrsGTj+cVU9zzyjOWXFHq9qMk4ia70Zm8rA69E2jB+aCtgFlqNu
         kdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708026800; x=1708631600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRrM47UslnlmuRTWOp2JJ1DzYUX+lqfl80GleBMNoms=;
        b=i9wX0Np8AQBTjfzdQX9OekZYOd2BAeFsbdatymjY1LBdaLs6DLLlVzwk3Vtv8dD663
         qypYsvADkbxcXFm+oS2S1j0T2OJR5AqfR6pnh9y+tre1LdeUDaULvWNz7PEtJ/faimze
         Bxrb6dpcFNcuvmwt4F6qZptg4x9XAKyNl1y23/VnGdP2xUW151Y63eJMdZMNJtwROMGK
         y3q/dIghlIbMmW7Op4UaeMcVBBr8ONAsmheS3gNTMapIyc5sMpfJUuHQh1Oreih4b4FK
         L+1JazvRm+GmoQQ4HWsIvruyxBb4FsZvTny38Nr2EJhdTOT6ulbr9k8RoK9gYn82ZT25
         x50g==
X-Gm-Message-State: AOJu0YztJ+D0nEXekZTKbybqNkhwQCHkW4TWdT4JMX2QokLlLH21Hj39
	pxpjNPo1GxrjxV5sAzcIptkxm5KG0XIKclzrshZ3DGIVufMi8Bfj
X-Google-Smtp-Source: AGHT+IFrbXXnFMFs4ZsfYJIQAS0fwvKvf4po1C9yMYTHgnBhTWAAiq2QJgYhY6SqNJwbC6uB6bsh8Q==
X-Received: by 2002:a17:907:a709:b0:a3b:b56a:e711 with SMTP id vw9-20020a170907a70900b00a3bb56ae711mr2513531ejc.4.1708026799964;
        Thu, 15 Feb 2024 11:53:19 -0800 (PST)
Received: from [192.168.44.127] ([185.238.219.72])
        by smtp.gmail.com with ESMTPSA id f23-20020a170906085700b00a3d70dc4337sm854509ejd.102.2024.02.15.11.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 11:53:19 -0800 (PST)
Message-ID: <f8f19cf1-6b83-4fee-92a0-b9934a0a6c64@gmail.com>
Date: Thu, 15 Feb 2024 20:53:12 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Staging: rtl8192e: rtl819x_HTProc: Removed braces from
 single statement block in ht_on_assoc_rsp
To: Aaron Parfitt <aaronparfitt123@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240215194045.37205-3-aaronparfitt123@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240215194045.37205-3-aaronparfitt123@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Aaron,

the changelog needs to be below the three minus "---".

Look for examples: https://lore.kernel.org/linux-staging/

Please omit the changelog line with my name... that is not relevant...

Is the length of the subject line within the expected range?

Thanks for your support.

Bye Philipp


On 15.02.24 20:40, Aaron Parfitt wrote:
> Remove braces from single statement blocks in the rtl8192e staging
> driver to clear checkpatch.pl warnings, improving code readability
> and adhering to coding style guidelines.
>
> Changelog since v1:
> - Updated the subject line to make it more unique and descriptive.
> - Refined the patch description for clarity and conciseness.
> - Incorporated feedback from Philipp to improve code style compliance.
>
> Signed-off-by: Aaron Parfitt <aaronparfitt123@gmail.com>
> ---
>   drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> index 6d0912f90198..49b882c363bf 100644
> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> @@ -480,9 +480,9 @@ void ht_on_assoc_rsp(struct rtllib_device *ieee)
>   	}
>   
>   	ht_info->current_mpdu_density = pPeerHTCap->MPDUDensity;
> -	if (ht_info->iot_action & HT_IOT_ACT_TX_USE_AMSDU_8K) {
> +	if (ht_info->iot_action & HT_IOT_ACT_TX_USE_AMSDU_8K)
>   		ht_info->current_ampdu_enable = false;
> -	}
> +
>   	ht_info->cur_rx_reorder_enable = 1;
>   
>   	if (pPeerHTCap->MCS[0] == 0)
