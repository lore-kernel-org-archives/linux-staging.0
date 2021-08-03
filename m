Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8A370
	for <linux-staging@lists.linux.dev>; Tue,  3 Aug 2021 11:06:36 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id 26so9832390oiy.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Aug 2021 04:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uUCMsyWVC5nqDt+/pqXl+IAnxIIadmdGAWl6iK82XkQ=;
        b=pHGEN430fPFq577eTfEEJ/NxMt/7LmXFXeurWJv4SI3xPyUA69XqxNxJuI4YGHYsa3
         AZgs9i5AJ6Nhm8qdEaHR51SkZJ2l5H+8HBtFoXet/F+O0b/A28pwgghP44Wgd6a2FUZK
         +32vbOfZOiXSWn8bVYY862TR+MS5STiSqBVbixpgQkVYAVCBAYwUbdjAWDVIol9O1pXc
         HQTKeMZkDcBnT1oHtBSLO8tEA3RmhkKf/L2P4OCEk2ytbjAFxK/IVZNiuAL9n9+5IeBe
         64PvNzs93tsgBNfsZOt9+dN66KEP1u8LypyQkmGcIDQcw2vdNgm2GRDPz7i+bpPRXcxx
         P3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uUCMsyWVC5nqDt+/pqXl+IAnxIIadmdGAWl6iK82XkQ=;
        b=o6XojyXxNXZj9+7vldyzBwlqpWKrrOyt7XBFMOXlkqonw4CnF44CwK6isxCz0MNG2S
         akRgMW1BvUhJQlsZ2M/uEain2k7yaIZWdxIjmfOaJFoHZ2W8Sag10xHWI+gRJA29NZl+
         KkI/o36FLC5Y3LMjDp6iDRanGv2EHOmQF2eC68T4hBFUn/opsbVrnKVa+nSDHSDWWr7Q
         86xzcRAC9+K/8sqx7nPy3msEQ9SLO+DgUEKxkqKdZvutK6IcA013nMFdPIQ8UNSAoGs8
         1zQX5kR5uXVvRzA6AaeOCI3nJa4K9D4UHzdkEWsPLlPauK95YZP5c1AZop8mUKcyY16X
         n/qg==
X-Gm-Message-State: AOAM532/y7ucvsyzGXDzoppb1wiq/ta1o8/5R/ORrEOUTSzAdhoelZGS
	4WO7FU/wNICFNVW6Op2b7aU=
X-Google-Smtp-Source: ABdhPJygUKdOxCVVuEgHQp7Q0u4U5nfxIyXQ6vnHRcQ28N4gAV66JxiHI25ikJUnPJ7AlNVmgZzArw==
X-Received: by 2002:a05:6808:188a:: with SMTP id bi10mr14346372oib.73.1627988795500;
        Tue, 03 Aug 2021 04:06:35 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-1010.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-1010.res6.spectrum.com. [2603:8090:2005:39b3::1010])
        by smtp.gmail.com with ESMTPSA id c2sm2192783ooo.28.2021.08.03.04.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Aug 2021 04:06:34 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update STAGING - REALTEK RTL8188EU DRIVERS
To: Phillip Potter <phil@philpotter.co.uk>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 kernel-janitors@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210803071811.8142-1-lukas.bulwahn@gmail.com>
 <CAA=Fs0=V_gcfDUxn1m9OkR78cht0S=j02BsHajG1A3vuGTqQJw@mail.gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <5e1c7274-61c8-87fd-a281-11d9e7cbbfb4@lwfinger.net>
Date: Tue, 3 Aug 2021 06:06:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAA=Fs0=V_gcfDUxn1m9OkR78cht0S=j02BsHajG1A3vuGTqQJw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/3/21 3:56 AM, Phillip Potter wrote:
> On Tue, 3 Aug 2021 at 08:18, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>>
>> Commit 55dfa29b43d2 ("staging: rtl8188eu: remove rtl8188eu driver from
>> staging dir") removes ./drivers/staging/rtl8188eu, but misses to adjust
>> the STAGING - REALTEK RTL8188EU DRIVERS section in MAINTAINERS.
>>
>> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
>>
>>    no file matches    F:    drivers/staging/rtl8188eu/
>>
>> A refurnished rtl8188eu driver is available in ./drivers/staging/r8188eu/
>> and there is no existing section in MAINTAINERS for that directory.
>>
>> So, reuse the STAGING - REALTEK RTL8188EU DRIVERS section and point to the
>> refurnished driver with its current developers and maintainers according
>> to the current git log.
>>
>> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>> ---
>> applies cleanly on next-20210803
>>
>> Philipp, Larry, please ack.
>>
>> Greg, please pick this minor cleanup on your staging-next tree.
>>
>>   MAINTAINERS | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 36aee8517ab0..ef32c02b3e4d 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -17723,8 +17723,9 @@ F:      drivers/staging/olpc_dcon/
>>
>>   STAGING - REALTEK RTL8188EU DRIVERS
>>   M:     Larry Finger <Larry.Finger@lwfinger.net>
>> -S:     Odd Fixes
>> -F:     drivers/staging/rtl8188eu/
>> +M:     Phillip Potter <phil@philpotter.co.uk>
>> +S:     Supported
>> +F:     drivers/staging/r8188eu/
>>
>>   STAGING - REALTEK RTL8712U DRIVERS
>>   M:     Larry Finger <Larry.Finger@lwfinger.net>
>> --
>> 2.17.1
>>
> Sorry, not sure how I missed this :-)
> 
> Acked-by: Phillip Potter <phil@philpotter.co.uk>
> 
Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

