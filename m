Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB273F8E2
	for <linux-staging@lists.linux.dev>; Mon,  4 Mar 2024 13:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709559008; cv=none; b=qhTbbzxNJ8V+oAGD1sK3Wq8rRsN7Q4WrT5ulwPshV2JNySwXTMmCDCrArkiXbEMY6XuQiVd6d55iYlaA69l0Orceo9SIEcz50g1gGKdcT6HD6nDrnVfaK3FVtcKSSK08yFfTuGOgT3EOMp4232H2ZPZSwSaHQXv2hl9IEFkoN+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709559008; c=relaxed/simple;
	bh=gqtpqLNc5VNKPRt4nq7SmRkkJCCZ5/sRGBe9XuewtZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TKpXNgQAy5rhiX+/1TQsR7iIh2OU9zDpq4dXh4j1y1b2dqgf3k1BjNV70jrsCVTsNvFRvVsBQ7Sf5HzeQbRGH7A6o/Xpp/SyDFJls4Bhe1QplyT1lqVhdpjt9DupsoeBHKacdeoAU1Z6oTZdPXcxTe/JwT/9jfjHfhavbgX9kZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=FgozaQfu; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="FgozaQfu"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7c843eb31f7so40482639f.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Mar 2024 05:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1709559005; x=1710163805; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L7SwXBaphoRUbVIp4iZ+2oYSdcUsTrLJSfY5VS/Whck=;
        b=FgozaQfuVCntVNH8jwLozfBlG2cyePbORN+RcmaWQr0LLeevZGpvo4yBZDNYOxnI2m
         tosm6R83OMpu/pSl3iLWXxes2hNgaFOoSnqXzv55612O7mqT0m1kLaQ87v5YTNw27AMl
         a3/6qHR4sVTx0N5NF86LIIBft5P3WK1deQsPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709559005; x=1710163805;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L7SwXBaphoRUbVIp4iZ+2oYSdcUsTrLJSfY5VS/Whck=;
        b=dq66SJpfLnfGIekYKpKGLAWiiIwolotRyXa0azaRnexeB103Jll8I0+ERIy2GAW2/y
         SJB/r0BYhbzT3nKPzJcvv9Q1Snelx7e0GwDUTEb6y1sAz3j349hWx2h/hIxGG5zAFVTD
         2zlDVZEUA42ylxEy2kqIMY3JS8kDGtO8GZJLGIRF+yD928Llxr0KkphLa23qTxO6yco1
         bZny+RDt33AK4MCqnLs8PWFixzQBAVEyHUaunhIxI8OOZc6EcBEruqrDiPAgpNDH+MVg
         bBmRaKqKrjtzz7J+1185yYkLKlklaiPMiLhSUHfO/VkXQTakIczGUc4xhpiOcU8g5VK3
         VNow==
X-Forwarded-Encrypted: i=1; AJvYcCVH6EUaBaepMlFsWt8wP2GrpJCSSmdZfHXV1OO8Zb8bt5t8aCJuovftD/ZkJe21JK2X1KnIPdxdu30nHhlnZxrjcFEjX64sZv9kY2LkVw==
X-Gm-Message-State: AOJu0YwTVvwbhxvVgLoiLiLUiSqM05GulkdXbFVY3hiMW8qSGoyVya64
	9YFEmrzMAnqVcXMyvDSkN1ASh1qGTpdAx5kxZ88N6vaY8qfGbj8yilabPVp/ow==
X-Google-Smtp-Source: AGHT+IHZPF+TKoIdFlXbZQRumkQ9OfKZzuKfCSc+Ixsdzf3z05qnw5Uj9WW5Md2UYTHTRGlwSbT0ZQ==
X-Received: by 2002:a05:6602:1ca:b0:7c8:4adf:cdf3 with SMTP id w10-20020a05660201ca00b007c84adfcdf3mr3814286iot.18.1709559005688;
        Mon, 04 Mar 2024 05:30:05 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id e21-20020a6b6915000000b007c7e0e8edc1sm1180657ioc.52.2024.03.04.05.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 05:30:04 -0800 (PST)
Message-ID: <69825821-5b2c-44b1-b921-f077eedb3a71@ieee.org>
Date: Mon, 4 Mar 2024 07:30:04 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [greybus-dev] [PATCH] greybus: Fix deref of NULL in
 __gb_lights_flash_brightness_set
Content-Language: en-US
To: Rui Miguel Silva <rmfrfs@gmail.com>,
 Mikhail Lobanov <m.lobanov@rosalinux.ru>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
 <07df4b96-70c2-41de-9d76-1deb80447a79@ieee.org> <m3o7bwlhgf.fsf@gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <m3o7bwlhgf.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/2/24 10:35 AM, Rui Miguel Silva wrote:
>> So anyway, I think this (and Dan's suggestion) should be
>> addressed, but your fix might not be correct.
>>
>> Rui, can you please shed some light on the situation?
> As we talked,  this email was sent at the same time as my replies to
> this thread and you think I addressed your concerns in that replies.
> If not, just go ahead and ask again.

Yes.

You said the intention was to return null if not found
(rather than "the passed-in value as default").  So that
bug should be fixed.  Dan says he'll re-send that.

Either way, even if it's practically impossible, the
get_channel_from_mode() *can* return NULL, therefore
__gb_lights_flash_brightness_set() should be fixed to
avoid dereferencing the return value in such a case.

					-Alex

