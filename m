Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53332C80
	for <linux-staging@lists.linux.dev>; Fri,  5 Nov 2021 17:18:43 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id gt5so3496101pjb.1
        for <linux-staging@lists.linux.dev>; Fri, 05 Nov 2021 10:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wzufjbDqGxDa2/k86ie4tw8Pdx0MnDOAPtjEE+yOjpY=;
        b=dQ9hk9G7njRsxD1PZLshA+qzst9HtFIjOrwfqVOpZkhjgpbH3ZJ15Wa2K3G+FvZceL
         hf9sPs/iug5gJ3B9H67sqfOaURp09a7LS2rrhl4ggSk+Br7zwF/uGsygQNe1d8ZVeTif
         H6iSveVskAIqdwAyK/IZZXBAqjTxcutW6bTlXsqQXBYOWEw8r/SX/f84SW9LiXyKEJRj
         0jTKQFwP0OqkOUvWJbtwbG4fNqX+gXZBd2s3f7E5c0a3OTPRe/8Gg5gjWwdZoighFEc0
         pRfCo9ZaDYlIGw26xPbQ0Lq8+xl58P9AyLd2TgQwNYDaZ5wdrn3MsFPMLE9EY6n4ZmUY
         pBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wzufjbDqGxDa2/k86ie4tw8Pdx0MnDOAPtjEE+yOjpY=;
        b=l9BoGfqDvK1OubMGGu/YKgdSTOMRTVulNMo5jglat9J18CPKA2lQYX14Ar2SOW0y+h
         ub2kM6oOk/L/KFzjPL4IEkthCF9bUbXhDANs4SnSKfDPonjHDbCNU0cTI8ZeBdhoh2nC
         DYZ5OtcL/RsNpnxH9gJY2OcBmhCHL8/oRylQN8P3mBFs6xWNX4PziOsc0bqPoh43J2Wz
         3c9O79DY/N8elYSbhDhYwAuTyBiLpQx2YIi9WYtypLuAFTATn+kBUiHz/Uk7i7K5RDw+
         8O37nWeymKYkpGtU+c984cHXzoRaJc50gJukV79YKjD9GG5W57Hh1iYyivSR+DFEVBzK
         /XDA==
X-Gm-Message-State: AOAM530cU1qWIgV9OgpD8HhoF2HrQh1QO5zuiwcff2SUggiISrcY02S2
	Rozb/zHmItMH5kWdUd0u8xw=
X-Google-Smtp-Source: ABdhPJytey5AouVICCVDk82iHij/AVBq1i2JZ5+cq79HqLAUse2Ke4aYg8gr5O0k/fTERlBtekAIKw==
X-Received: by 2002:a17:90a:be10:: with SMTP id a16mr30954933pjs.133.1636132723242;
        Fri, 05 Nov 2021 10:18:43 -0700 (PDT)
Received: from [192.168.1.2] ([59.95.82.141])
        by smtp.gmail.com with ESMTPSA id l1sm7758035pff.125.2021.11.05.10.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Nov 2021 10:18:42 -0700 (PDT)
Message-ID: <9bc5a088-2cdc-1bbd-6459-d1b95e25aa9c@gmail.com>
Date: Fri, 5 Nov 2021 22:48:34 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH v2] staging: r8188eu: os_dep: remove the goto statement
Content-Language: en-GB
To: Pavel Skripkin <paskripkin@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 straube.linux@gmail.com, martin@kaiser.cx, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, saurav.girepunje@hotmail.com
References: <YYKvWeyqd71pYSqM@Sauravs-MacBook-Air.local>
 <YYT/LibxFzssNUJN@kroah.com> <ecf6ba8e-8273-0d77-5ceb-3ad44179d3a3@gmail.com>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
In-Reply-To: <ecf6ba8e-8273-0d77-5ceb-3ad44179d3a3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 05/11/21 4:06 pm, Pavel Skripkin wrote:
> On 11/5/21 12:53, Greg KH wrote:
>> Right after this, ret8 is set, but never checked, which looks like a bug
>> to me.  Can you work on fixing that after I take this patch?
Yes, I will send a patch removing a local variable for return value and changing 
the return type of function rtw_init_default_value . As rtw_init_default_value always return 
success and the return value of this function is not checked.
>>
>> thanks,
>>
>> greg k-h
>>
> 
> ret8 is returned from this function, but as I said [1] it can be just removed. It will be always set to _SUCCESS.
> 
> 
> 
> [1] https://lore.kernel.org/linux-staging/f26b4aec-c0a1-8c93-b34e-8b1a36ac81b3@gmail.com/
> 
> 
Pavel also mentioned to remove the local variable ret8.
> With regards,
> Pavel Skripkin

Thanks,
Saurav
