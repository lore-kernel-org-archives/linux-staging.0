Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB08B7B
	for <linux-staging@lists.linux.dev>; Wed,  8 Jun 2022 09:34:49 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id b7so9543074ljr.6
        for <linux-staging@lists.linux.dev>; Wed, 08 Jun 2022 02:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Wt4jwJ729Z1cnfmXAe7mWf4AuHpZaK+zbrq+TbEYiBw=;
        b=PvqochYMZDfynfYYKE45DzNEhxM3QRXxLYYCE9aCl2GpRV5MT59qnGp1rDJ0Zu40qm
         aYga+EH/CHQgTUYpkq6JtxBp7C/DnYp1aWsRRnQxLhyxkAyRzLfsMc3P5JEeAvnkC/Xq
         Yl222M/kISKiVQ4cRlDz57PG6LnRTZbCIVdCmYqUoAMbcaXSP3oCKhkdw6V8fJwxgKKu
         t2GPlDnewcDCz9TCyjo9wiEWCOmEVAV+EOeE2LROiM61ZL5UJ4/DwcvGL+bqlICncASX
         uY85oGcDWqwuevmeG5rrh6vfEeY/K58xs35oZCOFyJQouO136TiC4FpMEIbk09vPLgGm
         8cBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Wt4jwJ729Z1cnfmXAe7mWf4AuHpZaK+zbrq+TbEYiBw=;
        b=JDwIAIS4xHHgkK63XttGQc0G+HI0JBThUGer7l+ghpfZl4+CXXbMVjM4gfdkGyv9FY
         S694vC0NdnlLVqZH4p34F0UtTca1P8Thl48mRo99fU9qDhssdvh2IkIf+8BaNLirCDlo
         DpVAa9TUQJyrLzLCQLVqN2sqzevsmCeMgii/9ELDxy0CWHbGm/1kVr9RMQ+Jk0D9JKON
         DXeKDX9P6Iv7L2WOAr78JGc201QZo5mVl16GOe0xmvHkqG4VNLSwFmBEJwgCyybBl2Xf
         nHeleksC8B768RdfqjdRR3UjAlE0FdX+HMrsEhvIdcUe1XHgVzZ4SaKAROdqpTGjC0K2
         lf3A==
X-Gm-Message-State: AOAM530OZ7SBAyR6OoTPyE6tHdFEF+7wfzXYGW/SPE7HEkfE2Jj5hxcX
	txWiJdKEenlvGxnaBTPQcF0=
X-Google-Smtp-Source: ABdhPJwdubS3TXLWHq+L7vaZZzmCKQ5lJzILUbuYzRsE5fpQGm5jWdZKmyNJkL0/poUAbRZsY5byOA==
X-Received: by 2002:a2e:b0d0:0:b0:255:9be1:a472 with SMTP id g16-20020a2eb0d0000000b002559be1a472mr7557098ljl.453.1654680887545;
        Wed, 08 Jun 2022 02:34:47 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.229.27])
        by smtp.gmail.com with ESMTPSA id m16-20020a056512115000b00478f2f2f044sm3625005lfg.123.2022.06.08.02.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 02:34:47 -0700 (PDT)
Message-ID: <01d6737a-9e2d-c009-4e24-c2c54b39b80c@gmail.com>
Date: Wed, 8 Jun 2022 12:34:45 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [BUG] staging: r8188eu: driver stopped working with commit
 ("staging: r8188eu: add check for kzalloc")
Content-Language: en-US
To: Martin Kaiser <lists@kaiser.cx>, Michael Straube
 <straube.linux@gmail.com>, phil@philpotter.co.uk
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220606064055.12565-1-straube.linux@gmail.com>
 <ded4b3f5-a9bc-4612-33cc-68bd85cb92fe@gmail.com>
 <20220608092731.hz26q37fhmrhipmj@viti.kaiser.cx>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220608092731.hz26q37fhmrhipmj@viti.kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

On 6/8/22 12:27, Martin Kaiser wrote:
> Hi Michael & Phil,
> 
> Thus wrote Michael Straube (straube.linux@gmail.com):
> 
>> The driver does not work anymore on my system. In dmesg there is:
> 
>> "r8188eu 1-4:1.0: _rtw_init_xmit_priv failed"
> 
>> I bisected it to commit f94b47c6bde ("staging: r8188eu: add check for
>> kzalloc").
> 
>> ~/kernels/staging> git bisect bad
>> f94b47c6bde624d6c07f43054087607c52054a95 is the first bad commit
> 
>> At the moment I have no time to look further into it.
> 
> See also
> 
> https://lore.kernel.org/linux-staging/YoyU4zXf45UpF1Tq@kroah.com/T/#mb5e56a285b8eb1ebb0e798462fc388cb02b4a7cc
> 
> Phil said in
> 
> https://lore.kernel.org/linux-staging/YoyU4zXf45UpF1Tq@kroah.com/T/#m7a21d460b2569f6b59965ecc3298a6337fa3458a
> 

There is the posted patch [1]. I also have to apply it every time I want 
to test smth.

[1] https://lore.kernel.org/all/20220521204741.921-1-phil@philpotter.co.uk/




With regards,
Pavel Skripkin
