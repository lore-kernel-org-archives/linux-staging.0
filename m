Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563FA1097B
	for <linux-staging@lists.linux.dev>; Tue,  8 Aug 2023 13:05:20 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1bb7d1f7aeaso4386364fac.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Aug 2023 06:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691499919; x=1692104719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HgLj5lJm/YlQTDQrMQmu7EQz+g/56XiBYKu9c5USBBQ=;
        b=ooyvSTRkccdqVzCSnHysynuiAoP+bXBpbvsBOmOjTzSe+rlou2L8AsHn/ESpiXfdAJ
         xKbfUZDV9DUFvURfNRTN2uokTh1Tf109/SJRawcqsulPznu2b1xLfJZ1YLgtv8VZiCwR
         2Z+ksFCBowDforqedjQIH9f8slg7to50MHwMn3FmIiTwNr7ita63zIFMe/0GLkEhpkYg
         j/Gl5iCKxTBMvoBi/0Tnpv9I/TNi7bj6ihU/UNVxGzr++eApyehh9XujG5aolchVZk9T
         CKq4Z9VLSISau5xb/PG5I8dDSASGPJ74HxhBTlY6txFZAls4mYwaikiArCFIkKlhJ+A8
         qXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691499919; x=1692104719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgLj5lJm/YlQTDQrMQmu7EQz+g/56XiBYKu9c5USBBQ=;
        b=Z8hADmQtevKTHj3/5X4jyiF37g/oGPtWP9Zwftfw5ZRVq748BBqIsz88tzspOHRo7B
         1uuuCQkwMqsaIFk1vdjv/g2Z+p4FTMbaFgxGbTEopzUmvvlpLPe0XgLoQnwsjEPiDHam
         mJpAt1A/Y12Xk5LscuaThH1BCXMbErrJIC/34DnQaplcfXxWOg3iwDkDX6+MWY0DhT1N
         EQJlAjvXV/l65nFzF1SDPNxnlTFFd5cCdkI5lF4+0DeEU7IDPobH4jsVC2P9lGwKxGBA
         dYXGL+XbtTokGm62HP6+Su3qmaRJN3UuukMxf3iRJcf/24sTz9oxQaR2isMShURVQhlK
         KRqw==
X-Gm-Message-State: AOJu0YzIHoCNM98SGwoGkSDagvZQBhirabzNEkKQw7IWO7xL5K9ibeER
	pWuhNBDVxcOwYvEDUuKWnPs=
X-Google-Smtp-Source: AGHT+IHavzgGepi9NgzaLKaMkuJ49G6QrqbYLK5SHsTYIkHV/oIL1YFNYDPD5wNeoFg4EzLxcMdVGg==
X-Received: by 2002:a05:6870:e410:b0:1bf:1c49:7453 with SMTP id n16-20020a056870e41000b001bf1c497453mr13036985oag.51.1691499918964;
        Tue, 08 Aug 2023 06:05:18 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:86d6:7871:f7e9:8a15:865a])
        by smtp.gmail.com with ESMTPSA id eb18-20020a056870a89200b001bf3942ea12sm6067502oab.1.2023.08.08.06.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:05:18 -0700 (PDT)
Date: Tue, 8 Aug 2023 10:05:12 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: vme_user: fix alignment of open parenthesis
 and deleted trailing spaces
Message-ID: <ZNI9iGbPjgHLUaGG@alolivei-thinkpadt480s.gru.csb>
References: <ZNFXMrtqSWvZv+rl@alolivei-thinkpadt480s.gru.csb>
 <2023080840-passenger-sierra-55ef@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023080840-passenger-sierra-55ef@gregkh>

On Tue, Aug 08, 2023 at 06:33:07AM +0200, Greg KH wrote:
> On Mon, Aug 07, 2023 at 05:42:26PM -0300, Alexon Oliveira wrote:
> > Fixed all CHECK: Alignment should match open parenthesis
> > and deleted the trailing whitespaces as reported by
> > checkpatch to adhere to the Linux kernel coding-style
> > guidelines.
> > 
> > Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
> > ---
> > 
> > Changes in v2:
> > - Fixed changelog, noted by Greg KH
> > 
> >  drivers/staging/vme_user/vme.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
> > index 977c81e2f3c7..741593d75a63 100644
> > --- a/drivers/staging/vme_user/vme.c
> > +++ b/drivers/staging/vme_user/vme.c
> > @@ -563,7 +563,7 @@ EXPORT_SYMBOL(vme_master_request);
> >   *         returned.
> >   */
> >  int vme_master_set(struct vme_resource *resource, int enabled,
> > -		   unsigned long long vme_base, unsigned long long size, 
> > +		   unsigned long long vme_base, unsigned long long size,
> >  		   u32 aspace, u32 cycle, u32 dwidth)
> 
> I think the confusion here is that my tree does NOT look like your tree
> at all right now.  If I try to apply this patch, I get:
> 
> 	checking file drivers/staging/vme_user/vme.c
> 	Hunk #1 FAILED at 563.
> 	Hunk #2 FAILED at 614.
> 	Hunk #3 FAILED at 1045.
> 	Hunk #4 FAILED at 1841.
> 	4 out of 4 hunks FAILED
> 
> So please, rebase your tree against my staging.git on git.kernel.org
> tree, the staging-next branch, and then resend the patches from that.
> 

Hmm, ACK. I always rebase before commit a new patch, but doing like
this:

$ git fetch origin
$ git rebase -i origin/staging-testing

I'll do it as you instructed.

> thanks,
> 
> greg k-h

Thank you.

Alexon Oliveira
