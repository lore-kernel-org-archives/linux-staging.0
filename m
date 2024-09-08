Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4206176ACB
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 20:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725828280; cv=none; b=G7Jn0x+u5UOpz1OgR1CEQP7aOWN/hfRhkefgQrc5elmVa03+2stG+LkWi45Xu/CiBN35m/iKXHKH/a/kw2/MNMmkLnrIt4xfTRcVJ5LG6e4PT2hFDe9/JHWFAaKLWsyg7Du6YI4Ck6KKuwdUVWFs1+PWRErggB27FR0vpEF97q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725828280; c=relaxed/simple;
	bh=ce5/oy94qv4P5QWUjkFHth5O//hDjwj3U4B40R0gHfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FyzlLvwB0KsGhj1MrrGkIWSKcxs3aoodIZYO+LGNsd6geQ1XOVor0s9Cv9zSXP+nyL/1j/qUClqZ//N8Bx84ApnN1tIzptcKYWDuaVANuribQmm5+mS1xrHBI76tAnKprySqCHyidiqmEBm3KxSAdFPBQAdmmf5d0RbwMLeYbe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXbn1RfV; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXbn1RfV"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-374ca65cafdso2249339f8f.2
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 13:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725828277; x=1726433077; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Asp8Q/euPnossaqJrTRIZ1Vkqf9RFiJuPtiDLCvZeQI=;
        b=cXbn1RfVSh3geUNsWNQ2jHvyeLSeZCSE1SdHMLQFAn9tufzjF16QQy3LIXgkZaPj7S
         gbgVXb9Xz7OGtRaG5/e/6/tUA1wjXhRRrqjwYkIuNmZzocZxYrcGOvI0s9FyP5LyFqE9
         mnYyZPUXxthm0wCGLBelPtTC6EUJqDAw7O7gIO4JpLKK7htkPgjrimgvTK95yOliIYrV
         jXoC2i2DiKKXr/WJneu+UuUH6fiQwwRMExKi+hdK6H+rm1sBjLS3oZErATMsj2dXNI45
         cg+ctL1aKDJ/g1oCOGCk+/AGjf6NkScUF7wQviniTGXoZO8R1bJFy75YS5wRvQECkWPi
         uuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725828277; x=1726433077;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Asp8Q/euPnossaqJrTRIZ1Vkqf9RFiJuPtiDLCvZeQI=;
        b=KumZYCrbafxKPogaZqAJnwWxhdISHy7sfp3y8ubRwebvNQekDNeW9pbTx/5QDq6F0C
         DFUjzPkvh19VLiEWtw4OtHO1pWT+dude5YBMfc11pLBnmiczG2qFlNEw85/96U1dPWMd
         uO49MwxDMkJgKNSJirn2qlUUxY4Tkqr9Rx2bz/tpHc392aWXIShzQRzk1BuArobTNU7K
         jVQBjhGgbqACR/8q8fu8i0ysTSE3gUgQ8xkfE0Up+qs8QEPKNH/X3z1fKvVv+VvBszH1
         ISFo2JFX2yKIYunPZyhc+OzAF9RfNQbKKlIf8aiY1PKyXpXaSCaPI06TZdQ52MJP27K+
         O39w==
X-Gm-Message-State: AOJu0YxfxvFLByPmLt5beKzyF3qFpHdpBT3JAyDaDmqxwBZNn12qN6P5
	rGIrI63ujswn6DQ6V93Z77I26KGurwLYbnZixG2XqnkgWAeV+Z8a
X-Google-Smtp-Source: AGHT+IHM9xQj2l/pnuowsDJq0ee0kHagA1SOlJxibcTBQRb3up7/6pVWYiWNY9O39D5wKe7cZS6Abg==
X-Received: by 2002:a5d:5e0e:0:b0:374:af04:d6a3 with SMTP id ffacd0b85a97d-3789913417fmr2521402f8f.57.1725828276957;
        Sun, 08 Sep 2024 13:44:36 -0700 (PDT)
Received: from [192.168.0.104] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25979fa3sm244384266b.71.2024.09.08.13.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Sep 2024 13:44:36 -0700 (PDT)
Message-ID: <74e0d097-7883-446f-8722-f79169cab15d@gmail.com>
Date: Sun, 8 Sep 2024 22:44:36 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] Staging: rtl8192e: Cleanup even more camelcase
 variable names
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 anjan@momi.ca
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240908192633.94144-1-tdavies@darkphysics.net>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240908192633.94144-1-tdavies@darkphysics.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/24 21:26, Tree Davies wrote:
> This series performs variable renames
> ~ Tree
> 
> Tree Davies (16):
>    Staging: rtl8192e: Rename variable pReorderEntry
>    Staging: rtl8192e: Rename variable SeqNum
>    Staging: rtl8192e: Rename variable SignalStrength
>    Staging: rtl8192e: Rename variable pFrame
>    Staging: rtl8192e: Rename variable bPacketToSelf
>    Staging: rtl8192e: Rename variable Para1
>    Staging: rtl8192e: Rename variable Para2
>    Staging: rtl8192e: Rename variable ScanOperationBackupHandler
>    Staging: rtl8192e: Rename variable Operation
>    Staging: rtl8192e: Rename variable bAssoc
>    Staging: rtl8192e: Rename variable SignalQuality
>    Staging: rtl8192e: Rename variable isEncrypt
>    Staging: rtl8192e: Rename variable nStuckCount
>    Staging: rtl8192e: Rename variable bAddNewTs
>    Staging: rtl8192e: Rename variable RxBufShift
>    Staging: rtl8192e: Rename variable RxDrvInfoSize
> 
>   .../staging/rtl8192e/rtl8192e/r8190P_def.h    |   2 +-
>   .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  40 +++---
>   .../staging/rtl8192e/rtl8192e/r8192E_phy.c    |  22 ++--
>   .../staging/rtl8192e/rtl8192e/r8192E_phy.h    |   4 +-
>   drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |  14 +--
>   drivers/staging/rtl8192e/rtl8192e/rtl_wx.c    |   4 +-
>   drivers/staging/rtl8192e/rtl819x_HTProc.c     |   4 +-
>   drivers/staging/rtl8192e/rtl819x_TSProc.c     |  30 ++---
>   drivers/staging/rtl8192e/rtllib.h             |  32 ++---
>   drivers/staging/rtl8192e/rtllib_rx.c          | 116 +++++++++---------
>   drivers/staging/rtl8192e/rtllib_softmac_wx.c  |   4 +-
>   11 files changed, 136 insertions(+), 136 deletions(-)
> 


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
