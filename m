Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F9F642;
	Mon, 18 Apr 2022 04:49:30 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id f14so935095qtq.1;
        Sun, 17 Apr 2022 21:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5SG/uB7T142OQUIjICdWajAAfAseL7YmThekvKPfi0E=;
        b=admhyFNSjNGjU+ImFYKyb6KMfHgNUzv5SUhhxXB/SzMcXNf1k/qF3fp70zQsrrj6nA
         mpR1N4IjdwoXSWHykFO/Kyn9dbXBcSwszkobPT8DnWYVm7gqnuMyfYv0fKRxC6jeoQRW
         p9ji7B8qKMWXK0QRNqSBSSmmL2BCJbcEVcPM5+cwPN+X8KizAxvUZtCYj5DFjzavRTfa
         oT9yT82bydSz6Wdlnja3w5ChGKkofdjSyMe2+KvRyUgxk7LwYPiS/kN+/j0Xm1/uENHr
         gDkEM282QUxWV7dNDqsDas18ziMGsiAin4zoKk3x+QRXU5JvxDNmT0j0WIAlE5vOh+/h
         2CPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5SG/uB7T142OQUIjICdWajAAfAseL7YmThekvKPfi0E=;
        b=7ffhXuQoLghe6hCUF61axBO7OsNqTJu7PP1Al77pG73VqmAhtCmDpaElydZD0EAsJO
         tGun87UwNq+RrI8YuubMyocVES4YezJVkxYgohFnKod8khCbDIs0QH112CN8qVuc1Vpe
         QEFdti5FcexJpdBYpFUgZwULd+CuNoP+7MBUmB6RWr4hrUL4S9E3WQDjBR1vAyXhxwQ5
         k6Wfd/qAlXhRI6xX3pA2SsrwmJHvi0iOS1hUlf5YGkGy/U8tvQaTSv+P/hS6+wuAzzLp
         t9RuuzMybllNnXChceFjFbmj1/6tOXs20ZdyYJ5Q9Po8bITRDo7zDRlCOUYZJ2Ry3Poy
         n4bw==
X-Gm-Message-State: AOAM530PC8NVMxlkOcLCFszTEGZzSDK3otj1QbIBt5EiZihw+mUWvL1d
	es4C8ZlgGM8nZXeDNlgrApE=
X-Google-Smtp-Source: ABdhPJyo07c3vJzDwY9bMiuMmeLFMHPoERzSLbmTmALIlxvR18J3513T9EAM3gjgG8uT0Jj29H3hIw==
X-Received: by 2002:ac8:5d8c:0:b0:2e1:e196:326a with SMTP id d12-20020ac85d8c000000b002e1e196326amr5962593qtx.475.1650257369079;
        Sun, 17 Apr 2022 21:49:29 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([2607:fb90:50e6:61ed:4df2:ed9f:52ea:476e])
        by smtp.gmail.com with ESMTPSA id g4-20020ac87d04000000b002e06b4674a1sm7305955qtb.61.2022.04.17.21.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 21:49:28 -0700 (PDT)
Date: Mon, 18 Apr 2022 00:49:25 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Pavel Skripkin <paskripkin@gmail.com>, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v2 1/6] staging: r8188eu: remove unused member
 free_bss_buf
Message-ID: <20220418044925.GA1127014@jaehee-ThinkPad-X1-Extreme>
References: <cover.1649990500.git.jhpark1013@gmail.com>
 <a28f445f-f088-620e-6baf-4cad3e1a8146@gmail.com>
 <20220417204200.GA236965@jaehee-ThinkPad-X1-Extreme>
 <3164900.aeNJFYEL58@leap>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3164900.aeNJFYEL58@leap>

On Sun, Apr 17, 2022 at 11:13:50PM +0200, Fabio M. De Francesco wrote:
> On domenica 17 aprile 2022 22:42:00 CEST Jaehee Park wrote:
> > On Sun, Apr 17, 2022 at 11:16:38PM +0300, Pavel Skripkin wrote:
> > > Hi Jaehee,
> > > 
> > > On 4/17/22 23:14, Jaehee Park wrote:
> > > > My understanding of Pavel's response is the free_bss_buf member of 
> the
> > > > pmlmepriv structure wasn't being used anywhere and that the
> > > > rtw_free_mlme_riv_ie_data function frees the memory of the pmlmepriv
> > > > structure so the second check is redundant.
> > > > 
> > > > However, as Fabio said, the free_bss_buf member is being used and 
> pbuf
> > > > memory is not being freed.
> > > > So I'll revert the patch as it was originally (which was just 
> removing
> > > > the {} around the single if statement).
> 
> No, Jaehee. This is not what I said :)
> 
> > > > 
> > > 
> > > Why just `pbuf` allocation can't be removed? This memory is just 
> unused,
> > > isn't it?
> 
> What Pavel said is what I said, but using a different argumentation.
> 
> > > 
> > > 
> > > With regards,
> > > Pavel Skripkin
> > 
> > 
> > The free_bss_buf member is unused.
> 
> Correct.
> 
> > So it can just be removed right?
> 
> No.
> 
> 
> > I guess I'm confused by what Pablo is saying about causing a memory 
> > leak
> 
> A memory leak is caused when you allocate some memory and then you lose any 
> reference to its address so that it cannot be freed. Right?
> 
> > by getting rid of the pointer to the memory allocated by pbuf.
> 
> No.
>  
> > Sorry if I misunderstood. 
> 
> No problem. Let's rewind...
> 
> "pbuf" is assigned with the address of some memory allocated with a call to 
> vzalloc(). Since "pbuf" is a local variable, you see that the above-
> mentioned address is stored in free_bss_buf using the line "pmlmepriv-
> >free_bss_buf = pbuf". Is it clear?
> 
> Well, you decided to delete the line that calls vfree(pmlmepriv-
> >free_bss_buf). At this point you have that memory leak.
> 
> Pavel noted that pmlmepriv->free_bss_buf is unused, but it contains the 
> address of a region of memory that was allocated for no purpose.
> 
> Therefore, a correct patch should also remove the allocation that was made 
> using kzalloc(). If you merely remove the line with vfree() you cause a 
> memory leak.

Hi Fabio, Thank you so much for explaining this so patiently!
This makes sense. I'll remove the pbuf vzalloc. 
I think I was having trouble because of of how pnetwork was defined
in this function. I'll have to think a little more about how to 
intialize it.
Thanks,
Jaehee

> 
> Please don't revert your patch. Just fix it with a new version that also 
> delete the line where "pbuf" is assigned with the value returned by 
> kzalloc().
> 
> I hope that now I've been clearer.
> 
> Thanks,
> 
> Fabio
> 
> > Thanks,
> > Jaehee
> > 
> 
> 
> 
> 
