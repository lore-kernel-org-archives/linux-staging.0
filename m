Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C8A14A084
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 20:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709064776; cv=none; b=OVxnf61i7Xd7FPuJ3nwd/JDxNbJW2DqRXOCTmZQ0T5dtKNTSptYIAYLrkO+ZLywL86/wZ/jDLaYGqSHxmtjDxYRh61XoPOxkLmWcC3SjvwFuyOD614QyQsTVzaYLUTcmf8L2oC+AST1K0rQmfcQKZpBQMOmQefkLFX6KTzQodCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709064776; c=relaxed/simple;
	bh=FDmqjzO60Q8OrR7guOVB+g5v8pY6Y2fCRozeYYaZhOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZKqxy0axrcEwSojrB9xaGgIAYsXjN0F0g9v6+EmimYpI9uN7aH9RYDZPMnvS96pSL1G7q8dDouWisQtDuB4LL9cyYtEy10vmlTGUXBwlzLgyJJsSB1rk5r9RIiHNYL062Tp7qRs0boWV2OijTaMrxMX5YEOROEGn/qlKiOs6dGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4qMCA8T; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4qMCA8T"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a43e705b183so5067566b.0
        for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 12:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709064773; x=1709669573; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AcLhI7SOzfDL6TZcUhIL0ITt+5YPCX+hAG9zA73+PiM=;
        b=A4qMCA8TNBpzHdAhncvZoWVw/4ATvfgI9o79wxWZO1HKJtuYWow5W/qjqYRdhZdyfj
         Nso623STHYLDYo1140XsMCFcZZ7lLtuXdFGkPbeUKoByTMkwoMrtZQO+1u63JDH2LUXr
         7TzVdGo2OlBvePrjEubaaKETywainWHvJ3zeL6pB+FcIcmfzKR8CLnYmidUL85ZzAugZ
         opvTUpyNO1kKWLhxA7TZ3UGOfC9PatOkCfX0vRai5WBs6IKIuCjQjfrGVYZbNX4mqMI6
         rdhoe6WS0iBJUgPkxXSya8byVJdOzUWSnNJ6VY8MPfbjrpPc/PYeS4eyQ7e4UkDgXAMX
         JNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709064773; x=1709669573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AcLhI7SOzfDL6TZcUhIL0ITt+5YPCX+hAG9zA73+PiM=;
        b=H48supDuh9qflPdBfS93G1VuOzRhcF+XPgjWv4qskFL5FIYCVBgxGFLtKnxQQkZAoq
         vhoQwFuGCRugG5EJLSy6THpuiB99eSSHGww74Ghon8cc3LeSuvJOvhFZulk4JwLC2L2k
         PwB7KXnmZ21HwEj27+ZBNWqD8jTSIiT2gJXdx/T5In5/a2UecR3Z4G0wacMMxdzE75WA
         /Atjml1wFP2Q8abADgqy1iaOLSzzWuSVpgi+GOACyX4wSjvJLzyIkxaaBGo+VUeFzoi6
         6tb1yweq6SnP8OTmBd0LgCR2TZAJxU7cXB/56dRgwstMaOKT+2MKs0tC3A6pcN2CGoZY
         bHvg==
X-Gm-Message-State: AOJu0Yy8yauJflrHa0PkonWqmLfAzwA8MJscyTndqhUd8o+qsxJ9CpKv
	rFFum887++Dl9Vrme9XCPfmSYdPua6RyJFa29JUjaBZYVB8oMop9
X-Google-Smtp-Source: AGHT+IHwGyuUWcZpsCuJ8SOrNeKpFeSxRYrLn7Ff7b4cl/bcE/Asw0z0KAYCfoosb6RCR5Uvy6oDaQ==
X-Received: by 2002:a17:907:7808:b0:a3e:9a90:7f68 with SMTP id la8-20020a170907780800b00a3e9a907f68mr6250562ejc.7.1709064772994;
        Tue, 27 Feb 2024 12:12:52 -0800 (PST)
Received: from [192.168.0.102] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id cx6-20020a170907168600b00a43ecf3ab6bsm45716ejd.38.2024.02.27.12.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 12:12:52 -0800 (PST)
Message-ID: <3905a925-031f-4e98-8eee-ecf79ac1faa5@gmail.com>
Date: Tue, 27 Feb 2024 21:12:51 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/20] Staging: rtl8192e: Fix checkpatch warning for
 rtllib_softmac.c
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 anjan@momi.ca
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240227044157.407379-1-tdavies@darkphysics.net>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240227044157.407379-1-tdavies@darkphysics.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/27/24 05:41, Tree Davies wrote:
> This patch series attacks checkpatch camelcase variables warnings found in
> rtllib_softmac.c.
> Thank you in advance to reviewers.
> ~ Tree Davies
> 
> v2: Fixes a few alignment and commit messages which went over 75 chars.
> 
> Tree Davies (20):
>    Staging: rtl8192e: Rename function rtllib_rx_ADDBAReq()
>    Staging: rtl8192e: Rename variable NumRecvDataInPeriod
>    Staging: rtl8192e: Rename function SecIsInPMKIDList()
>    Staging: rtl8192e: Rename variable PMKIDList
>    Staging: rtl8192e: Rename variable Turbo_Enable
>    Staging: rtl8192e: Rename variable osCcxRmCap
>    Staging: rtl8192e: Rename variable bCkipSupported
>    Staging: rtl8192e: Rename variable bCcxRmEnable
>    Staging: rtl8192e: Rename variable CcxRmCapBuf
>    Staging: rtl8192e: Rename variable BssCcxVerNumber
>    Staging: rtl8192e: Rename variable CcxVerNumBuf
>    Staging: rtl8192e: Rename variable asRsn
>    Staging: rtl8192e: Rename variable AironetIeOui
>    Staging: rtl8192e: Rename variable osCcxAironetIE
>    Staging: rtl8192e: Rename variable CcxAironetBuf
>    Staging: rtl8192e: Rename varoable osCcxVerNum
>    Staging: rtl8192e: Rename varoable asSta
>    Staging: rtl8192e: Rename reference AllowAllDestAddrHandler
>    Staging: rtl8192e: Rename boolean variable bHalfWirelessN24GMode
>    Staging: rtl8192e: Rename function MgntQuery_MgntFrameTxRate
> 
>   .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |   2 +-
>   drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |   6 +-
>   drivers/staging/rtl8192e/rtl819x_BAProc.c     |   2 +-
>   drivers/staging/rtl8192e/rtllib.h             |  25 ++--
>   drivers/staging/rtl8192e/rtllib_rx.c          |  30 ++--
>   drivers/staging/rtl8192e/rtllib_softmac.c     | 128 +++++++++---------
>   drivers/staging/rtl8192e/rtllib_softmac_wx.c  |   4 +-
>   7 files changed, 99 insertions(+), 98 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
