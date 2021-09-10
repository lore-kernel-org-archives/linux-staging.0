Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142573FC2
	for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 08:12:49 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id bt14so2604087ejb.3
        for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 01:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EOKvDtzwjunGPuQOGKDW/L4dAb4gmvdSgTdv7lJgq8U=;
        b=cfGNT3rSDcav3gXps0yYky3dlzG79x2l0eTNFRhtglIdinRYqMcRUJzeWXcWkNNFGt
         W0jIpB0/6nldv7GCEP3ghRjpKimYurlWywsstZHnOHSGfgX71b2w/o8MFg3x39kNvb5Y
         ooHMORkog7C3K3clgHMtegyRV1TWjfXyx2vL746t4tGIUc0gtWtF+OAibt8GlUihNaXJ
         rNR1Lad7/fmw0nuuLQ4ULnKQDZOmcQgWCu7d309G2MvtlO8ZrfO1EwqJe2pk2fT8SsAN
         zJTZk5xJZ6ehSt69FsVegcgtPzlR3WL2qdpBjNi96YU4l7Ggs8+Lyl0mm5xcgTQkIAhI
         WYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EOKvDtzwjunGPuQOGKDW/L4dAb4gmvdSgTdv7lJgq8U=;
        b=dvwwknqWD5CN0AAQFyiucl3DOxoXHy+t7gEQqju/xYv7vMaYWWPAQBCXn9U2fCuy2X
         /Jdc3RkLgPo8r2EV1A0pGNIXK6diHMvuJu2VOivhbHFCtCm11HbX0DGeovHSNzbFuEso
         AdGCYzmQic96vc/Q8OQH697tBnpBr/kauVN3lw4z1sZsFVn5Zg7s3F+/6ExMoL/nhWPv
         3G8M/DMdG36ivT9uP2MzfPA7/W3HxOJcHVQJU2RcuVTzFc5c0pFmiPQpJyqr5f5Pgmau
         53PHC4s0NGO4TEg8MdLCQQ7Km24NxoGNdufNAvywjnd4cnPLOPytk2RkxSF327dVxL3Q
         FRwA==
X-Gm-Message-State: AOAM530jUpKaTRWuZs7yBV0+fQI9SGVnyowuJ4at/WzS818Z8ChaIHt5
	iFsbBxeu9ZVfipEWhdZan7I=
X-Google-Smtp-Source: ABdhPJzQFKhN+QGRZXluYqzge96WMM/7oQmvVkkK52I3OdFCd0Wo8OM5Dlncb8dAzQ5luCA3Eo+/QQ==
X-Received: by 2002:a17:906:d045:: with SMTP id bo5mr8045221ejb.461.1631261567476;
        Fri, 10 Sep 2021 01:12:47 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::1db2? ([2a02:8108:96c0:3b88::1db2])
        by smtp.gmail.com with ESMTPSA id x15sm2071613ejc.59.2021.09.10.01.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Sep 2021 01:12:47 -0700 (PDT)
Message-ID: <658d7835-810e-19bd-30fa-a54fb0954592@gmail.com>
Date: Fri, 10 Sep 2021 10:12:45 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH] staging: rtl8723bs: remove unused macros from
 ioctl_linux.c
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210909211922.24872-1-straube.linux@gmail.com>
 <d39f410e-ac89-54e1-5c54-a17bdc5ebc49@redhat.com>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <d39f410e-ac89-54e1-5c54-a17bdc5ebc49@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 9/10/21 08:24, Hans de Goede wrote:
> Hi,
> 
> On 9/9/21 11:19 PM, Michael Straube wrote:
>> These macros are not used in the driver, remove them.
>> Found with GCC -Wunused-macros.
>>
>> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> 
> Thanks, patch looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 

Thanks for reviewing.

Regards,

Michael
