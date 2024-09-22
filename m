Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FBF481C0
	for <linux-staging@lists.linux.dev>; Sun, 22 Sep 2024 19:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727031674; cv=none; b=t5ZNhumUQaX056O6hGzG+K+nYVWWyflxTA96GpZyYaHGhb0n0FS8SEtfBYWJ1+NSlksY9xeb2G7a2/gO77XEZM6R8NO76HswT00V/x32hK12z2P3wV8Jsfujfs7aImjxX0xFBzvrJjXMWD+HducXP8P2xuK4wuSM3OJjFpWeHhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727031674; c=relaxed/simple;
	bh=paPBfgSs6GuYPSc4Qzbu42wEtwC/+ZYFVB/5muVtDf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B3L4iBmxx/oHVbPJXTxnUBnQvS+WNXomY8AepCBYZWD0+RI6f6PG8vjWv3opgdho05MBsSWam8uFuNNa+yor3F3ZFUFvTl3mObmtK16xawWSW7QXA7vJ5TKeb834cLi+rcLf2g+3yhKmHVth5fG5mUVaJZ2at4Vto76g2O2BIYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJL4Kcsf; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJL4Kcsf"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-374c1120a32so2279062f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 22 Sep 2024 12:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727031671; x=1727636471; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YWL/elEPJZ3GI584WAVmwXjrAOEJIOMue+bKTI1OMG4=;
        b=HJL4KcsfmQmSVxYPxvwQNll3sQ+As0JmQDP6C8u0za3Ar+yZFxtB7w+4y7Miwvy9zU
         0cjPzaMgqWI0xKffwnTMEad/RrOGPK3znlMMc9+Evv4JzK4Zpjt2mSR10TDWWIUF/uCB
         bW3uLvrdlV7e9P/1ADaVvvranBK8a/MT5uJfM6vj/A9ErL1a/jPsrf5Tz5xMABJk1Qw4
         ApJp6ZKFoFZYFZwvKIPRs5o3E//qDdj0lKHm+j7xlMkHh6JOTRr11/cQdYo1f87EsQzD
         JAZm9z7tctH/O/ApUceL0/Y8Upi5pnDtZN99M9Ln5B9h4+hNYpOYUI4hTbGYYrgw2sUg
         NYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727031671; x=1727636471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YWL/elEPJZ3GI584WAVmwXjrAOEJIOMue+bKTI1OMG4=;
        b=ws5s2jppk8hsafsieH8ThXPZUtIz8ePSpmDWnUFlvl4+hplS3UsxCaTEbR1MC0sEjS
         JR3y1ULrzgPc1O1pLe633zNFcc2P9Z4GZg9g2N81He6Wj3rwUuOkjIZBR/AHZNwpojTZ
         va25TW/t8VgY3nSlaQDNgbRgcTnSoLIMtlkPVMwhovzaRWzw64QDTrE5Y74yd6uPSyuP
         Adx53rds1CBqVgK8qdGpuaMYZaI/ulZZXbKqzbKClGHa7VgAEAU3EYIvsP4o6WG6ENIZ
         idkTMTkFhWuMKMb+ZN3+7bd+TtzT1mqrtvsmbZdzzpx5ywHlj9UBRG5X/UTY63C5rlVR
         Vyyg==
X-Gm-Message-State: AOJu0Yz//H2DVF4HCJmHT8eC22ZKWn3zRdxQnmvO4p3yRQb5cWyGSUdI
	0RN8uhypHz9NhhEgEygwO4mzqRDoyLeKpumsvo5oMQs6pP9ddNTL
X-Google-Smtp-Source: AGHT+IEqTLc8M1Ob/SxijoPPwNWo/9aE30s0TjvU1Y4Hfk1ytw8qZIyfLWL8wLEoZOcpiorcS0EMlg==
X-Received: by 2002:a5d:6a8c:0:b0:368:68d3:32b3 with SMTP id ffacd0b85a97d-37a422c5dafmr5344043f8f.26.1727031670478;
        Sun, 22 Sep 2024 12:01:10 -0700 (PDT)
Received: from [10.188.212.131] (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7afd836fsm81015195e9.30.2024.09.22.12.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Sep 2024 12:01:10 -0700 (PDT)
Message-ID: <9bb46e16-eb37-4d76-a917-e0f1e738fd04@gmail.com>
Date: Sun, 22 Sep 2024 21:01:09 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] staging: rtl8192e: Use MSR_LINK_* macros
To: =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@protonmail.com>, gregkh@linuxfoundation.org,
 tdavies@darkphysics.net, dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240921122113.30009-1-dominik.karol.piatkowski@protonmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240921122113.30009-1-dominik.karol.piatkowski@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/21/24 2:22 PM, Dominik Karol Piątkowski wrote:
> There were two seemingly not used macros defined in r8192E_hw.h:
> MSR_LINK_ADHOC and MSR_LINK_MASTER.
> 
> There is one function explicitly updating MSR (Media Status Register):
> _rtl92e_update_msr - only MSR_LINK_MASK and MSR_LINK_MANAGED are used
> there. However, in rtl92e_set_reg, inside HW_VAR_MEDIA_STATUS section,
> MSR is also updated - covering more than MSR_LINK_MANAGED case.
> 
> This series makes use of appropriate MSR_LINK_* macros in rtl92e_set_reg
> and removes duplicated MSR_* macros. While at it, fix camel case variable
> in rtl92e_set_reg function.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@protonmail.com>
> 
> Dominik Karol Piątkowski (2):
>    staging: rtl8192e: Use MSR_LINK_* macros
>    staging: rtl8192e: r8192E_dev.c: Rename btMsr variable
> 
>   drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 14 +++++++-------
>   drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h  |  6 +-----
>   2 files changed, 8 insertions(+), 12 deletions(-)
> 

Reviewed-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
