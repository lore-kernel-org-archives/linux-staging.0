Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424AD72
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 16:17:41 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id g8so63538989edt.7
        for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 09:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=meii394rMMf2+VExFEXSq/fznMv+auld/8Avcma/sHI=;
        b=cmGMkAr6TS7S/CzOvMjyO/b7QjbdCwatc5lDFr3/G86GkPxwPJ6NllRsN+oyv0GHQJ
         5eaoOLoqQhkIxtUbj1UNboHefrAHkAfvgljZx/9MTgKVe3BrJRyv2xzxgiP0UG3nYhFD
         dJTuyqnXyfat5I1k8IxMhfZ0kFNjGHSntReoEOo42M6Nt7LHa65Hwpj62RyBOujy5x3o
         qsn/TDrF6A2BDPVoEO3o7xQ8442/F/qMVfn6ioKSSJtLPgVAIm+NioJOdEsWHq21907N
         tkgg2uBCgsRZ/ic41BHh1HbV/uyLWswp5fNcq1vTBTYhPBWgZ6R6ENy85EVFcCXZ7ony
         QyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=meii394rMMf2+VExFEXSq/fznMv+auld/8Avcma/sHI=;
        b=6lwj8yV47DL2Q60xr6fLwoDtWOUyIIHSwRh23sOXVYa7zhJtp56nWVknsGZBKntBPR
         yRXmBKJh8qFF4B7RFiVS0ZVrF3uwrA7cdXdwDLKV5p1T4eVNv2cOz2NVxlwSsDSRNlfe
         SfHRxkclKHDmgnFjMQqOM2eODZO0unh6lBY4Pmu6R9OJQLMMHenLUZzRjW+sevRuQ/5w
         I3gHELN4tbk6mc9hyXG6NOgPUgvN6x95WnUESL6NxvZrPg2sov084M4qP0uZktsj6Tm+
         ErjhKrASvxcY3YAxMciyO9no+ACB7R8z34218//u/FzIEKjBo1coi/V5rhnpZ/RitStx
         8Z2Q==
X-Gm-Message-State: AOAM5321C95d03akcWd8P5+plxAKDk3jiiIWEQAWthySwIH32aX5DnHA
	OPGC4uOQebN6Cj2j/lHYAno=
X-Google-Smtp-Source: ABdhPJyZMdLpVQZjzOTFIYwbbFIlvQXRcpF6cZiTl/MqSRY0DHPtpDGSFKP3jq0VoUy8mshxvKvKww==
X-Received: by 2002:a50:bf4a:: with SMTP id g10mr11848420edk.11.1632154659434;
        Mon, 20 Sep 2021 09:17:39 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id di4sm7301437edb.34.2021.09.20.09.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 09:17:38 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, David Laight <david.Laight@aculab.com>, Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH v8 15/19] staging: r8188eu: change the type of a variable in rtw_read16()
Date: Mon, 20 Sep 2021 18:17:36 +0200
Message-ID: <3187315.KoBY3qX4Pt@localhost.localdomain>
In-Reply-To: <20210920131036.GR2088@kadam>
References: <20210919235356.4151-1-fmdefrancesco@gmail.com> <48009934.f5uHuSIIb1@localhost.localdomain> <20210920131036.GR2088@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, September 20, 2021 3:10:36 PM CEST Dan Carpenter wrote:
> On Mon, Sep 20, 2021 at 03:03:44PM +0200, Fabio M. De Francesco wrote:
> > On Monday, September 20, 2021 1:56:47 PM CEST Dan Carpenter wrote:
> > > On Mon, Sep 20, 2021 at 01:53:52AM +0200, Fabio M. De Francesco wrote:
> > > > Change the type of "data" from __le32 to __le16.
> > > > 
> > > 
> > > You should note in the commit message that:
> > > 
> > > The last two bytes of "data" are not initialized so the 
le32_to_cpu(data)
> > > technically reads uninitialized data.  This can likely be detected by
> > > the KASan checker as reading uninitialized data.  But because the bytes
> > > are discarded in the end so this will not affect runtime.
> > > 
> > > regards,
> > > dan carpenter
> > > 
> > 
> > Dear Dan,
> > 
> > Thanks for your suggestion about this specific topic. 
> > 
> > We thought that, since "data" is in bitwise AND with 0xffff before being 
> > passed to the callee, it was enough to have reviewers know why we're 
doing 
> > that change of type with no further explanations. Actually it seems to be 
not 
> > enough to motivate that change.
> > 
> > We will surely use the note you provided. 
> > 
> > However, since I'm not used to blindly follow suggestions (even if I 
trust 
> > your words with no doubts at all) without complete understanding of what 
I'm 
> > doing, I will need to understand what KASan is before copy-paste your 
note.
> 
> Google is your friend!

Yes, it is :)

I think you were referring to the KernelMemorySanitizer (KMSan), a detector 
of uses of uninitialized memory (but it seems to not be upstream):
https://github.com/google/kmsan

Instead you wrote about the The Kernel Address Sanitizer (KASan) that seems 
to be a dynamic memory error detector designed to find out-of-bound and use-
after-free bugs (this is upstream):
https://www.kernel.org/doc/html/v5.0/dev-tools/kasan.html

Can you please confirm?

Back to the code... uninitialised data is not a problem in the old code, it's 
just bad design. The new code cannot affect runtime, it's just better design. 

There's no change in runtime behaviour because of different protection nets:
Aside from the bitwise AND that truncate that variable two the size of two 
bytes and set the higher bytes to 0, memcpy() inside usbctrl_vendorreq(), the 
new usb_read() and usb_write uses memcpy() with count = size (and size is 
checked also in rtw_writeN()). 

I can't see any bugs. Just bad design, that we fix and possible sanitizer's 
warning, that disappear with our fixes. Am I right?

Thanks,

Fabio


> 
> Either way reading uninitialized data is generally bad.  The trickier
> thing is showing that your changes don't affect runtime.  For both of
> these le32 to le16 changes.
> 
> regards,
> dan carpenter
> 
> 




