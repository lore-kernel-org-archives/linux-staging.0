Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787D311734
	for <linux-staging@lists.linux.dev>; Thu, 23 Nov 2023 21:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOjg4veO"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-507f63fcbf6so389193e87.1
        for <linux-staging@lists.linux.dev>; Thu, 23 Nov 2023 13:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700773915; x=1701378715; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gmvIaEqBj6Deu/JeKDksUIpW27xW+EwbBrD/IEgkMIE=;
        b=LOjg4veO5jefh8lkGkTQt+YjPKVO6Xb+s6SDrspxplXpbgnbm3flU6KfA4DiMfHshX
         RE09Txo+ce2K/YKsgeCOopp1h6wKgbdUScMZKJeUIMssvw4yxPc8bLNuDLge8AYZtmwT
         6lzqQX9kDsJ5/R03jsa74DiR6NmUM/I88Klsu3mBhluwHh8A203tumgOohDd5imvGQNv
         kHxtDoeS3/AbcchoydQ6OwNYjA+kdAqOeejxEMCn0ZxzEH7Db+mAbJX4QdGKHFXt4EgC
         zpcyTgdhI0IUW6ff6o/7jwcStvIS/xvd7gUFAKob3CI4DY/Qfpfb6jZSg4dnUZ5WzD2T
         8cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700773915; x=1701378715;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gmvIaEqBj6Deu/JeKDksUIpW27xW+EwbBrD/IEgkMIE=;
        b=DC1x38+5xgb6eblMW++yfPw5v4NiNSUjzKvGDhRnugRaXzoZ+k9NpHi3AER6iQ8QTM
         F9sSMnmd5COLKimk4Gd5jCdq43myyoZCcKMLMtvUeELBATFnlQ+vu70w0zoKMv5ylku1
         kp1uf8WB7pzTTpc7aYioPu+KlzaDb4mmgJ9G9WRYtrOvXE+Lcee8Mf1EuV8fAoHq7xRH
         7xD9nAM6mn2TByTGEYods0V/k5yKHDhAB6CSwKeO30CQjcd9gWxdrsJLxpMAOuR98G7i
         fMzwJ4oWpN70CjJs/RLleGFBdiv0eCr02kq418c4YMY87ooU6lDuJDDKQyKdAAaLoHG2
         3NEw==
X-Gm-Message-State: AOJu0Yxp+/sZhvHlFj4Naz2BK2h4T2k8KFa5qmFo5/qMTC7ft0B5tu/r
	2KyM5THOvBggVe/Hw0vsXiJuQhrEFYI=
X-Google-Smtp-Source: AGHT+IFKn/XU2BMprJTesVrXmPsGtmy0MuYfdX+NEV/yzZFIgeuEfgvTVEk5P2nPzCHH3hanh7BIPQ==
X-Received: by 2002:a05:6512:1091:b0:50a:7806:d0db with SMTP id j17-20020a056512109100b0050a7806d0dbmr355448lfg.4.1700773915186;
        Thu, 23 Nov 2023 13:11:55 -0800 (PST)
Received: from [192.168.0.101] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id b14-20020aa7dc0e000000b00548a258227asm1038698edu.30.2023.11.23.13.11.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 13:11:54 -0800 (PST)
Message-ID: <b98d32fa-6860-4ef0-9c45-6602cfc5880e@gmail.com>
Date: Thu, 23 Nov 2023 22:11:54 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] staging: rtl8192e: renaming 5 different variables
 patch series
Content-Language: en-US
To: Gary Rookard <garyrookard@fastmail.org>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20231123144337.13112-1-garyrookard@fastmail.org>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20231123144337.13112-1-garyrookard@fastmail.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/23 15:43, Gary Rookard wrote:
> Hi,
> 
> This patch series renames (5) different variables from Pascal/CamelCase to
> Snake case.
> 
> Patch 1/5) renamed variable HTMcsToDataRate
> Patch 2/5) renamed variable TxCountToDataRate
> Patch 3/5) renamed variable IsHtHalfNmodeAps
> Patch 4/5) renamed variable HTIOTPeerDetermine
> Patch 5/5) renamed variable HTIOTActIsMgntUseCCK6M
> 
> Linux kernel coding style (cleanup), checkpatch Avoid CamelCase.
> Driver/module rtl8192e compiles.
> 
> Regards,
> Gary
> 
> ---
> v3: Corrected versioning from v1 -> v3, includes change history.
> v2: v2 was skipped over..v3 corrects this.
> v1: Style and compile issues, asked to redo.
> 
> Gary Rookard (5):
>    staging: rtl8192e; renamed variable HTMcsToDataRate
>    staging: rtl8192e: renamed variable TXCountToDataRate
>    staging: rtl8192e: renamed variable IsHTHalfNmodeAPs
>    staging: rtl8192e: renamed variable HTIOTPeerDetermine
>    staging: rtl8192e: renamed variable HTIOTActIsMgntUseCCK6M
> 
>   drivers/staging/rtl8192e/rtl819x_HTProc.c    | 18 +++++++++---------
>   drivers/staging/rtl8192e/rtllib.h            |  4 ++--
>   drivers/staging/rtl8192e/rtllib_softmac.c    |  2 +-
>   drivers/staging/rtl8192e/rtllib_softmac_wx.c |  2 +-
>   4 files changed, 13 insertions(+), 13 deletions(-)
> 

So beside the two
CHECK: Alignment should match open parenthesis issues everything else is OK.

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
