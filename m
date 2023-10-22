Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B04FA48
	for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 06:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npTVZvG0"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c506d1798eso7972201fa.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 23:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697957330; x=1698562130; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KHzG31BGHkohJvfifKCRd1NP9UcJjGMJrOEZtVJg0R8=;
        b=npTVZvG0263RUG1MEyjz2T6C1JzE0Y94wjMRwg1XyRjH1T7bQG0GFvGwVphasVbvWm
         pCe63RVI6N3dsRqaio2mJSeBfqmT+X6zgSO9p4Zuino3OwMALGVKWRUoSmyzP5ThFT8y
         gVFA/rRdkKJv/UrX4rYE4yg3PDz67gkoDndZlJbKGtcTgw9HbhY/oKLd+Z5qMuvpO0IN
         mNvJUeBgWkAbf//rAmKQAlc8hB1XHfn6bKDbcK0EPFLbEOPuwvJ6Kb4h6mAKtFa5OcQd
         cISClLcHyWVy1OujaGdNg3+jQCG4HLH9y0X+qp33zS6gCDiJEDJZFxlXWFd++ifuTqGV
         sKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697957330; x=1698562130;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KHzG31BGHkohJvfifKCRd1NP9UcJjGMJrOEZtVJg0R8=;
        b=VowAijzVvK0ruDXozV9YAuv5zm/UjBFU27tmZSStP1XCagf/IADtlzMc+SyNODrcZO
         zWBk3PhudTeT5mVR2DHSpkiobJYCwlVxPh2WdBLivFRgKEDGBa2l7Cg47fPQiQCGoH2+
         d++vNKOWPXb9xlXg4pXPstcIdtj5Y5vSS2bVGcF1uzvcAa3YwqHzF+eIfkcVwDGQ0D24
         WfJ9y5ufe6XU00yS6uvzAiJNw1+f7vPwf3rQ46IxKiQbrw4XVl4SNgTclhvQgaNmDvVS
         AyxqAkfR0xGUnzhd+xN1ROYSqKTtGcx+S0f1+7juNAcwqJig25kB4LQyklfJsTD1olEX
         COTg==
X-Gm-Message-State: AOJu0Yy/m82+5TEKMcZMmuBduX+eJW+zL68gBLDUrJdx7Wtv9xJ5CI92
	0nBbuwV2s0KHsK3GfYaalW0=
X-Google-Smtp-Source: AGHT+IH2B0ncrv4pleagLGpYWsQLTr6JJKfe+Ayd8g59dK0vvOFoJQA2dBoeDBYbN3XOfcng3CfsQQ==
X-Received: by 2002:a05:6512:ad3:b0:502:af44:21c2 with SMTP id n19-20020a0565120ad300b00502af4421c2mr3680310lfu.5.1697957329999;
        Sat, 21 Oct 2023 23:48:49 -0700 (PDT)
Received: from [192.168.0.104] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id n13-20020a17090673cd00b009b65a834dd6sm4649903ejl.215.2023.10.21.23.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Oct 2023 23:48:49 -0700 (PDT)
Message-ID: <1f47714b-4362-47cc-a83c-190b666f748f@gmail.com>
Date: Sun, 22 Oct 2023 08:48:49 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8192e: renamed variable IsHTHalfNmodeAPs
Content-Language: en-US
To: Gary Rookard <garyrookard@fastmail.org>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20231021224051.7443-1-garyrookard@fastmail.org>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20231021224051.7443-1-garyrookard@fastmail.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/23 00:40, Gary Rookard wrote:
> Renamed from Pascal/CamelCase to Snake case the variable 
> IsHTHalfNmodeAPs, IsHTHalfNmodeAPs -> is_ht_half_nmode_aps. Linux kernel 
> coding style (cleanup) checkpatch Avoid CamelCase. Driver rtl8192e 
> compiles. Signed-off-by: Gary Rookard <garyrookard@fastmail.org> --- 
> drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +- 
> drivers/staging/rtl8192e/rtllib.h | 2 +- 
> drivers/staging/rtl8192e/rtllib_softmac.c | 2 +- 3 files changed, 3 
> insertions(+), 3 deletions(-)

Hi,

I assume that now I cannot apply this patch anymore because the previous 
one is missing.

I propose to make a patch series out of the send in patches.
Please do a compile test and and use checkpatch.

Please include in the version change at which version what changed.

Thanks for your support.

Bye Philipp
