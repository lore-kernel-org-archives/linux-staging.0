Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB583FC0
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 10:38:54 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id u22so26084386lfq.13
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 03:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1NFaB1vrGY395t3LmMNK1Kr2EpLKYOnHDpfQxxhGX0I=;
        b=nCstrLpgzGRl7acokaU4Pjzz55z8v+eLAuqIh5jd1+cMUtquWDu1IywFrt+keSDTrN
         saeff9V3w0F9lSgtEhZvfgLpPE3Osr1SGNZnCNJBbkICwwjnypwFjycXZJlL+U8WeY2P
         22hPW9Z9SkQ8jFpVQhESg34qDjhlTs+/MN/hLb3fdM4kNG5+FckfrtpVgsVeXQJJwkMc
         +zf9HiK3F0qIfa9oDclYMAIsdt/XLHOh0faV8oo9Sc7fxL0vGmyuIzXjcwCugyCgqW/T
         QQMRfqz4yOwbCqGv4Gs9DbzzPPc/Uva1BInLx3mAmoZWux3FAHNSkBXnfyJHKGOCRQlx
         RKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1NFaB1vrGY395t3LmMNK1Kr2EpLKYOnHDpfQxxhGX0I=;
        b=YKJfQo+k7Sf3GttYEumSLiNEKxojlNBWGQldFKWVgOABJqCgZ3qG96RlypYwu1E5qe
         5PT5Ni42elw9LmsrRJTLgT+8gPhdFF3+4/UtaiZwEwwbZ2il5YI5tHvnb/dBqZ9waUl9
         pnNvaLAB86rV4/XlBsCq6QFQ/mGGUhRYWhcqb8HPnqZvnSE92SOIP5CZBDq0Ls6qcJIH
         +KQOmodVGsP8r/GftDulFGPybu5VNcmG64Xpa96EW2GOAhN6J/is41AmFb468PQSQZUB
         8rZ4loYpQC3btjqem06oiA2eiCApTfp/KgYT5sK6pXhYUneSSOxrfUHrHkktuQwBZp+0
         XZsQ==
X-Gm-Message-State: AOAM532kRa2oAqP3Pe2zIpFSBXidZXMsNivhphwNaOGe5UAIdj5CxGDL
	mt+TY8gNtGuPcv2b5kXgucQ=
X-Google-Smtp-Source: ABdhPJwOEVPDoonCEJrpty94tMJuVsuKAzBx998wD9s1rTHc5GSujYZQwTh9td89hoxVEdUkJWkfKQ==
X-Received: by 2002:a05:6512:2202:: with SMTP id h2mr18086137lfu.658.1629542332321;
        Sat, 21 Aug 2021 03:38:52 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id s3sm429547lfe.288.2021.08.21.03.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Aug 2021 03:38:51 -0700 (PDT)
Subject: Re: [PATCH RFC 3/3] staging: r8188eu: add error argument to
 read_macreg
To: Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Larry.Finger@lwfinger.net, gregkh@linuxfoundation.org,
 straube.linux@gmail.com, fmdefrancesco@gmail.com
References: <cover.1629479152.git.paskripkin@gmail.com>
 <44a5a4ab2eae8e0deb969028a5488ea892008c8d.1629479152.git.paskripkin@gmail.com>
 <1590e1abf3991c4b9023173bddee5b9e912d2c47.camel@philpotter.co.uk>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <7f54ca0a-a413-7284-7501-7b1ba1b19609@gmail.com>
Date: Sat, 21 Aug 2021 13:38:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1590e1abf3991c4b9023173bddee5b9e912d2c47.camel@philpotter.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 8/21/21 2:18 AM, Phillip Potter wrote:
> On Fri, 2021-08-20 at 20:07 +0300, Pavel Skripkin wrote:
>> Since read_macreg() calls rtw_read*() internally we should tell
>> callers about an error on the read side.
>> 
>> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
>> ---
>>  drivers/staging/r8188eu/core/rtw_mp.c    | 9 ++++-----
>>  drivers/staging/r8188eu/include/rtw_mp.h | 2 +-
>>  2 files changed, 5 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/staging/r8188eu/core/rtw_mp.c
>> b/drivers/staging/r8188eu/core/rtw_mp.c
>> index 601a1fd5d4e7..6bbea1cc364a 100644
>> --- a/drivers/staging/r8188eu/core/rtw_mp.c
>> +++ b/drivers/staging/r8188eu/core/rtw_mp.c
>> @@ -7,20 +7,19 @@
>>  #include "../include/odm_precomp.h"
>>  #include "../include/rtl8188e_hal.h"
>>  
>> -u32 read_macreg(struct adapter *padapter, u32 addr, u32 sz)
>> +u32 read_macreg(struct adapter *padapter, u32 addr, u32 sz, int
>> *error)
> 
> Dear Pavel,
> 
> Correct me if I'm wrong, but this read_macreg function seems to be
> completely unused by the rest of the driver. Rather than changing the
> signature to do error handling, maybe it would be better to just remove
> it?
> 
> That is just my view though, would be interested to see what others
> think - perhaps it could come in handy at some point.
> 

yes, this function is unused for now, but I am aware about plans for 
this function :) If no one has plans for it, it can be removed.


With regards,
Pavel Skripkin
