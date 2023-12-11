Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0BE51C38
	for <linux-staging@lists.linux.dev>; Mon, 11 Dec 2023 18:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtUSvbgC"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40c32e205fcso6898285e9.1
        for <linux-staging@lists.linux.dev>; Mon, 11 Dec 2023 10:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702320861; x=1702925661; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TJ/uO2ze7N5KlFGwgc99whbyaD3GgIFDlJtONkS1JrM=;
        b=gtUSvbgCtfBAvnhgPFTHadFWQKVSEIOEZ7DgmPc0CULscFWUBs9qlb9ncgTlsHU4Va
         HlWzZFRuzLL6nPPKKaQ3AJaUXxz5mZu5sMjBka72b3evg/Y7x+cDHGO+nKULMqVNwAqS
         nQ9b1Z9whzZM1ViXY5nLaD7e1LRlWIaelLbbQOkXG9mSnK4GHvRAIJte2PDTR7j0f0o6
         FnecXeFSi+trZYVLsRvb9J3Xgwwda+Msw10K2YSyAVWAJeTldBcom78OhX6liCZWN5Tv
         1Ff3BAO+/mxnE4db1fww8EhxfUJXNSljdOHXM9jYViJ4a/dvj/EI7Jns0E8GaOzK4/Zh
         v0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702320861; x=1702925661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJ/uO2ze7N5KlFGwgc99whbyaD3GgIFDlJtONkS1JrM=;
        b=TO5B0haxzXiUnIVyXCy92uuxKDiMwkUdRlF6nEGWLEYvT5qjcyz3Wx2+iJx3esvM37
         Dcj588pCdJszApuk4DiCgX6mnv4PdRAmrpnc19xgeoT3SQK4xurCaReNWH5Q2ovzztI2
         Dha5abnCINVKN5C5MdaRFnZX+EmnPnY8c1o0QqkFLc4UgjWJzXq4jADgDQhS9ZDLmQNo
         lZiV9FcnDtQyDCcsEpZCrcLRPuWO39ZcW6+NZiNd6RrJvDGE+KCh5R/hbFqGqqGdJeLj
         ZbyQuMEYbCPkJ/kdmPWLOG1KdlP9s8TORuuJpvG5G+9ZKOu7ocOR6RsfBbg2FIT4CyPf
         WkCA==
X-Gm-Message-State: AOJu0YzOpbMawZfnu8qe7UXYTLg1anPuSDH3HhjrspG/KBdetrZ+u2Q8
	Z/mI6rMWykAj+dqQ+UUET1ebZABeFK0=
X-Google-Smtp-Source: AGHT+IGpC+ooNOm4AcPs5iF1+NNGads2qfhDQV60CIdpKmXVYBHLVWemKinat1QVkjV7SsNPrXa6FA==
X-Received: by 2002:a05:6000:154f:b0:333:538a:aedc with SMTP id 15-20020a056000154f00b00333538aaedcmr6697426wry.2.1702320860941;
        Mon, 11 Dec 2023 10:54:20 -0800 (PST)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id g12-20020a5d46cc000000b003335c061a2asm9192828wrs.33.2023.12.11.10.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 10:54:20 -0800 (PST)
Message-ID: <b7a9bc86-68aa-4054-88cf-95c3da693db0@gmail.com>
Date: Mon, 11 Dec 2023 19:54:19 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] [Series 1] rename variable HTIOTActDetermineRaFunc
 and (4) other
To: Gary Rookard <garyrookard@fastmail.org>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20231211001335.26169-1-garyrookard@fastmail.org>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20231211001335.26169-1-garyrookard@fastmail.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/23 01:13, Gary Rookard wrote:
> Hi,
> 
> This patch series renames (5) different variables with
> the checkpatch coding style issue, Avoid CamelCase.
> 
> Patch 1/5) rename variable HTIOTActDetermineRaFunc
> Patch 2/5) rename variable HTResetIOTSetting
> Patch 3/5) rename variable HTConstructCapabilityElement
> Patch 4/5) rename variable HTConstructRT2RTAggElement
> Patch 5/5) rename variable HT_PickMCSRate
> 
> Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
> 
> Gary Rookard (5):
>    staging: rtl8192e: rename variable HTIOTActDetermineRaFunc
>    staging: rtl8192e: rename variable HTResetIOTSetting
>    staging: rtl8192e: rename variable HTConstructCapabilityElement
>    staging: rtl8192e: rename variable HTConstructRT2RTAggElement
>    staging: rtl8192e: rename variable HT_PickMCSRate
> 
>   drivers/staging/rtl8192e/rtl819x_HTProc.c | 14 +++++++-------
>   drivers/staging/rtl8192e/rtllib.h         |  6 +++---
>   drivers/staging/rtl8192e/rtllib_softmac.c |  6 +++---
>   3 files changed, 13 insertions(+), 13 deletions(-)
> 

Compiled and tested on hardware -> OK

