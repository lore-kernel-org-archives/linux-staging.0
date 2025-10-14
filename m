Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DD52FF650
	for <linux-staging@lists.linux.dev>; Tue, 14 Oct 2025 16:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760458255; cv=none; b=eqxnA6TsvQtIhLTmXTeFhxx/b8rID+m0vcZlgGXkmYCaFO1djp70CBUkKLrr3rSKWhLcdaT/fEWW7f8q8bOVifpNSrXZ6AX2Qu4uY2a72sE6r8D5nA2oBy9kVbiK2do5b+ZMU5eP48T7wInqGEJMWnDdd8f+xMFBX6BDjtJVNV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760458255; c=relaxed/simple;
	bh=FC1tGldIWqIuwYsh1AOthSR+/JmLgo0S1WqcTC3OZCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mDGj/QXFLK7nJTTRrSpyBFV1kkhBiKDi03LIrq5onhgyM8peLQh2C6kwo/GZNuiXWIv2+gq1Xl2O+CSMs3Kf1oIHidN7vko6apsxdClchQOzWrynlvPAvAfUqE5QVQPjp6XKVArNJfptpBl74y20+uzIT4d4ObKBXvw+clUz8Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDpRb3P6; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDpRb3P6"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-7900f7f4ba9so64799056d6.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Oct 2025 09:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760458253; x=1761063053; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S8L+WVjJmU7vcda4ih0gYjaBbqLiyaIpQ6dQl10BBY8=;
        b=jDpRb3P6OSXUs7sy7VMS/HMznT6ESSLX4fuiGogzaXjmH1+LZNxg2FvuZPXsUWID2T
         ulpa7VdHrVwxHEIuBrgpPRkToF4G12P9BXs/fwOiYdrF6mTDMNnAmNUiKeqlDbpUf3tB
         mhSw2XTiZDRgE/I+qbOQxG8IA77cOMP5I1q/HYbYTQoxIOCVfx5x3yzIkxX1SHPsh96x
         2tq+G3mZO4mvDU0jC9vXR6r/n8cwrzsisuITD0MBtMreuflqc/H0BFJr5l5NaywZ3Odr
         0gx4I0WIGNcckeGaL9/YX3FKNiqgRj3AlNMuNnpI8DaqFCGSkbJHT9hM5jk7cbwhCvQ3
         D0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760458253; x=1761063053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S8L+WVjJmU7vcda4ih0gYjaBbqLiyaIpQ6dQl10BBY8=;
        b=i7bYB57i2vwQ6y+2MQ/QVVPGda/Ii++CZKlJw8NTEmAeyH7tq4/3UVsimgb8iFnge3
         xTAbAiHzMWvyvVGKMhrJxA2TpTwmiyO/eLePfvoWIPcWkk6g5qeQI+jYWovlBYWUdz1l
         b+p/P4MglqDCaO3xtuNs/ck+KxMRnmS8ZTGWAHQIFAg+TdOBDPlF/WY+OjtvycQBnTPa
         9u9of7tzIjz2xSEsfRDIVgjuT8ZaHJZ+ijduga/NtFfxXkrKbcMFp2yjnSwNAd89HDwA
         qxOo/aN6WslaS2SfTVCO6VDniAe8X47r8L7vRu1nIRF0eqNQxIqonKZvkGwgrAX/9qRP
         ct+g==
X-Forwarded-Encrypted: i=1; AJvYcCWjEUiazK1sEazjDoyP/8xWYmlNyjoQ4e+NLDD2pxe0uADRO+vWavZkqOFeh17A8GhbC7AXmXJ0/aOyAeIg@lists.linux.dev
X-Gm-Message-State: AOJu0YyAIkrA2K3bC3dF08xLQ9ud+U3ypkdABpTD6v7CJETDAyOOWrRV
	msaiVMdQgk/GfxaXL3vjN0NIM6wlW99oOIItwI+/fHPtkk52hBkW+Ylr
X-Gm-Gg: ASbGnctKRI4r3I6eJuCOG0rmsg5GU7NrPg7MPyMgeYjRU98NiC8E/yT+eCsKnMEb3n3
	2egXtQFAY257PJPoFFmu6r0FNBYP9FbLd5BL14GGjzlFp9JWNjqbOTspf0DM67f0Tqe+asuneei
	KMuTutb6qeG5AKBSQtkqKtL4slzWeHEBZLhoCRBa2funzrnbEESEwDn9t24bm/gYcpoh0Di5ClB
	jAgPG9GxWIT//fz61mE0CkfBsoUygG9QEihb1l596H3mV9ijN6FNtFpfIat1QXjkB3LFmWHs0AQ
	rXEoCPNLWILEGO+j6D9HhM6OrqBLSyLqSUdOe57rUqPEzYocWCKKoHmEWovPgl5vHJiwu3+wV/L
	zrPMSuc2UqVzQbY4DnEtJG9mM+F0sPHUz+EnQgg0U4E6PUo9+K15UUnuwwlzntMgldGBt1vVWBx
	zT7ZE=
X-Google-Smtp-Source: AGHT+IHtDY1Ni/QmFM8KopkPD41XTdnvxrgCYwk7vBIPYhmYq+8n63/p3HVS1oDtlfr+Wq6clStmOA==
X-Received: by 2002:a05:6214:3018:b0:80a:7bd3:e61f with SMTP id 6a1803df08f44-87b2ef4f94fmr327305236d6.52.1760458252524;
        Tue, 14 Oct 2025 09:10:52 -0700 (PDT)
Received: from [192.168.0.155] ([170.10.253.128])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012b5ea1sm1227396d6.61.2025.10.14.09.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 09:10:52 -0700 (PDT)
Message-ID: <8f550b4e-2b7e-4266-be92-bb724265949f@gmail.com>
Date: Tue, 14 Oct 2025 12:10:50 -0400
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: documentation: replace strncpy() with
 strscpy_pad()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, johan@kernel.org, elder@kernel.org,
 schopin@ubuntu.com, me@abhy.me, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251014134148.2597178-1-vivek.balachandhar@gmail.com>
 <aO5VvrKTswmfO-n9@stanley.mountain>
 <8918310c-d0aa-4e02-b9d4-9aac98b0a48f@gmail.com>
 <aO5a9izAISpCDJrc@stanley.mountain>
Content-Language: en-CA
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
In-Reply-To: <aO5a9izAISpCDJrc@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Dan,

Thanks again—confirmed the structs are zero-initialized before the copy.

Would a minimal fix that guarantees NUL-termination be acceptable, e.g.:

strncpy((char *)&intf_load.firmware_tag, firmware_tag,
         GB_FIRMWARE_U_TAG_MAX_SIZE - 1);
((char *)&intf_load.firmware_tag)[GB_FIRMWARE_U_TAG_MAX_SIZE - 1] = '\0';

I can respin as v2 with the same change applied to the other two 
firmware_tag
fields.

Best regards,
Vivek

On 2025-10-14 10:15 a.m., Dan Carpenter wrote:
> On Tue, Oct 14, 2025 at 10:01:28AM -0400, Vivek BalachandharTN wrote:
>> Yes, Dan. Nice catch. Building it with below sample change:
>>
>> memset(&intf_load.firmware_tag, 0, GB_FIRMWARE_U_TAG_MAX_SIZE);
>> strncpy((char *)&intf_load.firmware_tag, firmware_tag,
>>          GB_FIRMWARE_U_TAG_MAX_SIZE - 1);
> There isn't a need to doing the memset()...
>
> regards,
> dan carpenter
>
