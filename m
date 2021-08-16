Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B5172
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 19:37:28 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id n12so28111634edx.8
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 12:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hWBgaZy/6OsUctviq0mTpGRfIkXffP/uL/sHIzQRKqw=;
        b=LaEUTxeXvM1m0ruw74D8pqZaaZI/GGNETOjvIEV8fw/BiBu7ddzIaQ4kgJlziCVNbI
         tPS8BFwPPrn1X2oLj+gs72hj2ewi8e74tmKsr6ipHcXkXvbesOqljPUAhC5iPudYQDw3
         hkM+NCo+WvmaaC1GRmwYIVU0qsm9h097PVKyvzqGIjVGooLClFvXS/EllvA01Hm2HJLt
         jp1RBQnrvCbrAC5KsaAbPHVNBb/FftXhxoqR7AaSNqUUpAQsb5KU0MWLcFvNgjPmXTgG
         ZFcBRnGOzNOuPeMYiBb0aSvFOqF1phR5/T1sGsYdAbpYMsX+BGNFShs153H0ETbmNX0/
         4BGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hWBgaZy/6OsUctviq0mTpGRfIkXffP/uL/sHIzQRKqw=;
        b=gms8Jk4KiozMSAuFu3PvI9JmjRhCWkpoWL4rRdL80MydjtFu9jiGDFdMZJo2DFzttY
         OQzW3opWJqAUDLizGpHEnCG72UnxYALjz43tyULL+DNmTVvy2hBpripkSAG09CzfV3vA
         SAePGAnzvm73JY4nc+Eq+c+KOKnv6JJDSvaSQbtyOXadFYjSeybZpp56UDEmoEL0hu0I
         Ag6VAVBkYozFr6/KXa5Jd1T96AGYmCK3TqSASm3MtNFP0ECVswZ/3SFKuhJcpccub27l
         WaE+z5BtX0gurwORMkzprfSUBNJudfQHbpjwqqom7XzS/dQMp6AvhfaHJ6FPsP1wAXjE
         EyxQ==
X-Gm-Message-State: AOAM532UMEVQvFlIKcBjo9GIIbcLMcsGXljxybl5k50glGpEiFIrCMbK
	92NQttSce1xObX/cHB9QqYU=
X-Google-Smtp-Source: ABdhPJxdCrIuKYXWhR95PUNP7cr+X72slU1ZspA8KvPxIw0CCWVxTDxBURgHesFPkbw4Vd+qaxpAQQ==
X-Received: by 2002:a05:6402:1d3c:: with SMTP id dh28mr201892edb.257.1629142647171;
        Mon, 16 Aug 2021 12:37:27 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::4058? ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id x20sm58610ejb.100.2021.08.16.12.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 12:37:26 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] staging: r8188eu: refactor
 rtw_is_cckrates_included()
To: Joe Perches <joe@perches.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, martin@kaiser.cx,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210816115430.28264-1-straube.linux@gmail.com>
 <22319347.s0ZA6q4zN9@localhost.localdomain>
 <c30b9e08b7df2bade93d217c0bf6eb4b416eb2ec.camel@perches.com>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <7a09afdb-5f85-0302-0375-93665e2f3f1a@gmail.com>
Date: Mon, 16 Aug 2021 21:36:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <c30b9e08b7df2bade93d217c0bf6eb4b416eb2ec.camel@perches.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 8/16/21 6:15 PM, Joe Perches wrote:
> On Mon, 2021-08-16 at 14:59 +0200, Fabio M. De Francesco wrote:
>> On Monday, August 16, 2021 1:54:27 PM CEST Michael Straube wrote:
>>> Refactor function rtw_is_cckrates_included(). Improves readability
>>> and slightly reduces object file size.
>>>
>>> Signed-off-by: Michael Straube <straube.linux@gmail.com>
>>> ---
>>> v1 -> v2
>>> Refactored to more compact code as suggested by Joe Perches.
>>>
>>>   drivers/staging/r8188eu/core/rtw_ieee80211.c | 9 ++++-----
>>>   1 file changed, 4 insertions(+), 5 deletions(-)
>>>
>>
>> Thanks for redoing the series as suggested by Joe Perches.
>> This is a perfect case where conciseness and readability don't clash and
>> instead the former enhances the latter.
> 
> Perhaps do the whole thing in one go (moving the & 0x7f into the helper
> avoids an early loop exit defect when the rate being indexed is 0x80)
> 

I have sent a new patch that does the refactoring in one go,
so this series is obsolete now. ;)

Regards,
Michael
