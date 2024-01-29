Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A5E76044
	for <linux-staging@lists.linux.dev>; Mon, 29 Jan 2024 20:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706558668; cv=none; b=JiHHa+/7ZlJ2HFAtbEQuSo+Jy3kjwYeOyQOOkz/rW25Zn+lbB6wpOK8x2ZbhfviPzqkxd89x6HfZOzrKWmjXG/uVHWhaS1uEMAnHnbbLOR/uaqgvMCpT1gz/tO1/2+0rsYHfTWqY+WIEskV3PLufM9RqfvZn/5m6jhzdDVONI8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706558668; c=relaxed/simple;
	bh=CtI04kLJuk4+Mb+RGkKqdEQPLMzOvfYosi1DAHpmDKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hxbm1xnEMQ8SzZj6pggWVWnq2FHUkQeVKX7ny2/XYTazbuIsdE0usjvV1MmZj3qYqeulJgB54VPUtpSsAnUpVAnjuv471RXBvuyUj/torFoeTh6WVdjGp9okZKSA8X0Ul05mJuQ7/lgzdvGbEdYjj4C0M9eoP0V3yaPekwC1Ua8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLCAKSkx; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLCAKSkx"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-55d095e6ab5so951321a12.0
        for <linux-staging@lists.linux.dev>; Mon, 29 Jan 2024 12:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706558665; x=1707163465; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=745A/9K2hSfoUx6RdWw0k38aK7Py4rNMCIysWo7mEXk=;
        b=SLCAKSkxeNDCQ9WBuv0/sIfUZhcbJCFKVP23SiwVRLJzesQp6+/nJmASeDorqgfTC/
         bi06k1XVcmpFox0bSFqmUyneGV8ogMXys6IDrD8dwMFV46FQZV/hLOqU47Zb1LIIKGP0
         oZCm/ZGxEYR1Gk/wQK2AzWDSCmypmDlZwXXqqsL36l5NAJCrENlFaTGxmXPnJ13TNRXC
         6LK0SmkwtFHucYqUXxF5q3mEIbrIO3DtWSY2L6SlpC0HCYJwKFalgZIMPqkVy+5NV5Tl
         K5BPi5vYyRf7l9yofyT9FgecvfFSN0Pus7nASc4liiksqYBeldE/nfb3BtAA4iCShsTQ
         dAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706558665; x=1707163465;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=745A/9K2hSfoUx6RdWw0k38aK7Py4rNMCIysWo7mEXk=;
        b=J3XEhiQrLjiG/DICrsVrdzrsw/dnH9tIel2g/yOogdbHE1TyPp5FSdBMfUlERfQ02I
         QmUOxp+x9Ia1ygy9DB6SZ+iIaxqPXyRJ+DMgc5sUESy6CYeyzvTwtHdO5vwqGGVUh22Z
         ezu1a9Pzpcjfd245S4Dqc1IjpEhTN8t2LFkhPbQIJg0KrPO+8T26FvlaOFiZjjXpWww3
         kHH1nldVtIYSOe5uCw21Mg6/pvwigjuyqKtZdToi0/2KVJmB1SvJ9s0mon3s06MA9fpu
         bRQ4HdUQMM2Jg34zyrCfq1FpOAfR9seTO7jMg2sKgLFxN4fazbYOyFnuqSzfc1Z6bdmQ
         shEQ==
X-Gm-Message-State: AOJu0YzPHjIpl8rbSRf+gpILkW6BDuUrtrZkGvW04oSyQgsudqS6U5W9
	JM7GS2V1reg8smW8w5i8fvLUyQGaS14IY748mBJOtDkeksjHkYIn
X-Google-Smtp-Source: AGHT+IGruWOGvOeNgK1MI6oeKyd4AvOTOfNm3xyNHwJeVE1viMN8nttgbNoy7cZZz1Hf/kmgmLmyYg==
X-Received: by 2002:aa7:c14a:0:b0:55f:487:201e with SMTP id r10-20020aa7c14a000000b0055f0487201emr2132229edp.4.1706558664994;
        Mon, 29 Jan 2024 12:04:24 -0800 (PST)
Received: from [192.168.0.101] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id er7-20020a056402448700b0055edfb81384sm2189935edb.60.2024.01.29.12.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 12:04:24 -0800 (PST)
Message-ID: <3e67441a-aafa-403e-b332-c58c5fa75e30@gmail.com>
Date: Mon, 29 Jan 2024 21:04:23 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Staging: rtl8723bs: checkpatch fixes for rtw_mlme.c
Content-Language: en-US
To: Meir Elisha <meir6264@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hdegoede@redhat.com>, Ruan Jinjie <ruanjinjie@huawei.com>,
 Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240129141856.416532-1-meir6264@Gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240129141856.416532-1-meir6264@Gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/29/24 15:18, Meir Elisha wrote:
> Checkpatch fix series for rtw_mlme.c
> 
> Meir Elisha (4):
>    Staging: rtl8723bs: Remove unnecessary braces
>    Staging: rtl8723bs: Remove extra spaces
>    Staging: rtl8723bs: Fix block comments warning
>    Staging: rtl8723bs: fix else after break warning
> 
>   drivers/staging/rtl8723bs/core/rtw_mlme.c | 241 ++++++++++------------
>   1 file changed, 114 insertions(+), 127 deletions(-)
> 

Hi,

please also fix:

CHECK: From:/Signed-off-by: email comments mismatch: 'From: Meir Elisha 
<meir6264@gmail.com>' != 'Signed-off-by: Meir Elisha <meir6264@Gmail.com>'


In Patch 4/4
WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit 
description?)

Please issue a V2 with changelog.

Thanks

Bye Philipp
