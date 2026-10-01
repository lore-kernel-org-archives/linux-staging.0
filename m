Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8AE14883F
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 20:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790887454; cv=none; b=r4XVB3oOjIULbeDR/0MDRKXkFYRMkdHIobVfbONVNgx2N73HTAjVWd6eeb3XqE5fXzVfkpceNX1moCZPTXIrlE44q+RawUmEnaGsoDIzNl4z7XkjwBulw3YMfDxadSftq8yZXb4GMiFEhhP+9/GkzjoDMKKyiFGfPqnCOd6Ank8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790887454; c=relaxed/simple;
	bh=7VodwCwOLPapJRAeccbG9gnvKLac2aE+AGctWb2rf0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M2qdohlTWOCR9nZ1gz43Ubi7Qmucp+ZG8jT6+8VlEsXsGFCS1LolKK5CgF7mH6rs5d5farcerNgkXBIjdhb4QUvIcSY+Rz2w3vqjoo9d3FdI2vviv9SH0BPbAE0sKaL/OhOrdS3BHlUxVHZ5qB6AbjUeqKL0sjJAffzYyBQalVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=YVxgf8om; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="YVxgf8om"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46ac6e5d8f7so3372054fac.1
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 13:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1790887452; x=1791492252; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R8pPNZNUEJfVTYpFqmE11hp89qRxIiQ3XUfTUDe434A=;
        b=YVxgf8omQayT9trwFdYf8ExWv0U3tIe9GcPrwivG3n2SaLVan2f09NlD6GQqEsNoXq
         U/Vxkmdf2QSRGQXhazTDTxalSENXkNa4CX35l0+RmH3MqYVdzRp4WEAP1OO7/ZmMxMTZ
         lH0b4JYdFoMtfRURJJnKH3DudTST/L7+kp+Xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790887452; x=1791492252;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R8pPNZNUEJfVTYpFqmE11hp89qRxIiQ3XUfTUDe434A=;
        b=NtRr1/8tFjtpNnT9WNjnOp4iOZzNijcfmpLt8YLQo5F9fbaX5OOCrKcIGdGxsvVLr8
         lhq7hYF88q1K9onOfcoVtHr4JfNs7CkH72NuHFrn2JIdlxjxhmlDO5J1A0mA3y5hNSki
         4AtbhQIPZBwvNLVbnHdchmmvjb3oNUvrKIn3nhRFLyOgiH+bqwrwdUkHzGFTSytsYKDH
         GVde29QREbdiikmL7EpygtuNsmKBJeTEvCl52Wfok3j4M23x1fbf/0G8fEJ/ta2B+w96
         FUUi68heVLbVY6ielPDCap4bF4YI2t8Q+KTgNjsgPzeC3ZQukw9KPtgdePL4OqFTAo73
         ZmGw==
X-Forwarded-Encrypted: i=1; AKwUvBz3yzrgJ/DZMKqjx2T0tyMdt8QbwTLFpkE301+fxLpWDxHbTj1um5YFPVkHlB97A0dNTWZ8dF5gO0pztjsL@lists.linux.dev
X-Gm-Message-State: AFuF++m3otw6S4zp01HrHgidkKVsl77X9qXF1jbKfkpDGJ0gz7T5Ewlk
	BTBXnM5wV56FaB+amMyOFpFNC/V6h8VhX7ku+Lyw1XoW6zW0O13iuJrSjodUo1AK5Q==
X-Gm-Gg: AYBFou3U9dkHjr3e+zSpWdoCoC9Y1gxMhj9+W1h5D/yTYPFy/G1qRjps+MGGCEt2oza
	A2zCk7NOjUSfpvMOVm2s3A/TvLFJRxuT7no4y7TvD3Izslc23x+gCfmRD1/IKkjSxICW928k+9n
	4LiLlHYaBDn67Geqns3PmFjCJQveC4DQ515luU2CcTq9otpygtnYzAmcqjzELvu5OW+g1PR0VvG
	kUKv8Z1XbYRjjZb+hll4ZZFuNr/HlchHZjVApMzKMvQKQSseRZ8IgnJ7Onkdto057h3PhuBARa7
	ENyZ0uoeyBugDgiYMVhYF3cRNKElpGMxXlCL4yf8ZeV9cHE1YXA356hdWPGD5h+iXlUSpAevtUz
	rw4WFoySG8VXkRfgAFg0DN9SyDGh5GDz4jvFmKrP6EA2x7oBqJBrG8MhT0WuixSWjgm27bYxcXy
	nsjc9GvnWChikwnbQ+7+amF+kswFQBkD6k9JCc3jG2ZmqeN2Z7J6/xfwxSNBdCutSYVw==
X-Received: by 2002:a05:6808:67c2:b0:4d6:90f3:74b1 with SMTP id 5614622812f47-4f52ab8edb4mr278058b6e.49.1790887451759;
        Thu, 01 Oct 2026 13:44:11 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-4f52195af2bsm367492b6e.1.2026.10.01.13.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 13:44:10 -0700 (PDT)
Message-ID: <13a8af5c-5047-428a-9a69-07b98ccd65b5@ieee.org>
Date: Thu, 1 Oct 2026 15:44:09 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: greybus: remove driver depending on
 nonexistent config option
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>,
 Hisam Mehboob <hisamshar@gmail.com>,
 =?UTF-8?Q?Martin_Kepplinger-Novakovi=C4=87?= <martink@posteo.de>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 Agatha Isabelle Moreira <code@agatha.dev>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>
References: <20260915020308.83636-1-enelsonmoore@gmail.com>
 <2026100125-puppy-pacific-52c6@gregkh>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <2026100125-puppy-pacific-52c6@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/1/26 4:19 AM, Greg Kroah-Hartman wrote:
> On Mon, Sep 14, 2026 at 07:02:59PM -0700, Ethan Nelson-Moore wrote:
>> The Greybus Arche Platform driver depends on the config options
>> USB_HSIC_USB3613 or COMPILE_TEST. USB_HSIC_USB3613 has never existed in
>> mainline Linux, and COMPILE_TEST is intended to enable the compilation
>> of drivers on platforms that can't support them to improve code
>> coverage and ease testing of trivial or tree-wide changes. Therefore,
>> it is impossible for anyone to be using this driver with unmodified
>> mainline kernels. Remove it and move the former maintainer to the
>> CREDITS file.
>>
>> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
>> ---
>> Changes in v2: Clarify commit message - mention COMPILE_TEST
>>
>>   CREDITS                                  |   4 +
>>   MAINTAINERS                              |   7 -
>>   drivers/staging/greybus/Kconfig          |   9 -
>>   drivers/staging/greybus/Makefile         |   6 -
>>   drivers/staging/greybus/arche-apb-ctrl.c | 490 -----------------
>>   drivers/staging/greybus/arche-platform.c | 653 -----------------------
>>   drivers/staging/greybus/arche_platform.h |  28 -
>>   7 files changed, 4 insertions(+), 1193 deletions(-)
>>   delete mode 100644 drivers/staging/greybus/arche-apb-ctrl.c
>>   delete mode 100644 drivers/staging/greybus/arche-platform.c
>>   delete mode 100644 drivers/staging/greybus/arche_platform.h
> 
> Yeah, it's time to finally drop this.  If it's needed in the future, it
> can come back with a simple revert.

Sounds good.

Acked-by: Alex Elder <elder@riscstar.com>
> 
> thanks,
> 
> greg k-h

