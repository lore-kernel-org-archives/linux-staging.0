Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931143009C1
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 17:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769707593; cv=none; b=HXIYKLp/SGQ+8GaBP0sC+RLO9YRVP2hzGj2RhccCsJTWjpeZNoKG+tUOQkqA4wvs49ipCjMziqmCT7pjqfpWlQ8Qv0PrTHeZlOfvn/1PCUl7jSXzdRSMW1m72kRoLenipBevTzGWGqpKV9WQ4xXqm2rF8MJd9k/srIpgeQ8ak8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769707593; c=relaxed/simple;
	bh=A59Yh5wWkb+mdrFpiJPtqdgLUKvDHOYYUzfjNPCwgJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XMu6Kp6Lo5yx3+wXKZFVAlMO4LWXLHLBUU+LcKzVT3fHymsI6H4f08hldTf23EEDf00daA/RPwioYb8kZiQsYLDLDXqN1xBiM9TwSMZsEGIT/zKW5Bj5ruJBkFWenJ/bQEYR+wrZtZPWv37pUBNtAr6W6r8AaptuAH4/MQ2TIaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GplMzzZX; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GplMzzZX"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee2715254so7393545e9.3
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 09:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769707591; x=1770312391; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5QIfQPTEVW6bvm63WQSInUs8OdHRDtfdNsdIRCSSUF8=;
        b=GplMzzZXV+yIGUch13RNRR/TqvpgICRru5z79X5ib/56XQeftvKrt4dPnbUd3NJpPy
         OfEUVzM7V9CCOUphhF6KRThW6Yfs/5yQULu3+Xw2XiGBq546y2WexED4kJlrr++p+udT
         jpTVflsCAAxqqVG4dtgp9nOKnsTmR7yoqr7LzuY1b0GvO+tyHgfRBdCNg3DJkS4ZkkvD
         bsvSVOPWLXqy0i+5QcptwC6ooYrQXCz0ms2VvYDBYwVhZGDfhSiAx/rbVb2Bj3U8DHuk
         o1XvKrD+k2Wybugae1SEB4qqV7g56SpuOwbP/1zxepGCEq8Dr6/EwPWtKMFPrXOsMQAv
         GpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769707591; x=1770312391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5QIfQPTEVW6bvm63WQSInUs8OdHRDtfdNsdIRCSSUF8=;
        b=HZ4PDzLhRz+qzCJ4Kwe+jV5LBvdRMvttZbTl/NggmBTS7e4pFuJdvxdM4alHskW8la
         Valfs4Kha/n/RswF6AdtUp8aqRVjTo3WWH98jIvhLpRFDClb4sPuTHsq8jNVRG2M4AGj
         4cs+v/YFIyXjaTyWx1oGg0wBRkqG43YM+IOcBrGcUCubhY3nuxhhfCZaqvEzxv8mIekW
         MKQH9en6zd3ciRUAzdk9i8oh0ZvDgiiF+8h90gw4t53ygTezPxhchzTZC3D4OylOP6RA
         0v6eZN3rynTm4PuN/umEX6/pldw8pVsHYA+o8zd/jLUSzH92u09BFwpzs1v3kk+PpgLg
         PLpw==
X-Forwarded-Encrypted: i=1; AJvYcCWqcIF7MR0j0879QHobhTwzmgyYoACty8vIFqpzQtyMFUTVsim8LeKsnQe4tuUDxHK1y/7us7SHHGEI69Kc@lists.linux.dev
X-Gm-Message-State: AOJu0YyWHzdHWsI3sufTvIh5JBManG3xFRDfbTSWAjpoyreNXOKGpu/S
	MnbXPxtxAuPs1j3y7VA0wCsKwhdd3xSA+Xc/oc3DzcqolkeW1T2l4pC5
X-Gm-Gg: AZuq6aJNrOCSALlg7rosIPi8lFUnQTy8BTOhUeHZcvWOS3H8h7DzO5hUM8vovcExaif
	iojmBClN/3gh4rfYBRG0yvHTKnA9Vnek+l2Pu7ybQgS9o3QCq2jrk8pvplDWMQOBw6CpypCxh7a
	5j3wyp6rxTpOpKCR+BsRCvNLFngudsmtl3yLWYKYaFvVHf4+/5RHy3rNeRE3AeKPcpT+3qfruoc
	of2nfTI4UISOfSfq/PCKYWo1OBPE2T+1v/wyb3/JkR33dOVG67XQoyfvInEliQ55MxyoA/sEk4O
	AzIUsDN0py/jKRg5Nog0XepZ/SQe9/lG9pnnMBgj/QB32LURCC0tVEYRUPuI2B/IvoVHzw9svsG
	PukiwNX76tPnAaBRFBN+lyhrWfErVWMa8LGXTaeFXw4Os33rdh42bX6YFy2VDoIOAA+L07LS6qP
	Sa38gjIYZRL3MrfYrhpaA=
X-Received: by 2002:a05:600c:4592:b0:480:20f1:7aa6 with SMTP id 5b1f17b1804b1-48069c5b95bmr115125895e9.21.1769707590565;
        Thu, 29 Jan 2026 09:26:30 -0800 (PST)
Received: from [192.168.1.2] ([31.176.185.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c37420sm222749765e9.9.2026.01.29.09.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 09:26:30 -0800 (PST)
Message-ID: <541a60a1-2373-4624-9320-c9b904a7af10@gmail.com>
Date: Thu, 29 Jan 2026 18:26:27 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: rtl8723bs: replace magic -2 error codes with
 proper errno
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260125221219.26151-1-omer.e.idrissi@gmail.com>
 <20260128172143.23472-1-omer.e.idrissi@gmail.com>
 <aXsL4a5RvlIqTpht@stanley.mountain>
Content-Language: en-US
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
In-Reply-To: <aXsL4a5RvlIqTpht@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for the explanation. I'll drop this change and revisit it once 
i'm more familiar with the driver

On 1/29/26 8:27 AM, Dan Carpenter wrote:
> On Wed, Jan 28, 2026 at 06:21:43PM +0100, Omer El Idrissi wrote:
>> Changes since v1:
>> - Removed leftover comment accidentally left in previous version
>> - No functional changes
>>
>> Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
> No commit message.
>
> https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
>
> Why is do you change -2 to both -EBUSY and -ENOBUFS?  In the original
> code, the -1 and -2 return meant something custom and they weren't
> kernel error codes:
>
>   * Return:
>   *0     Success
>   *-1    Hardware resource(TX FIFO) not ready
>   *-2    Software resource(xmitbuf) not ready
>
> Now the documentation makes no sense.
>
> regards,
> dan carpenter
>
