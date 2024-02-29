Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB40A39ACD
	for <linux-staging@lists.linux.dev>; Thu, 29 Feb 2024 05:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709183861; cv=none; b=g74Sfe9xeUFmxYDHNG2QMTJnjrNxoTqLqS93y9JkwQdFSBk+A9pw1DKwSgnnXhZqgesb9TvQE+ah1I5C4wJGxTWnMlB4Um/21GW9yd9VHf9AquLW+aVm0SYWZIIBUoRJpoM2cS9JM2d7MTh8rUsdPeFez2CZSzXoKaEn31R7CpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709183861; c=relaxed/simple;
	bh=QLdvRcyiMne/VT/oSplWRmRIFKGFh7UjVB3Dd95hIss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l45FG3Yu7RHZzTLNwrTeAwz1bGNw5UGJ3EwTCMX43km3p3xJw8bYmqnxeatt94tQKr20vEx9fx8qpnxnZ5DNkeVe2pBui11s1zhoNh5aXbM2WVHg82lTKdbPoG7t0F7J0k3IOovw4Ztk8WQow7DMHrdN0MPchj84fpBXflAzgak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZOe9igsT; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOe9igsT"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51327cd65beso47366e87.1
        for <linux-staging@lists.linux.dev>; Wed, 28 Feb 2024 21:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709183858; x=1709788658; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oEDigR9B35jgh3NUhIDi4WoeBZW/WlBf7UzIlNaTSiw=;
        b=ZOe9igsTD6h6d6xIQoaWe281FsnswaNJU1AL6pUGVvAw6X90HHiWMiZGHsABGec1ir
         9XNGmjZaX4MwQr0EJUkmY2VSZKSWbHTodTxXKG8IndgrTDKexR3mnpDcGn3oMiQQd22d
         ZG6/orQAk62T8Uu34YL8M1buZewaipS+7ILDYymYVwSQPPm0YWLpJs3rpu5tM3+FNuQE
         8Cna1Q+r/fD4QfjuD0GF42VTswMGwpmPii4n0i5iu5Ap4yr6zuasJTSXi9t0T7BslloH
         u831UAYqFktCmf7DR0ZmopQLRJrO1h0vEqFHhqaf05sRYEu8yR+9pHvLtLsDw4C8VrTm
         iDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709183858; x=1709788658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oEDigR9B35jgh3NUhIDi4WoeBZW/WlBf7UzIlNaTSiw=;
        b=Ob27k6tM3R9Ho92feHYp+qip5NIxs5HY56TImcjjcugEnvpqejN3/hKJfC0I5bDbk/
         GovizL5CpXcXJUmH1T48g8xf7niuSaQUqC+OPYNEMv4eKe8luwWKOVSmWQ5Y7Pljqy7J
         M6ZtnQhRgrkP0pTZSoNk3HewLSxuaLPqUwZVMBDLK58aDPj8TSc/3F/4QpwTSrqR1SXg
         VKTaqw8Nm6yftDWNHonlpa4TG9VQuz0qHL1JhychGy3TahVYB8zMd6TG5bN1/VIfY8DH
         q/1sc4EX1ltDGFzVJ6u7EmEccJFUZTIlWveTR+oJCEdwlq39tcIAAF9AFrRCIr3kMNZk
         W5gg==
X-Gm-Message-State: AOJu0Yw4iVfvdV1fHQ0qH0PIdL5U0q+dmBJRY/M10/4GrTnvUwcAz55P
	wrM7L1MOrV1H5uomRx1sqadwGhWUWY5U3A3TcfDu42VMPCCOOCcV
X-Google-Smtp-Source: AGHT+IHxbIGnVddxTEb8eZVws/jmRpTTm4E/db4m/qINhv+hBD1QscgPzEdEUCBi9/LxGQEwXYBn+Q==
X-Received: by 2002:a05:6512:10cb:b0:513:1cc8:6d05 with SMTP id k11-20020a05651210cb00b005131cc86d05mr666989lfg.2.1709183857655;
        Wed, 28 Feb 2024 21:17:37 -0800 (PST)
Received: from [192.168.0.102] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id o3-20020a05600c4fc300b0041297d7e181sm858237wmq.6.2024.02.28.21.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 21:17:37 -0800 (PST)
Message-ID: <5b9b2619-eea8-4b8f-8e66-e343272ab51f@gmail.com>
Date: Thu, 29 Feb 2024 06:17:35 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Staging: rtl8192e: Fix Checkpatch warnings in
 rtl819x_BAProc.c
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 anjan@momi.ca
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240229024325.453374-1-tdavies@darkphysics.net>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240229024325.453374-1-tdavies@darkphysics.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/29/24 03:43, Tree Davies wrote:
> This series fixes the remaining checkpatch issues in rtl819x_BAProc.c
> These patches are to be applied after patch-series: '[PATCH v2 00/20]
> Staging: rtl8192e: Fix checkpatch warning for rtllib_softmac.c ''
> Thank you to all reviewers
> ~ Tree Davies
> 
> v2: Change commit message in patches 7 and 8
> 
> Tree Davies (8):
>    Staging: rtl8192e: Fix 5 chckpatch alignment warnings in
>      rtl819x_BAProc.c
>    Staging: rtl8192e: Rename variable TxRxSelect
>    Staging: rtl8192e: Rename function rtllib_send_ADDBAReq()
>    Staging: rtl8192e: Rename function rtllib_send_ADDBARsp()
>    Staging: rtl8192e: Rename goto OnADDBAReq_Fail
>    Staging: rtl8192e: Rename goto OnADDBARsp_Reject
>    Staging: rtl8192e: Rename function rtllib_FlushRxTsPendingPkts()
>    Staging: rtl8192e: Rename function GetHalfNmodeSupportByAPsHandler()
> 
>   drivers/staging/rtl8192e/rtl8192e/rtl_core.c |  2 +-
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c   |  2 +-
>   drivers/staging/rtl8192e/rtl819x_BAProc.c    | 66 ++++++++++----------
>   drivers/staging/rtl8192e/rtl819x_HTProc.c    |  8 +--
>   drivers/staging/rtl8192e/rtl819x_TSProc.c    | 24 +++----
>   drivers/staging/rtl8192e/rtllib.h            | 10 +--
>   drivers/staging/rtl8192e/rtllib_rx.c         |  4 +-
>   7 files changed, 58 insertions(+), 58 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
