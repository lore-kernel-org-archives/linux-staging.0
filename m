Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B6E2C81
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 11:00:02 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id p21so11468985wmq.1
        for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 04:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=LRkSXvKU2H3yNWwYA1Dskm2+OrbMFIykkcsNX7x6JHY=;
        b=Zt2uGQFq89/yImCzTMOWBObDDJ+N0WvJuq2vzZdU7jm5QFQ2bWNIwpcpk8ntJm4ObN
         c32YtN4Q6/M5U1hWk1mk1q1NMyyNhngTCvObm87r56pGDyZZISgO8okr84/D8n+jCrlo
         d6zbLFYEIedMaf832hRSwdhxMtj6LSCM0yFOadMoZiupMSHA/IWjs10H3i2rcY+wJeGh
         ZnVfasLZ+BrlNdMBQ9FAgJg7MLwz41pM8ZUz1W7vSZMQEQEBpjJ87ewcogAAhov6qLb3
         03Xb5ahEFx2wR7J9gYU2PRQONGhN6VOo/ZFKoMhR9IBkrA6jc3RLJRsaniZZGaFOc9Tw
         wgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=LRkSXvKU2H3yNWwYA1Dskm2+OrbMFIykkcsNX7x6JHY=;
        b=J0x6p8KyfFvkPOqQdNqaXvB9ObJpx+M+CekBa3ccpGbMv854cXdz5p6Z9il/1LqRZH
         l9UahzTTUlhBf3K700hTtQ1VQL8xYaBEHX7k9QwvOin773izKTd+V3t+as5wL/mLnlb7
         kLmjdSC4MHkPgiOGFFBIIW0Z7zeYRqXDIeUSzkLGDJu+A/2Rzm1VSlxchnjcvfWyec4n
         DsThWLjaB5Nizry3hQI18oYQ6ozMgOOPXulMrIpX7uGvyAHcxtmnKNSAbC3vNGPuoRmf
         p7V+seoou9fMPdH9Q2aW1AjZoJu1lEX8ch0opG84UUiAv3hbvSc0cRtx6c6XbbQHIA16
         FeWQ==
X-Gm-Message-State: AOAM531wpT8XY32Qo8Hy/BIyv9udiB42u/S/txGJ7O7mH57lv5EKZntE
	E5zegju2XMzNDynP3hJoEfg=
X-Google-Smtp-Source: ABdhPJwgtsT9xA/ypF8QJmoBh1ux1sOfUKyjGJHXsWAnhKW7ahbqyu4PvzrB9hSizgmpl2IS5SYkTw==
X-Received: by 2002:a7b:cf03:: with SMTP id l3mr5210548wmg.25.1634641201313;
        Tue, 19 Oct 2021 04:00:01 -0700 (PDT)
Received: from ?IPv6:2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62? ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id v3sm15097529wrg.23.2021.10.19.04.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 04:00:00 -0700 (PDT)
Message-ID: <810a4e29b0c54520a30cae4d37fde0a59ea3d83b.camel@gmail.com>
Subject: Re: [PATCH] staging: vt6655: Fix line wrapping in rf.c file
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: Joe Perches <joe@perches.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy-kernel@googlegroups.com, forest@alittletooquiet.net, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Tue, 19 Oct 2021 11:59:56 +0100
In-Reply-To: <84f3c940fedb961e6e7e88d47c3d15e598bc32c3.camel@perches.com>
References: <20211018150526.9718-1-karolinadrobnik@gmail.com>
	 <YW2O3wC8wMEKS3Ub@kroah.com>
	 <84f3c940fedb961e6e7e88d47c3d15e598bc32c3.camel@perches.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Thank you very much for your comments.

On Mon, 2021-10-18 at 17:12 +0200, Greg KH wrote:
> Also, these are all just fine as-is for now.  A better way to make
> these lines smaller is to use better variable and function names 
> that are shorter and make sense :)

I have v2 ready but I'm not sure, given the Joe's patch, if my solution
is a satisfactory one. I didn't jump on such refactoring as I'm still
learning about the codebase/process and didn't want to muddle the
waters (...more than I do already).

Greg, what would you prefer? Should I back up with my patch, pick
something else and let Joe's patch be merged?


Also, I have a question about the patch if that's ok :)

On Mon, 2021-10-18 at 22:56 -0700, Joe Perches wrote:
> Maybe some refactoring like:
> ---
>  drivers/staging/vt6655/rf.c | 38
> ++++++++++++++++++--------------------
>  1 file changed, 18 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/rf.c
> b/drivers/staging/vt6655/rf.c
> index 0dae593c6944f..7beb0cd5a62df 100644
> --- a/drivers/staging/vt6655/rf.c
> +++ b/drivers/staging/vt6655/rf.c
> @@ -680,16 +680,19 @@ bool RFvWriteWakeProgSyn(struct vnt_private
> *priv, unsigned char byRFType,
>                          u16 uChannel)
>  {
>         void __iomem *iobase = priv->PortOffset;
> -       int   ii;
> +       int i;
> +       unsigned short idx = MISCFIFO_SYNDATA_IDX;
>         unsigned char byInitCount = 0;
>         unsigned char bySleepCount = 0;
> +       const unsigned long *data;
>  
> +       uChannel--;
>         VNSvOutPortW(iobase + MAC_REG_MISCFFNDEX, 0);

I see that you introduced `uChannel--` to further tidy up the lines
with `[uChannel - 1]`. In general, is there anything wrong with
indexing like `i - 1`? What's the preference here? DRY things up as
much as possible?

I'm asking because when I was reading this line, at first, it wasn't
clear to me why we could decrement it (example though: "Was this
modified earlier? Do we need to "correct" it?").


Thanks,
Karolina


