Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1875A8665A
	for <linux-staging@lists.linux.dev>; Mon, 29 Apr 2024 17:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714412449; cv=none; b=gctZ3MbNCn5ioKbF9FFDas4gO0D4zGIGrzjBnrZT8yhydn1GFSKsLTpqQC3RAst8fQm26wt2q0nPbH5Jc0snrGautwH/KvAu/ilXK6XkG3t/k81XuUq3IU/AezxDSVudmHNkheRQkFPIGCMbMXv/q3WcDNLWkocRF1eC8EWWWBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714412449; c=relaxed/simple;
	bh=AJe7hDA+FAhFKDxklHcSHgjXDvoB7jvUVi6rDdBGHxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SP8kIKVnTSnLhgxpMPCJpj7tW+cM9Jm29P1WzhrjXe709BjTdO+PeLPngv78lwBOSlIf/mNV9e4accGSyIhtnLV0voWAONlN4dYXXUq8faYgfLZWkoyrV6Ixvhaet6A8XKeOk2kPR31ez1h2VAXIJW1ZPs7RNJv2D5PtRKjAeCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFwS2LAH; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFwS2LAH"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51788cbec59so915863e87.1
        for <linux-staging@lists.linux.dev>; Mon, 29 Apr 2024 10:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714412446; x=1715017246; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NME6IMdi2Oz5flUJ3rLIhaX1spcUgVHRV9oyuwgHAnE=;
        b=GFwS2LAHePMQJjMaZSiM60817X5lo4fPXXO4saxRp9ew3ROlUxqea0p9AO5s0RWLth
         vdKyqL4vFORoLL/9Q2t4wxpHo96Y+iSDcTnPmR1rgoJ0bmcjdLzuUAz0TRkPZTSJ0cC+
         4Jf5UW1TeXdn/Aaz76a1P4IJ5/wqR1CVLw1v+1s/UIJO5LAXZa2Wm5E6YcjIbeMuHQjC
         UqU8+IlHKHN2EG45UW8iq+lj9cuOIRmRmHi8MTJnv8Sf6Q8uvnp//1vsdAF/4LLY/71W
         6Oby+2QLJynjEU4lRe5143zQLjwdh/AnqFDCTJZHmcAQyTCt3J22XU7PBxWSMSIAJ7Tb
         xdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714412446; x=1715017246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NME6IMdi2Oz5flUJ3rLIhaX1spcUgVHRV9oyuwgHAnE=;
        b=j1vOsbLogZWNN9UWTNMF9gX0A3jL4RzpSfQuIWPejbEj2NrXjBT7ZFYIpQPIHAL8KA
         pw+qrGdWhNJWlwFXVYXyjq//Nru8U0VUPSGAD8JbgrJzlLkK7Pe77Wd86iCWm8WVXjY+
         Xpr52ufUK7w2omdIOgECDMq+jSGFmHgkRbc8LaybiTrSbdFKveKesbFayXR/5mTz6+rS
         VQW6a+5ZOQjPks8Dku0SOAmfxba6zA8ICCUbRkblB5wBk4oOYrdNwLW3yczEKGO4uTmJ
         9rZNrmdVxt60v6tmiMOJJKOb43rYp7mgJzLnqOgeeLdQQNYO2MMIZU3vtARNy1EMbCJ2
         YKlA==
X-Gm-Message-State: AOJu0YyPg2uC7eZig/IHZ90dKUJDHA9MGUv8gsNrThK6u5j/PloFv9Dv
	dmWFEFjBtN3cUvf+PBA1s9hoU2AxPyjJ5a5hOjuXUdQXvGarzXsm
X-Google-Smtp-Source: AGHT+IHWoLRyL9PlF7Vc0wXMfAlv/kDMjkYUxrE++vGREy/Adt/g7+bMzNgPiwZK2QodTS7C9PggiA==
X-Received: by 2002:a19:ca48:0:b0:519:2e3d:213 with SMTP id h8-20020a19ca48000000b005192e3d0213mr6413176lfj.5.1714412445860;
        Mon, 29 Apr 2024 10:40:45 -0700 (PDT)
Received: from [192.168.0.103] (p57935690.dip0.t-ipconnect.de. [87.147.86.144])
        by smtp.gmail.com with ESMTPSA id fj17-20020a0564022b9100b0056fe8f3eec6sm13159245edb.62.2024.04.29.10.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 10:40:45 -0700 (PDT)
Message-ID: <3ed42990-29bc-4b2d-b8e1-eb3335207184@gmail.com>
Date: Mon, 29 Apr 2024 19:40:44 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/18] Staging: rtl8192e: Rename variables in
 rtl819x_HTProc.c
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 anjan@momi.ca
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240428230106.6548-1-tdavies@darkphysics.net>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240428230106.6548-1-tdavies@darkphysics.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/24 01:00, Tree Davies wrote:
> This series renames 18 variables found in rtl819x_HTProc.c
> Thank you in advance to reviewers.
> ~Tree
> 
> Tree Davies (18):
>    Staging: rtl8192e: Rename variable CurSTAExtChnlOffset
>    Staging: rtl8192e: Rename variable CurrentAMPDUFactor
>    Staging: rtl8192e: Rename variable OptMode
>    Staging: rtl8192e: Rename variable LSigTxopProtect
>    Staging: rtl8192e: Rename variable ChlWidth
>    Staging: rtl8192e: Rename variable AdvCoding
>    Staging: rtl8192e: Rename variable MimoPwrSave
>    Staging: rtl8192e: Rename variable ShortGI40Mhz
>    Staging: rtl8192e: Rename variable ShortGI20Mhz
>    Staging: rtl8192e: Rename variable GreenField
>    Staging: rtl8192e: Rename variable TxSTBC
>    Staging: rtl8192e: Rename variable RxSTBC
>    Staging: rtl8192e: Rename variable DelayBA
>    Staging: rtl8192e: Rename variable MaxAMSDUSize
>    Staging: rtl8192e: Rename variable MaxRxAMPDUFactor
>    Staging: rtl8192e: Rename variable MPDUDensity
>    Staging: rtl8192e: Rename variable ExtHTCapInfo
>    Staging: rtl8192e: Rename variable DssCCk
> 
>   drivers/staging/rtl8192e/rtl819x_HT.h        | 36 ++++-----
>   drivers/staging/rtl8192e/rtl819x_HTProc.c    | 84 ++++++++++----------
>   drivers/staging/rtl8192e/rtllib_rx.c         |  2 +-
>   drivers/staging/rtl8192e/rtllib_softmac_wx.c |  2 +-
>   drivers/staging/rtl8192e/rtllib_tx.c         |  2 +-
>   drivers/staging/rtl8192e/rtllib_wx.c         |  8 +-
>   6 files changed, 67 insertions(+), 67 deletions(-)
> 


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
