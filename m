Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491652C83
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 11:43:06 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id u18so35756382wrg.5
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 04:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=w43DUiLVu811xq4h9m7lzBE38oZ98PZ1zshE3bWj7o8=;
        b=DbFlZLiG0MN0WOZuyaG/l8Si2MvzjNcxOd4FdBV9pm/jJLgBiD0xgZowc3Z3BIj9cl
         dWzNFrr8BnpSJSr8SoajqBQCR/pca6u4gg7mvhn1R9e3EgzYtBjrRSJXPHV3YtzSYVji
         G5OL00Y0XWRfOsdpiQm6XUiFens0IobzI8ukYjgbLR+P0tlo/hUE4NSJXRk5JGaRPFY3
         CaiX8wzBBHw0AFG6KUo4Ez03jklEQEDKSLkFz2qSvtYeE7dfzTaGTkDfmme8IS5DM1id
         0dhsEKHhfBS5VzxLtY1HMmh2l8UDBQ0fw1NfEis2K0RW228H4ZfIGEsRpYt2kT/6ZnfK
         z1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=w43DUiLVu811xq4h9m7lzBE38oZ98PZ1zshE3bWj7o8=;
        b=AEZH5cEI2cnW8SXc3B3hbsIHfYYhqBK+BpykkKxUfS/Bm1SvUOYwF0DyDosowU+/D5
         3RtPPUGl+KcmJ7evC1L9r3nBvfyq0xxC+CJhGysKwzHOhpW6ZrvRox5oxwWDraTrBxYE
         XEgxtTvTpVlUGFWeUahEmzO6CwiUvyhOlwX7Xtx5iO3IPtUboDgUG7tbPBuoKvpwHfZp
         OcdLajSdYI1FK7P24OvoLNOgWbHeaz+TkkgN+7YwMES+fqu1YrjwRK4ZQUO5RobZdTDi
         v6rlVaAbp5uHg1M73OwfYfoymU9xjcWJI/Y2ciH1QQ+g64ebnbytZg6X34u3qy0HiBCX
         7beg==
X-Gm-Message-State: AOAM530uR5rOAbA/a6h4sTafZV3QLtewbi260IVFpnaI7OEW/Tv24GjE
	y0MWRLv9z0VpPgTkO0iv1c8=
X-Google-Smtp-Source: ABdhPJw+wMcjBrWpM02et9VFMg3YLgHJHyeU2EXD50X3FyZPqcg4zj9rtPL9pEND3JNan09AJajmSw==
X-Received: by 2002:adf:a411:: with SMTP id d17mr28486301wra.393.1634470984667;
        Sun, 17 Oct 2021 04:43:04 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::d7f0? ([2a02:8108:96c0:3b88::d7f0])
        by smtp.gmail.com with ESMTPSA id 25sm15967705wmo.18.2021.10.17.04.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Oct 2021 04:43:04 -0700 (PDT)
Message-ID: <4531a88c-2b35-e409-b7f9-cb4253c9c708@gmail.com>
Date: Sun, 17 Oct 2021 13:43:03 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] staging: r8188eu: remove unused constants and variables
Content-Language: en-US
To: Martin Kaiser <lists@kaiser.cx>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211017111705.18989-1-straube.linux@gmail.com>
 <20211017112356.b4dwrrxfcgwskhy3@viti.kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20211017112356.b4dwrrxfcgwskhy3@viti.kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/21 13:23, Martin Kaiser wrote:
> Thus wrote Michael Straube (straube.linux@gmail.com):
> 
>> Remove some unused constants and variables that are left over from
>> previous cleanup patches.
> 
>> Suggested-by: Martin Kaiser <martin@kaiser.cx>
>> Signed-off-by: Michael Straube <straube.linux@gmail.com>
>> ---
>>   drivers/staging/r8188eu/hal/odm.c          |  8 --------
>>   drivers/staging/r8188eu/hal/odm_HWConfig.c |  3 ---
>>   drivers/staging/r8188eu/include/odm.h      | 17 -----------------
>>   3 files changed, 28 deletions(-)

> 
> 
> Hi Michael,
> 
> Looks good, thanks.
> 
> Acked-by: Martin Kaiser <martin@kaiser.cx>
> 

Thank you, Martin.

Greg, I forgot to mention that this patch should be applied on top of
the series.

[PATCH 0/7] staging: r8188eu: odm cleanups

Thanks,
Michael
