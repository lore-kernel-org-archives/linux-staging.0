Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F9319F137
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 12:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770640368; cv=none; b=QGF6Ja3bViKm1MkwZUiubI91GxkzPEMHsKpGrskVMgnrfFTPXGnYsvtcwFL5gJmsgrwIwvbQMZvS8dZY02JPMZDJiDKcZB/A2/1FklToPZZYrqy6eZgNyefZwAQRjmULcsk4EoSnFWFavk0XSVLLEcx8/9XOs8avrEoMsOx9IZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770640368; c=relaxed/simple;
	bh=9UGfwTK4y1fO2Dxay5nCxgZmQpRbsjMPeMLLw5M6ijM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o+0+WreQSVSueXTPlXGeI+xK1hJqa5tE+zEfYfkz2+R8uviZaEdGxqu5RGG3wxClPWyoJw37hweuz3c5qFWomAu9e3rcVsnvwhdlh4TZjg5ETN89/qYNNFtDHmBBS20nWUrtoh/fe96Pfzm8/1i7LTBZO9EmXdqDBopv9AMgfGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVeuDtq/; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVeuDtq/"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-436e87589e8so1155232f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 04:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770640366; x=1771245166; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jd+15egrLJWlYZ9cb8Lr+KvIvhkInyayF1h1fbgSSCY=;
        b=hVeuDtq/kns48bITkhwOrF4SLuoe7WAT5s8/MEVzi6kL2HKxOrKQjeTxrgpt5roDIW
         lezITmtp7WA9GulkzN3o0YCN0wF59o3/JpzyENCyqjuOSHRmhMfCKZen9SNdzlFxWQkb
         I8aPa564Bf25Uxz+QoRnhpHImxuGuO82h700dHRA9tzVp6SZASLpdOGa4O7gT6CPZEh4
         hKUp1tQE7wK6k2Il5+rzPcUJprGYtSN8ZBHhS3Hb2La/BFYi5QwmprNjlK2KUyp37lvg
         mbsDtvq3muun/HpCOnxsWnlxaQXAQwHxUUCltlvQN7rxIqdQyhTQRhE8PHAReERcPMZX
         vXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770640366; x=1771245166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jd+15egrLJWlYZ9cb8Lr+KvIvhkInyayF1h1fbgSSCY=;
        b=RVzzWATEp9F+rEtcd7AsBXFic2BESN2EiIyRphkpyD2oE5UUlqBrNiGgnry7nwjOqX
         yTFnQYYxhatpb9L/uYIpS7wgTIlooP5ZBIMYAGOXnYmFKO2GQdUi44krAef9TGkkouKY
         ZLLytsfhJIN+3m5jsOexWpHWISWQaiuEFD5tlHV5L2y55QlwSHAVaFLcJeIvM9kKcOL6
         YHBs6VMnQUQHHJ32IubRv6BcqBH2qEYO8CEeCdbhI8A94XI234n/FoKUDw8j6EfyYkCH
         kdaHN8LI7fObfvsovmdI6pMFJzrWqHpTOzs7ziPD/UmeyROOjplxAR2hcE9r46kFT5w1
         La9A==
X-Forwarded-Encrypted: i=1; AJvYcCVTmpI99d4fhvxZj/j6VwHxhpuiCwhjXf2noNKnEXOQ/oHstvSm7Yjmiy+zAC7WEo0AMCbAFLv40dBj9S3B@lists.linux.dev
X-Gm-Message-State: AOJu0YzpjDxjSbuepLquoBkEC0cj/JboRJk9ctdu+L+klLmYODF29E6X
	ehyLupWC/drrMDdIvJ50/UAQWtjIlw6DSnmzmeznrTfiaTHhjkctIjf4
X-Gm-Gg: AZuq6aL0kg5UEw7+EWo6g8N3S1FsR5BXM6B96UE/C3WxxxHREHcfP4EBkIPHuMgvDff
	nH6XqF0tUeYO2HJPjnXdWC0A4edsnfcY+ZP9ZsaTm1qSHtuGeWSu4J173ERCMB70s+tiL2qTDrv
	kMZU1kkHSmks6dTpU9SbwSBKl6aGuW9slfdrYN0LzIHa3lX4+b7jhqPW+LXC5BCH+z00H0ukV4z
	t3onf0cN/L3FylW6IpxWS9dGr2OmRwGb1kAH8a5Wp1k2X4N/cl0TfKMW8tVzagUzUMzg2qCftFL
	wKs4BIxYTnHfx8K1Wftd0+JULK7BpHhFxujsoxg++37Sy/MndEE6Lvvtql5pwOzbqcrmHZtNJim
	/htYdP2N9nwKw/5DNy0+EgZQZNTn0OfSeq0bnMiHEhT1nYK3mZ6sQH4JVUd6cAhinmdwFrVGOQU
	DQGExuIhApDCXPoE5crP5LVQvCBZDMzKJisXg=
X-Received: by 2002:a5d:588b:0:b0:435:abbb:fa77 with SMTP id ffacd0b85a97d-43629341e02mr17567690f8f.20.1770640366299;
        Mon, 09 Feb 2026 04:32:46 -0800 (PST)
Received: from [192.168.0.7] ([86.124.200.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376d3a32basm9541684f8f.14.2026.02.09.04.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 04:32:46 -0800 (PST)
Message-ID: <5c97b29f-c26d-4209-a74d-763d813576ef@gmail.com>
Date: Mon, 9 Feb 2026 14:32:45 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] staging: axis-fifo: use u32 for fifo depth flags
To: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>,
 gregkh@linuxfoundation.org, dan.carpenter@linaro.org
Cc: gshahrouzi@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260209113229.7871-1-gustavopiazdasilva2102@gmail.com>
 <20260209113229.7871-2-gustavopiazdasilva2102@gmail.com>
Content-Language: en-US
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
In-Reply-To: <20260209113229.7871-2-gustavopiazdasilva2102@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Gustavo,

On 2/9/26 1:32 PM, Gustavo Piaz da Silva wrote:
> Update has_rx_fifo and has_tx_fifo types from int to u32 in struct
> axis_fifo.
> 
> The of_property_read_u32() function expects a pointer to u32. Although
> the current code works correctly with int, using u32 aligns the data
> structure with the Device Tree API and prevents potential
> type-mismatch issues.
> 
> Signed-off-by: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 509d620d6ce7..7bc7bf191250 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -121,8 +121,8 @@ struct axis_fifo {
>  
>  	unsigned int rx_fifo_depth; /* max words in the receive fifo */
>  	unsigned int tx_fifo_depth; /* max words in the transmit fifo */
> -	int has_rx_fifo; /* whether the IP has the rx fifo enabled */
> -	int has_tx_fifo; /* whether the IP has the tx fifo enabled */
> +	u32 has_rx_fifo; /* whether the IP has the rx fifo enabled */
> +	u32 has_tx_fifo; /* whether the IP has the tx fifo enabled */
>  

I think you are working with an older tree, these comments were removed
in commit:
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/?h=staging-next&id=02b2a366a64f22cc367911d479297772d6269200

Could you please rebase the patches on top of the staging-next branch?
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/log/?h=staging-next

Thanks,
Ovidiu

>  	wait_queue_head_t read_queue; /* wait queue for asynchronos read */
>  	struct mutex read_lock; /* lock for reading */

