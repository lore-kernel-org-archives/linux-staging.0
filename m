Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431912CA1
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 14:06:00 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id c14-20020a17090a674e00b001b31e16749cso21353958pjm.4
        for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 06:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Tubj8rkVkPl1wCBaxRTVTlD7YNEjq/CLeIFitBFiSuQ=;
        b=TtR+qs0MSWgris7H9jdZHVmw1NAAP0JUlqB4QBzBdAglAYHdZI6ffkAWT6Va3MFTwK
         EweBV2RpkGKtPrAs8i6bBKXdGKEfUV6av6pmF7qtP41oaIQoikR6C4Bj2SlkLYXZA87d
         JVvItZKW6jFjzdZY+/Uck3o0nMHGd32onvCPPgo/7n3Mn59aShoSDCSJSlePDoRt5R6X
         qrbH+l6Cm42r857N1lWTZczBQLVJJRyXb2oDdGeTekIgE2+SpBhh7TvV/LPoBpzvDykV
         m3UHMadm/woWPX4SD+pBIZSFr4+kl580Vf9yeYUj2CcvEjwaMOSpoVe5eK1Yi6CVDWUq
         p4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Tubj8rkVkPl1wCBaxRTVTlD7YNEjq/CLeIFitBFiSuQ=;
        b=wY1mSwfPzZEtoRd4aaem4JAyebD4xQesxhqyte9jyA4XLwZfyTj3j1XPtQIKTwRjAt
         rqYDjCkvOd2jnvVE/JT4UwITwz9DDZfA8giSFDkThEHNDK2+NpexMt2UfqfyfXrS4iM1
         twVQ0cGMqa+cw86Q70mMCw3Y4gQuViZSo5aBL1Vh+4xAUaLSlWYrISI6GKw3qedZBTyt
         WcnZFKFQ+SFkdFgdejDiFLQ35cz+Bp0mTOM0zNppTkgUbAcBDJM1nal72vdcqC1x2DRI
         h1D6KdDFifoRWkTsOZxFbCk+iuBbZKEmt4j2tDivQ1QHGVj1+KB3amEOeAEItjbc8xiV
         0GLg==
X-Gm-Message-State: AOAM532zqyZ7gL9+ufWOxOX6eg0KI9tY3p5ewksxxJPtVDVFJaRN5too
	WOeSXQES91LhnPTGHpjvQSw=
X-Google-Smtp-Source: ABdhPJwql8omBiavavkUx+zk2CZnSLhJYLlChhSGXPHj1wEIFrTFNKsbEgsPpa0RU30tOvjmQcFqrQ==
X-Received: by 2002:a17:90b:4012:: with SMTP id ie18mr3403419pjb.43.1641823559787;
        Mon, 10 Jan 2022 06:05:59 -0800 (PST)
Received: from realwakka ([59.12.165.26])
        by smtp.gmail.com with ESMTPSA id 198sm5667731pfy.202.2022.01.10.06.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 06:05:59 -0800 (PST)
Date: Mon, 10 Jan 2022 14:05:55 +0000
From: Sidong Yang <realwakka@gmail.com>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: enforce tx_cfg to be set before any
 message can be sent
Message-ID: <20220110140555.GB27767@realwakka>
References: <20220108222652.GA11883@mail.google.com>
 <20220109154950.GA27767@realwakka>
 <20220109190552.GA2928@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220109190552.GA2928@mail.google.com>

On Mon, Jan 10, 2022 at 08:05:52AM +1300, Paulo Miguel Almeida wrote:
> On Sun, Jan 09, 2022 at 03:49:50PM +0000, Sidong Yang wrote:
> > On Sun, Jan 09, 2022 at 11:26:52AM +1300, Paulo Miguel Almeida wrote:
> > 
> > Hi, Paulo.
> > Thanks for the patch.
> > I have some opinion below.
> 
> thanks for taking the time to review my patch :)
> 
> > > this driver relies on exposing a char device to userspace to tx
> > > messages. Every message can be sent using different trasmitter settings
> > > such so the tx_cfg must be written before sending any messages.
> > > Failing to do so will cause the message to fail silently depending on
> > > printk/dynamic_debug settings which makes it hard to troubleshoot.
> > > 
> > > This patch add a control variable that will get initialized once tx_cfg
> > > is set for the fd used when interacting with the char device.
> > 
> > I don't know that adding flag is good idea. It seems that initializing
> > to default is better than this.
> 
> the reasons why I thought that the flag was a good approach is because of
> these points:
> 
> 1 - it returns an error to userspace to help the developers 
> troubleshooting what is missing/required to make a message to be
> successfully tx'ed. Unfortunately, once the message is in the chip
> queue, there isn't much that the user can know so, from my humble point
> of view, any way we can avoid hard-to-debug problems, we should.

I understood that you mean that user has difficult to debug when it
write message before initializing. If so, user would get debug message
that some tx_cfg members are invalid. I think the point is which message
would be useful for debugging. 'Some member is invalid' or 'tx_cfg is
uninitialized'. I think the latter that you said is more accurate than
before one. I think it make sense.

> 
> 2 - rf69 work with multiple frequencies (315,433,868 and 915MHz) in which
> acceptance varies from region to region. Essentially, picking 1 default
> frequency may be ideal for one place but not right for another.

Actually, I don't have idea about this. I want to know that how to other
module like this handle this. 

Thanks,
Sidong

> 
> Let me know if you agree with my train of thought above and if not,
> share with me your point of view.
> 
> thanks,
> 
> Paulo A.
> 
