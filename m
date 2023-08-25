Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65B817E8
	for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 05:47:47 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-31c66b7da88so99865f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 24 Aug 2023 22:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692942466; x=1693547266;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xnFJwaSc8RMd8LM7uqcLA2ZQmKE9plAOwmZT8o533ck=;
        b=Wqigs+s0BGqRIPWPvngEeU7TjPM7wzJF4abyi7B8R6B/s9zFeZ4vtUvXsbVLHT2N+z
         nuM6Bk9W865kwvVqEOa58J3UcXxcTbvsO03rSyC97by8ME4iPW9z2BlWRpDX21qstCGS
         z07TB8h9NkeRVLOpwN7CA9ZFyJO+LGj/rT5r4+aovjutTsV3PjtHiQtNIvQoTmzmdeW/
         Zosp6T0VKEN+8AyS+9rXeg43g3Y2B1jO1YsCSXUJSPLnq+SN+Qbo9+EIb0eTnmd7gc0E
         WIPHetk1WNc8mPuhqB7yoxArVPBTfoEOT5GkvYx9lQU+7bMuYj59vWMVPj23rhzlkfPs
         W+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692942466; x=1693547266;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xnFJwaSc8RMd8LM7uqcLA2ZQmKE9plAOwmZT8o533ck=;
        b=dasQiXoONFWONA0UCafePRo63stF4JxLUDy6I3/A6xfe+nMbG08oZmHqBgQkWs11hs
         oiNn33l2UpyNh/JfX/NiUQuMrMU7AHOmVJT1PH0yjv9hMnzpfff3Sry4UW7qUsL89YMI
         uN2IfkiiIvXNyYBLlcdtzqqxuxy7YUwg5WBQkq79bl2LQKkiS1Lq4iyoHljdElGM0pEV
         ttwoY9hweaUFCHZG8fc2NA6a75sYrifMOR4tkveE0lvkEMuwpLLqIiAXcPZ+sWcY3Bgd
         9fGBxfPtBzfoPQvz5+HxCnFTwN7PUMd1K9IqMoG3RabUyDPzXADRCbtuGOASJ9copxCM
         gauQ==
X-Gm-Message-State: AOJu0YwXxItvxRwBjQ20NQzUvt6aBo8HlRRT3HhqyGHkRtb43W1/EYEi
	XzJiYMvutP6JIqNiyvL81c4=
X-Google-Smtp-Source: AGHT+IEzJKxzzj4jfsrOv1wT7COpBqTri0tOlXTOzJHS+7ze590Gqy3UK6AB+iHnDPUG0oABk+IUDA==
X-Received: by 2002:adf:e543:0:b0:319:7624:4c8d with SMTP id z3-20020adfe543000000b0031976244c8dmr13458884wrm.0.1692942465683;
        Thu, 24 Aug 2023 22:47:45 -0700 (PDT)
Received: from [192.168.0.101] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id w4-20020a5d6804000000b0031c77c010e1sm1106826wru.96.2023.08.24.22.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 22:47:45 -0700 (PDT)
Message-ID: <45f6dbe0-e603-7c31-6d6c-04083e595d7d@gmail.com>
Date: Fri, 25 Aug 2023 07:47:44 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next v2 0/3] staging: rtl8192e: Do not call kfree_skb()
 under spin_lock_irqsave()
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, gregkh@linuxfoundation.org,
 straube.linux@gmail.com, Larry.Finger@lwfinger.net, wlanfae@realtek.com,
 mikem@ring3k.org, seanm@seanm.ca, linux-staging@lists.linux.dev
References: <20230825015213.2697347-1-ruanjinjie@huawei.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230825015213.2697347-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/25/23 03:52, Jinjie Ruan wrote:
> It is not allowed to call kfree_skb() from hardware interrupt
> context or with interrupts being disabled. This patchset is
> trying to use dev_kfree_skb_irq() or add all skb to a free list, then
> free them after spin_unlock_irqrestore() at once.
> 
> Changes in v2:
> - Combine the three patches into one patch set.
> - Update the commit message and subject prefix.
> 
> Jinjie Ruan (3):
>    staging: rtl8192e: rtl_core: Call dev_kfree_skb_irq() instead of
>      kfree_skb() under spin_lock_irqsave()
>    staging: rtl8192e: rtl_core: Do not call kfree_skb() under
>      spin_lock_irqsave() for _rtl92e_irq()
>    Staging: rtl8192e: rtllib_softmac: Do not call kfree_skb() under
>      spin_lock_irqsave()
> 
>   drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 24 ++++++++++++--------
>   drivers/staging/rtl8192e/rtllib_softmac.c    |  6 ++++-
>   2 files changed, 19 insertions(+), 11 deletions(-)
> 

Patch number 01 is missing. Patch number 2 and 3 are OK
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
