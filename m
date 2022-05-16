Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BDA1376
	for <linux-staging@lists.linux.dev>; Mon, 16 May 2022 19:49:53 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id 4so19387873ljw.11
        for <linux-staging@lists.linux.dev>; Mon, 16 May 2022 12:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oEm9ampsAj6VYW+tU85zYMzzZx02BGFqtMSM4mOG0tA=;
        b=U7buNOqjUYJdNpQY9YuQfPTXQU2kJGI1JMCwJZzffMIpfmu3+CAsXURRP0Wq/dLHqL
         WxwHP1Y5UswHg8kl376kfFpvpJmM0vqWNIgVooqhmpJG3MLFaIYiLABLpUSHY4ynbB6b
         jDUogzUaKfR288AQWZtLAqP0p87zqNpPeWszfciItxfQ69oyuVrO7zz+oybO7smE+BKG
         0xKf/qAwJDAs5YFYYjsM/DEeYn6uwBcz7bMNZPGWd3dQqcIFngSplVgHVoEdzyOyeL4C
         OB/60doqNZWpioNGkrwf+rBeckB5hzqMp2x4AOyrviPhUFQyH6fdNtPw5jiitY3KOWDA
         Kh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oEm9ampsAj6VYW+tU85zYMzzZx02BGFqtMSM4mOG0tA=;
        b=wdLJL0CqaWmMX42Zxt3J8TaEAPTcgiB54rsQKcEdaDT+kzrHQPG3YhIR+DnqYpTCFc
         fTWD+MGXShQVwYFexs2mgjZ487QQKDm5+UyNwzvJFViv/J9rQjY01UZNxXMA/dL1UBtm
         y7NVLLwKllTrPSciwOzS9HwpTy4Rj6smI566gcxg/qjXE1j71EIG814Q7tFSPbpg0CVp
         cEW+MVK5PwwRZ94K0mbYXKq5JvujeRslS6wC9aGOOqdl+JTqwZLl4aOMrStbC0nEX6Tu
         dH0Cfe47uU++gVBh8+XvS5O1dQ8YwPtC62jonNAYtOx0Ovq6Dn/AD017+aPm5zw23rxH
         KDVw==
X-Gm-Message-State: AOAM532TamMU72a/uK03/lx0cmcOgDCUCtnAKx59rRFpJl7/pYerlg0D
	BjG2ibHTdc/9o3m35iyeBIY=
X-Google-Smtp-Source: ABdhPJzj4kqsOgk+3Pmh9rw0qnfBHTmwH2zkabyF2JtWUfp4tC2MsFuwkJI+p0hvrqs5l+xyK9fwYw==
X-Received: by 2002:a2e:b5d1:0:b0:24f:331d:f9b6 with SMTP id g17-20020a2eb5d1000000b0024f331df9b6mr12066365ljn.302.1652730591843;
        Mon, 16 May 2022 12:49:51 -0700 (PDT)
Received: from [192.168.1.11] ([217.117.245.216])
        by smtp.gmail.com with ESMTPSA id r13-20020a2eb60d000000b0024f3d1daea8sm1659956ljn.48.2022.05.16.12.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 12:49:51 -0700 (PDT)
Message-ID: <8142ad15-1fdc-10f8-86f2-fb275cb6cd39@gmail.com>
Date: Mon, 16 May 2022 22:49:50 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/3] staging: r8188eu: fix checkpatch.pl warnings
Content-Language: en-US
To: Vihas Makwana <makvihas@gmail.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20220516170306.6008-1-makvihas@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220516170306.6008-1-makvihas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vihas,

On 5/16/22 20:03, Vihas Makwana wrote:
> This patchset fixes following checkpatch warning:
>      WARNING: Comparisons should place the constant on the right side of the test
> 
> Compiled tested only.
> 
> Vihas Makwana (3):
>    staging: r8188eu: fix checkpatch warnings in rtw_p2p
>    staging: r8188eu: fix checkpatch warnings in rtw_pwrctrl
>    staging: r8188eu: fix checkpatch warnings in rtw_wlan_util
> 
>   drivers/staging/r8188eu/core/rtw_p2p.c       |  8 ++++----
>   drivers/staging/r8188eu/core/rtw_pwrctrl.c   | 12 ++++++------
>   drivers/staging/r8188eu/core/rtw_wlan_util.c |  2 +-
>   3 files changed, 11 insertions(+), 11 deletions(-)
> 
checkpatch warns about the subjects. See an example for 1/3, but it's 
related to all 3.

> WARNING: A patch subject line should describe the change not the tool that found it
> #4: 
> Subject: [PATCH 1/3] staging: r8188eu: fix checkpatch.pl warnings in rtw_p2p
> 
> total: 0 errors, 1 warnings, 0 checks, 32 lines checked




With regards,
Pavel Skripkin
