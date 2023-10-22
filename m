Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E1217E6
	for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 07:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZuaoHUX"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-507f63fcbf6so131903e87.1
        for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 00:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697960857; x=1698565657; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8EMvpJh0VDsbsM5SOLOEYs5sCE72VwDjjpNXErS0zPo=;
        b=hZuaoHUXeGutjEC8q9YjjQllCJ/IWTamkWhgyadO5E5VivOobcu5BJBgHtZ8m4st81
         fOUezf/uRQkpzIR8dhETf1LMPBZwP09FB9+dB862dXozcHTsPbobPqFP6PF+T9zNHx3u
         FXZNWOs6llog+clu+xdA6gH3J5f/H0Hfwyd11oV0CVn5ffLj/JNBFvPpYjtenVixVtCh
         660bObyiWI1t/DR+H5dFrpSN4aOCB4K4Ofj/Ne2KtEsrXWAhRhiPzbonrYD+ussn6iQj
         E/ztDdC8uDWwvVEc054A2xPp07cR8m/fIa0JdRkzIA2kwJNI3UREroG6Frj2rNNBPZ3w
         /z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697960857; x=1698565657;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8EMvpJh0VDsbsM5SOLOEYs5sCE72VwDjjpNXErS0zPo=;
        b=RYJD8VywtgacYtB7Obm9OrNydwP+9Y29f8l0MnYed2pcXL+3vssBULJGW2Bzfvzogq
         /NsSi1V9ZMkaDIt5T6bOPNDcs4k0/riGf/G3vBO2sxrqLsssnROfG6KYI3mT5ZqbEjMB
         2loOYLYpkmUevwyOW/BPlmQx/D2SyyFEiMbu1txPpP/pnEVcQtpGymLT0ALHAbjJcmCs
         LqsCOpG6HFAyG5INW3kmNWB/I/7s55JtFX1yfq7SgEKiN5HDZVai0CJcb+ni/7c9ae3o
         2EhoypCFRKRhetIRJMRKxN5ONWH9T1JZWcftpNnvKcjIWOStBU5XHERedVu2+QT1rlrl
         g4kQ==
X-Gm-Message-State: AOJu0YxqvGiFmW6ZMeN5tYbNHUowx+qHs59788I/ELf0imSRcHZn1HPf
	F47pKE/P9Rqz2PWDbT9+Fp4=
X-Google-Smtp-Source: AGHT+IEKqrm0VQMSa6yXVdiNx6SW44iEegXrbLulsxSuaW+bxQVebWyuLQ23+ToKszH4iEOuXuMKXQ==
X-Received: by 2002:a05:6512:e95:b0:503:2dcd:30ed with SMTP id bi21-20020a0565120e9500b005032dcd30edmr4258900lfb.0.1697960857142;
        Sun, 22 Oct 2023 00:47:37 -0700 (PDT)
Received: from [192.168.0.104] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id s16-20020a170906bc5000b009b95b46bbd1sm4680320ejv.133.2023.10.22.00.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Oct 2023 00:47:36 -0700 (PDT)
Message-ID: <070529f5-b0ff-4cbb-af3e-28984616a821@gmail.com>
Date: Sun, 22 Oct 2023 09:47:36 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8192e: renamed variable IsHTHalfNmodeAPs
To: Gary Rookard <garyrookard@fastmail.org>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20231021224051.7443-1-garyrookard@fastmail.org>
 <1f47714b-4362-47cc-a83c-190b666f748f@gmail.com>
 <aa578599-cd87-4c3a-8040-03ab065d8482@app.fastmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <aa578599-cd87-4c3a-8040-03ab065d8482@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/23 09:32, Gary Rookard wrote:
> Sorry, but I do both compile and checkpatch, but they seem to be 
> failing, don't
> know why yet. I've been using make M=drivers/staging/rtl8192e after a 
> complete
> kernel build at make -j3, I'm changing it to Make drivers/staging as a 
> matter of recourse.
> gcc version 13.2.1 20230826 (Gentoo 13.2.1_p20230826 p7)
> 
> I use checkpatch unflaged on the patch, never a problem before...
> 
> On Sun, Oct 22, 2023, at 2:48 AM, Philipp Hortmann wrote:
>> On 10/22/23 00:40, Gary Rookard wrote:
>> > Renamed from Pascal/CamelCase to Snake case the variable
>> > IsHTHalfNmodeAPs, IsHTHalfNmodeAPs -> is_ht_half_nmode_aps. Linux 
>> kernel
>> > coding style (cleanup) checkpatch Avoid CamelCase. Driver rtl8192e
>> > compiles. Signed-off-by: Gary Rookard <garyrookard@fastmail.org 
>> <mailto:garyrookard@fastmail.org>> ---
>> > drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
>> > drivers/staging/rtl8192e/rtllib.h | 2 +-
>> > drivers/staging/rtl8192e/rtllib_softmac.c | 2 +- 3 files changed, 3
>> > insertions(+), 3 deletions(-)
>>
>> Hi,
>>
>> I assume that now I cannot apply this patch anymore because the previous
>> one is missing.
>>
>> I propose to make a patch series out of the send in patches.
>> Please do a compile test and and use checkpatch.
>>
>> Please include in the version change at which version what changed.
>>
>> Thanks for your support.
>>
>> Bye Philipp
>>
> 

Hi Gary,

please use:
make -C . M=drivers/staging/rtl8192e

I am using checkpatch as described here:
https://kernelnewbies.org/FirstKernelPatch
"Git post-commit hooks"

Please always reply with Bottom Posting. You used top posting which is 
not liked by the community and maintainer.

Bye Philipp
