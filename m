Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34746FC8
	for <linux-staging@lists.linux.dev>; Sat,  6 Jan 2024 12:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxGnotb6"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2cce6bb9a74so914711fa.0
        for <linux-staging@lists.linux.dev>; Sat, 06 Jan 2024 04:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704545224; x=1705150024; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zsO/+64idbZilW8qozlP/EFQixW3V6s4CGGRG0UI8MI=;
        b=TxGnotb6Guo87N6+l0RjbgTyHSkA9BbPjTcQTgXzCMmhVqAhyQ/tj8uQ/qvxQk3bBj
         agwhdZa3uBMLtVpZkGgSRap70WzkFKT4VKTSuQrYXOQ2JjGyU2pIg0ZORDJCk6m3xzB5
         9sbKXIE9pdJWEjWUehzUeGb3kelBWGNqvisXozCis4iHVPzLY0Tqey60pxQhnHJ2Yt4x
         jQ0YmonjpG+LdYtrNrlGyy9Z6AsKRcge06ZSgeQVJQj67rfxPA2Mzko7okbc00doEZfC
         qXbLEWpBNG4R43lZi6593N5wp08ADNgtCi2JyqI7bLlYVaMIUPGSwa82McwQLJ/szDdR
         dK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704545224; x=1705150024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zsO/+64idbZilW8qozlP/EFQixW3V6s4CGGRG0UI8MI=;
        b=OWTlwoTGl79pY+qDh1pDfhXwB+xrulKtXuEiU/TyNad0/GBOtI9abVag4cAyCRWWl2
         b6RE5GJVATx58hzn7Bumn1IqIfQ0lKUfBVS1gkSSkyjchv1u+pjXH+f4nbGMF1XjV1kr
         zuRPs0ULksk6F9G/uBnRRILqmNubDMZc9GOL10SKuS1KUbqTRwaUa54XWCXzyzSWzZGC
         DygCHK7+QjUqtBvbX0r5uLlmehDBVmayQIlnn7I62+ull8JgzsMgP/Rpd4U2aVG8qIiR
         UDq1zY+JYYzyhyOXBzPQJf2RVw0v63cijzGQj9cqQGI0AuHRvbIeMVxJNYNFog/YfVUy
         YgAA==
X-Gm-Message-State: AOJu0Yz/uQBaDlI87ac8q3+zzNdMH3DeijKnDZ2MxcLHZpoeQVrd/Nhc
	Yo3cMy/EKhcbAO7Gk83vXUE=
X-Google-Smtp-Source: AGHT+IEJj+WI4BTSVat3LiOlKwD3Sz+ByErlpx6sAPXp+Pz5/mt4Pxiep4xU8HSCDa8DAQf/Nt3/Uw==
X-Received: by 2002:a05:6512:2806:b0:50e:7719:4693 with SMTP id cf6-20020a056512280600b0050e77194693mr883100lfb.0.1704545223675;
        Sat, 06 Jan 2024 04:47:03 -0800 (PST)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id z11-20020a170906668b00b00a26ade46619sm1912043ejo.121.2024.01.06.04.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jan 2024 04:47:03 -0800 (PST)
Message-ID: <0d79f685-e54a-4d83-933b-2ee225bca5d8@gmail.com>
Date: Sat, 6 Jan 2024 13:47:01 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/21] Staging: rtl8192e: checkpatch fixes for
 rtllib_softmac.c
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 anjan@momi.ca
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240106055556.430948-1-tdavies@darkphysics.net>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240106055556.430948-1-tdavies@darkphysics.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/6/24 06:55, Tree Davies wrote:
> This series' focus is on fixing checkpatch warnings regarding
> drivers/staging/rtl8192e/rtllib_softmac.c
> 
> Thank you in advance to reviewers
> ~ Tree
> 
> Tree Davies (21):
>    Staging: rtl8192e: Remove unnecessary parenthesis in
>      rtllib_softmac_new_net()
>    Staging: rtl8192e: Rename variable SlotIndex
>    Staging: rtl8192e: Rename function rtllib_MgntDisconnectAP()
>    Staging: rtl8192e: Rename variable bMulticast
>    Staging: rtl8192e: Rename variable MaxPeriod
>    Staging: rtl8192e: Rename variable bAwakePktSent
>    Staging: rtl8192e: Rename variable bSupportNmode
>    Staging: rtl8192e: Rename variable bBusyTraffic
>    Staging: rtl8192e: Rename function rtllib_MgntDisconnect()
>    Staging: rtl8192e: Rename variable bFilterOutNonAssociatedBSSID
>    Staging: rtl8192e: Rename variable array Bssid
>    Staging: rtl8192e: Rename variable NumRxUnicastOkInPeriod
>    Staging: rtl8192e: Rename variable SlotNum
>    Staging: rtl8192e: Rename variable RemoveAllTS
>    Staging: rtl8192e: Rename function RemovePeerTS()
>    Staging: rtl8192e: Rename function rtllib_MlmeDisassociateRequest()
>    Staging: rtl8192e: Rename function SendDisassociation()
>    Staging: rtl8192e: Rename variable bHalfSupportNmode
>    Staging: rtl8192e: Rename variable PMKCacheIdx
>    Staging: rtl8192e: Rename function GetNmodeSupportBySecCfg()
>    Staging: rtl8192e: Rename variable AsocRetryCount
> 
>   .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  8 +-
>   drivers/staging/rtl8192e/rtl8192e/rtl_core.c  | 32 +++----
>   drivers/staging/rtl8192e/rtl8192e/rtl_wx.c    |  2 +-
>   drivers/staging/rtl8192e/rtl819x_TSProc.c     |  6 +-
>   drivers/staging/rtl8192e/rtllib.h             | 26 +++---
>   drivers/staging/rtl8192e/rtllib_rx.c          |  6 +-
>   drivers/staging/rtl8192e/rtllib_softmac.c     | 86 +++++++++----------
>   drivers/staging/rtl8192e/rtllib_tx.c          | 10 +--
>   drivers/staging/rtl8192e/rtllib_wx.c          |  2 +-
>   9 files changed, 89 insertions(+), 89 deletions(-)
> 

Is working fine on hardware.

Bye Philipp
