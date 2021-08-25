Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8C73FC0
	for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 13:45:16 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id z2so24061104iln.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 06:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XVnwmb3uXk8+1b5/nov/HrYkqSqNgLeJ1iqRG3io5N0=;
        b=RQtGz41gdrHxJMSAR/9QsLqlxfSrX0hrSv7IbjruEEyWUYs0PDiNVtbcrdh86ZyG+k
         +u2CTpspyxSEDvNfXSzc+xiQsIO1akPDNkmpJD3ROH96aJbuyqkRhpqL584tmJEKke+b
         pywRAzsBSyWapg/6RA9iOO5t2CIuBxhbq7qCw2oj6TzE5jwk0RWNIT8b0PlI8/2niq3/
         x92u9l3DxfEchPc7CvO8+LNk7+TXcSEnFdD0ugkpgu7BdJHjSSi4R8Tpf/WsEphDzEwC
         O6Txj9pNNU9xUO9ChILv4MSeQQBo9C6H0fjgdcJMeh9MuDya6THtIVsKEI5qsuzmdS27
         2zUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XVnwmb3uXk8+1b5/nov/HrYkqSqNgLeJ1iqRG3io5N0=;
        b=SvhiWdHaPn2zuewnX5TP1Und0Fw9vHPJAIEitFKQkG0zBz73bOFT3crjqzEnhcByj+
         dr+j3lpVu5po8JzxXrk9jS8+xKfWNJlCVqWdTZrdaaCl+ijWOnOkFDehxo3HLOkBQoL+
         mUkyYkc33eCvfnlHg8iN9s+H07O6hJf1PEfVP6GMG5tP9NL3bM38hjAH5A4v+XuuZ+Hg
         KB68eUI2BmqTPobGz4VQ0Ye8kHrn9Vj8vFfK7lG36VTrksV2obvSN8JzS+tjkdvnMbLB
         rPXWKRZlm7CF+yOg+lgf+V7KzJ7Fe9qXfQY8lWEreBJyl3dGS0XXDcuUBvXfjY2quCDX
         IurQ==
X-Gm-Message-State: AOAM532saJyvk3AifK32DV4VbpTJc66uA0LLvHvMTiuP4rHOnxplMsgb
	4fWNrNao+mdbvvSHejneE+ssgA==
X-Google-Smtp-Source: ABdhPJwNusjSb6QKB8DsRhuL2iL/qaGyFgeDyXoTeRFLXrUNExbto5enJ6RAGiTXnrs6B+7jby7tBw==
X-Received: by 2002:a05:6e02:13f0:: with SMTP id w16mr29929619ilj.268.1629899115683;
        Wed, 25 Aug 2021 06:45:15 -0700 (PDT)
Received: from [10.10.10.120] (047-035-132-030.res.spectrum.com. [47.35.132.30])
        by smtp.googlemail.com with ESMTPSA id k2sm11685057ior.40.2021.08.25.06.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Aug 2021 06:45:15 -0700 (PDT)
Subject: Re: [greybus-dev] [PATCH v2] staging: greybus: Convert uart.c from
 IDR to XArray
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Alex Elder <elder@ieee.org>
Cc: kernel test robot <lkp@intel.com>
References: <20210814181130.21383-1-fmdefrancesco@gmail.com>
 <5541b638-db1e-26f2-2682-81f35504c9a3@ieee.org>
 <1838037.Ul9q4Z07vA@localhost.localdomain>
From: Alex Elder <elder@linaro.org>
Message-ID: <335f30c7-8ab4-d46a-d415-e994997a3fa5@linaro.org>
Date: Wed, 25 Aug 2021 08:45:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1838037.Ul9q4Z07vA@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/25/21 12:20 AM, Fabio M. De Francesco wrote:
> On Monday, August 16, 2021 4:46:08 PM CEST Alex Elder wrote:
>> On 8/14/21 1:11 PM, Fabio M. De Francesco wrote:
>>> Convert greybus/uart.c from IDR to XArray. The abstract data type XArray
>>> is more memory-efficient, parallelisable, and cache friendly. It takes
>>> advantage of RCU to perform lookups without locking. Furthermore, IDR is
>>> deprecated because XArray has a better (cleaner and more consistent) API.
>>
>> I haven't verified the use of the new API (yet) but I have a few
>> comments on your patch, below.
>>
>> 					-Alex
> 
> Dear Alex,
> 
> On August 16th I submitted the v3 of my patch ("staging: greybus: Convert uart.c 
> from IDR to XArray"), with changes based on the comments you provided.

Yes, I intend to review version 3.  I'm sorry I didn't respond to
your earlier message; I am on vacation this week.

					-Alex
> 
> Could you please take a few minutes to review this too? I would really appreciate it.
> 
> The v3 patch is at https://lore.kernel.org/lkml/20210816195000.736-1-fmdefrancesco@gmail.com/
> 
> Thanks,
> 
> Fabio
> 
> P.S.: I'd also like to know if you think it's worth converting IDA to XArray in order 
> to improve the Greybus driver in staging.
> 
>   
> 
> 
> _______________________________________________
> greybus-dev mailing list
> greybus-dev@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/greybus-dev
> 

