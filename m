Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C0B7F
	for <linux-staging@lists.linux.dev>; Thu, 24 Aug 2023 20:36:55 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fef29ce3e5so615895e9.0
        for <linux-staging@lists.linux.dev>; Thu, 24 Aug 2023 13:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692909413; x=1693514213;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6VLx9gqSST00IbmllbyFsN5XX88de7SuAeNcazIf2rQ=;
        b=YivTrW26hyzPokaPM8ylWeIkHnW2SeXFMv70ILXcfh8swo1gAxxCOjRS86vhp9D4DO
         uPMeSrmDvaEhXqltnuQxDGdxthqhZXE9ct7Bs6wDbShEDstPVfqvrSIg++isZ7m3vfjt
         U2vfpFg7tubF0dk6AHfk/QsF/ypf387K5r78mMvZ+1mz5mbpaNCwPyhFXhBPeUtJJc6h
         DZR/fkEd/p3wcijsZ3eZrFQFQ/XrqFt6uH5f/vJScgRdJSFC6PmQpViSMlJwDfmfWsZp
         vLwHUFERjkUpQmVRJRRmykzGKA/mi94Gi30QdGt4JVO3ypUAdXOwLIEDFUoaj45gPAyM
         0Ylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692909413; x=1693514213;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6VLx9gqSST00IbmllbyFsN5XX88de7SuAeNcazIf2rQ=;
        b=j+NJFTBJXVH/ljAc4819HAgv+iWG5K027e5PK0xjRk1mRMvUI9AIjceW5G2Yew9dwN
         tHo/jrZ5/7jRlhdn3OOG8gL0yfU0wEWC+PSrivSUsJDbkGgbrjRxcXaDtg1zjK4uV+Dn
         SfwDxyJjUvJ4lfGH2kwUS6/PeABJA5bWWQjtm2OrKSd/Gq3BvtIRycpEeZ+FFMJ470RF
         6bpvJIRhTnrwCgnLR7SKybs/UoIDzj/yFwmlIQFXHvmtKDd6EoFiqCHagL7/ujG5WNOc
         ow1U9KfaD6XcuLB3xUplKWF52IOOyGbpMaP6ocXqHKsXqGmasyPN1xQLjb97sMzdL+EC
         6tyw==
X-Gm-Message-State: AOJu0YwMAjIXHiDTdkLE9k7/QC07Sx+nqhTEhTO0TH8AzsiislV3EfiU
	kyk/36WXW5ma2kn8LR5GUSg=
X-Google-Smtp-Source: AGHT+IEoe6VzFI7+pm+LRjTQr/0e9d0yJJzaviOuyZFdD/POCNB1SDq5ZyGblRp0Ibg9Hw8nq5gkQw==
X-Received: by 2002:a05:600c:1d9b:b0:401:b2d9:d5e6 with SMTP id p27-20020a05600c1d9b00b00401b2d9d5e6mr1002868wms.2.1692909413071;
        Thu, 24 Aug 2023 13:36:53 -0700 (PDT)
Received: from [192.168.0.101] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id m17-20020a5d6a11000000b003142e438e8csm177069wru.26.2023.08.24.13.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 13:36:52 -0700 (PDT)
Message-ID: <c63053be-1852-4966-a5a3-38472d1cca00@gmail.com>
Date: Thu, 24 Aug 2023 22:36:46 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next 0/2] staging: rtl8192e: Do not call kfree_skb()
 under spin_lock_irqsave()
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, gregkh@linuxfoundation.org,
 straube.linux@gmail.com, seanm@seanm.ca, mikem@ring3k.org,
 Larry.Finger@lwfinger.net, wlanfae@realtek.com, linux-staging@lists.linux.dev
References: <20230824074557.1928715-1-ruanjinjie@huawei.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230824074557.1928715-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/24/23 09:45, Jinjie Ruan wrote:
> It is not allowed to call kfree_skb() from hardware interrupt
> context or with interrupts being disabled. This patchset is
> trying to add all skb to a free list, then free them after
> spin_unlock_irqrestore() at once.
> 
> Jinjie Ruan (2):
>    staging: rtl8192e: Do not call kfree_skb() under spin_lock_irqsave()
>    staging: rtl8192e: Do not call kfree_skb() under spin_lock_irqsave()
> 
>   drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 22 ++++++++++++--------
>   drivers/staging/rtl8192e/rtllib_softmac.c    |  6 +++++-
>   2 files changed, 18 insertions(+), 10 deletions(-)
> 


Hi,

for me as a tester I need to have different Subjects. I think I have now 
3 patches with the same subject and a very similar description. Sorry 
How can I confirm which one is tested?

Thanks for your patience.

Bye Philipp
