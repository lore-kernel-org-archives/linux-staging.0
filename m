Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3183FD2E4
	for <linux-staging@lists.linux.dev>; Tue,  5 Sep 2023 12:16:38 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3ff1c397405so24603285e9.3
        for <linux-staging@lists.linux.dev>; Tue, 05 Sep 2023 05:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693916197; x=1694520997; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UVZ4IhpuWUBQYC4A4LmAUr3Si51pAWARBYnsxVyQYyE=;
        b=nZdS56DUSxoukTGp5KLqiG2KYYYQDXrtUenofyyWJpQLM7A6Fnz2T2F7h/EL5Q7Vc/
         sSs0CNieEgzb3BVNVNve3DtMVdwxDmsAVCumlsYQseSe9Ng4vBxubaPmwJE2n0dQIvaj
         9jl2B3NLdbhXrTKckoCmDGb54sZINehV7IT31pGe0sSrW6csfbgzXpNLXiBHzbFk1bbA
         o8NrTe2d6ATACNKLMhHAqPCiCfOD9bdGvmHdApYyF4N2Cr9hOHrBXvzC8xTIOoGT9X+m
         6An4a+EMlnfGoo9j5Aovnje8G48iMdsuh+XYnNqecsbbaNQKCjwbyBw/NfulMwno1oGV
         PJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693916197; x=1694520997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVZ4IhpuWUBQYC4A4LmAUr3Si51pAWARBYnsxVyQYyE=;
        b=IaVT8B20Hk0VAMYuh/6Atj1343u0SAo+3hO+c1RK4s5611gFr/LrQYUasDZA2jdsXq
         mtIhOBZFdYfMQHcLbUjXPu0r1k7gfD2KTJequaLftDtki4dU3Zy0YURmbC+icuzsxe/Y
         eiKHYk2UwHmvinUza/i7AU0CitC4oqH9ZYdTPxx9RTckiXDp32Kc0ww1owdrhmDjiagF
         bVEFFK5+R6EgwFtGxDoDS0fghb2Fc7O+I07Snodgyb0oomYf5adrzCwB7Kh0yUqmwtKf
         JLxJVuscLbqL3di7zHj2nvk+TRLRvIVMF3tRUNe1HzvJqwFyNFFE6BvJFnKicz4MxJva
         b2ww==
X-Gm-Message-State: AOJu0YwK+4A/UYKojeG5nd6fTMhPa/Yz1DK2D8WV0DT38zEbsj+yIJmg
	Cltb1LIE2jZC3DxLVodSDiP5kg==
X-Google-Smtp-Source: AGHT+IEsUaBNMCPDmRiiPaC8nlqh0Nlifn9O86Pmmiyl2b726uet4Xk1jAtQtaNADryFpA0pSvT0ng==
X-Received: by 2002:a5d:4082:0:b0:313:e456:e64a with SMTP id o2-20020a5d4082000000b00313e456e64amr9659210wrp.21.1693916197082;
        Tue, 05 Sep 2023 05:16:37 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y13-20020adffa4d000000b00317df42e91dsm17489798wrr.4.2023.09.05.05.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 05:16:36 -0700 (PDT)
Date: Tue, 5 Sep 2023 15:16:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, gregkh@linuxfoundation.org,
	straube.linux@gmail.com, Larry.Finger@lwfinger.net,
	wlanfae@realtek.com, mikem@ring3k.org, seanm@seanm.ca,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH -next v2 0/3] staging: rtl8192e: Do not call kfree_skb()
 under spin_lock_irqsave()
Message-ID: <1ec0ca03-c8e5-4e6e-8838-25a3b6bd2d1e@kadam.mountain>
References: <20230825015213.2697347-1-ruanjinjie@huawei.com>
 <45f6dbe0-e603-7c31-6d6c-04083e595d7d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45f6dbe0-e603-7c31-6d6c-04083e595d7d@gmail.com>

On Fri, Aug 25, 2023 at 07:47:44AM +0200, Philipp Hortmann wrote:
> On 8/25/23 03:52, Jinjie Ruan wrote:
> > It is not allowed to call kfree_skb() from hardware interrupt
> > context or with interrupts being disabled. This patchset is
> > trying to use dev_kfree_skb_irq() or add all skb to a free list, then
> > free them after spin_unlock_irqrestore() at once.
> > 
> > Changes in v2:
> > - Combine the three patches into one patch set.
> > - Update the commit message and subject prefix.
> > 
> > Jinjie Ruan (3):
> >    staging: rtl8192e: rtl_core: Call dev_kfree_skb_irq() instead of
> >      kfree_skb() under spin_lock_irqsave()
> >    staging: rtl8192e: rtl_core: Do not call kfree_skb() under
> >      spin_lock_irqsave() for _rtl92e_irq()
> >    Staging: rtl8192e: rtllib_softmac: Do not call kfree_skb() under
> >      spin_lock_irqsave()
> > 
> >   drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 24 ++++++++++++--------
> >   drivers/staging/rtl8192e/rtllib_softmac.c    |  6 ++++-
> >   2 files changed, 19 insertions(+), 11 deletions(-)
> > 
> 
> Patch number 01 is missing. Patch number 2 and 3 are OK

I recieved it.  It's there on lore.  But I too am having some issues
with a bunch of dropped patches recently.  I don't know what caused it.

https://lore.kernel.org/all/20230825015213.2697347-2-ruanjinjie@huawei.com/

regards,
dan carpenter

